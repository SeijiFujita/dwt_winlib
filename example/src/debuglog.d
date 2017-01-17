// Written in the D programming language.
/**
debuglog.d
output debuglog


void dlog(Anyarg...);
void dlogCond(Anyarg...)
void dlogDump(void *, uint, string);

Source: dlog.d
License: Distributed under the Boost Software License, Version 1.0.
Authors: Seiji Fujita

Compiler: dmd.2.070.0 / windows

実装済み
------
.引数をログファイルに出力します。
	dlog(anyValue...);

.dumplog は16進ダンプをログファイルに出力します。
	dumplog(cast(void*)dumpAddress, uint dumpSize, string Comment)

.出力するログのファイル名は実行形式のファイル名に<exeName>_debug_log.txt
.同名のログが存在する場合は追記(append)します。
.

未実装ねた
------
.タイマー機能 ---- 常時起動しているDaemon のログが取れるように
.config.conf を読む事により動作の変更が行える
---- ログ出力のON/OFF
---- ログローテーション--巨大なログを作成しないようにログファイル名を日付け毎に

その他
------
debuglogの名前案
 debug module 
 minilog
 虫眼鏡
 mushiMegane
 Loupe
 magnifying glass 虫眼鏡/拡大鏡の英語
 
 Debug Loupe
 
 Debug Log System
 DLS
 
 
 
ファイル直接書き版
バッファリングして終了時にディスクに書き込む版

module 名はどうするか？

 debug log system for buffer
 dls.file
 dls.buffer
 dls.console
 dls.window

****/

module debuglog;


import std.string : format, lastIndexOf;
import core.atomic;

/// Enable to the debug log
version = useDebugLog;

///  Add a DATE to the log filename.
//version = useFilenameAddDATE;

/// Write directly to the file.
//version = useDirectWrite;

// Module Test
//version = Module_TEST; 


/// void dlog(string file = __FILE__, int line = __LINE__, T...)(T args)
/// void dlog(Anyarg...)
void dlog(string file = __FILE__, int line = __LINE__, A...)(A args)
{
	version (useDebugLog) {
		dLogMemBuffer._outLogV(file, ":", line,":[", getDateTimeStr(), "]", args);
		// add getpid
		// dLogMemBuffer._outlogV(format("%s:%d:[%s:%d]", file, line, getDateTimeStr(), getpid()), args);
		// dLogMemBuffer._outLogV(format("%s:%d:[%s]", file, line, getDateTimeStr()), args);
	}
}


/// void dlogCond(string file = __FILE__, int line = __LINE__, bool cond, T...)(T args)
/// void dlogCond(bool cond, Anyarg...)
void dlogCond(string file = __FILE__, int line = __LINE__, C, A...)(C cond, A args)
	if (is (C == bool))
{
	version (useDebugLog) {
		if (cond) {
			dLogMemBuffer._outLogV(file, ":", line,":[", getDateTimeStr(), "]", args);
			// add getpid
			// dLogMemBuffer._outlogV(format("%s:%d:[%s:%d]", file, line, getDateTimeStr(), getpid()), args);
			// dLogMemBuffer._outLogV(format("%s:%d:[%s]", file, line, getDateTimeStr()), args);
		}
	}
}

/// void dlogDump(string file = __FILE__, int line = __LINE__, V, N, S)(V v, N n, S s)
/// void dlogDump(cast(void *)dumpAddress, size_t dumpSize, string Comment);
void dlogDump(string file = __FILE__, int line = __LINE__, V, N, S)(V v, N n, S s)
	if (is(V == void*) && is(N == size_t))
{
	version (useDebugLog) {
		   dLogMemBuffer._outLogV(file, ":", line, ":[", getDateTimeStr(), "]dumpSize ", n, " byte, ", s);
		// dLogMemBuffer._outLoglf(format("%s:%d:[%s]dumpSize %d byte, %s", file, line, getDateTimeStr(), n, s));
		dLogMemBuffer._dumpLog(v, n);
	}
}

void dlogDump(string file = __FILE__, int line = __LINE__, T, S)(T dump, S s = "")
{
	
}


/// void dlogWrite(string file = __FILE__, int line = __LINE__, T...)(T args)
/// void dlogWrite(Anyarg...)
void dlogWrite(string file = __FILE__, int line = __LINE__, T...)(T args)
{
	version (useDebugLog) {
		dLogMemBuffer._outLogV(file, ":", line,":[", getDateTimeStr(), "]", args);
		dLogMemBuffer._outLoglf("#### writeLog ####");
		dLogMemBuffer.writeFile();
	}
}
unittest {
	// write to logfile.
	dlogWrite();
}

/// string getDateTimeStr()
/// return timeString
string getDateTimeStr()
{
	import std.datetime;
	SysTime ctime = Clock.currTime();
	const auto fsec = ctime.fracSecs.total!"msecs";
	
	version (Japanese_LocalDateTime_Format) {
		return format(
		           // "%04d/%02d/%02d-%02d:%02d:%02d",
		           "%04d/%02d/%02d-%02d:%02d:%02d.%03d",
		           ctime.year,
		           ctime.month,
		           ctime.day,
		           ctime.hour,
		           ctime.minute,
		           ctime.second,
		           fsec);
	}
	else { // ISO like time format
		return format(
		           // "%04d%02d%02dT%02d%02d%02d",
		           "%04d%02d%02d.%02d%02d%02d.%03d",
		           ctime.year,
		           ctime.month,
		           ctime.day,
		           ctime.hour,
		           ctime.minute,
		           ctime.second,
		           fsec);
	}
}


/// dlog version
enum string dlog_VERSION = "debuglog.0.5";
/// bufferling size
enum uint LogBufferSize = 1024;
/// thread count
shared private int threadCounter;
/// 
__gshared MemBuffer dLogMemBuffer;

version (useDebugLog)
{
	static this() {
		// synchronized (MemBuffer.classinfo) {
			atomicOp!"+="(threadCounter, 1);
			dLogMemBuffer = MemBuffer.thisGet();
		// }
	}
	//
	static ~this() {
		synchronized (MemBuffer.classinfo) {
			atomicOp!"-="(threadCounter, 1);
			if (threadCounter <= 0) {
				dLogMemBuffer.writeFile();
			}
		}
	}
} // version (useDebugLog)

/// 
class MemBuffer {
private:
	this() {}
	static bool instantiated = false;	// static is thread local.
	__gshared MemBuffer instance;		// __gshareg is all grobal.

	shared private bool LogFlag;
	shared private string LogFilename;

	shared string[] _array;
	shared size_t	_count;

	void init() {
		_array.length = LogBufferSize;
		_count = 0;
	}

public:
	void add(string s) {
		synchronized (MemBuffer.classinfo) {
			if (_array.length == count) {
				_array.length *= 2;
			}
			_array[_count] = s.dup;
			atomicOp!"+="(_count, 1);
			// _count++;
		}
	}
	void writeFile() {
		import std.file: append;
		if (_count) {
			foreach (v ; _array) {
				append(LogFilename, v);
			}
			init();
		}
	}
	size_t count() {
		return _count;
	}
//------------------------------------------------
	void dlog_enable() {
		LogFlag = true;
	}
	void dlog_disable() {
		LogFlag = false;
	}
	/**
	void setDebugLog(bool flag = true)
	
	param: flag
	**/
	void setDebugLog(bool flag = true) {
		import std.file : thisExePath;
		string ext;
		version (useFilenameAddDATE) {
			ext = "debug_log_" ~ getDateStr() ~ ".txt";
		} else {
			ext = "debug_log.txt";
		}
		
		string execPath = thisExePath();
		if (execPath.length) {
			auto n = lastIndexOf(execPath, ".");
			if ( n > 0 ) {
				LogFilename = execPath[0 .. n]  ~ "." ~ ext;
			} else {
				LogFilename = execPath ~ "." ~ ext;
			}
		}
		else {
			LogFilename = ext;
		}
		
		LogFlag = flag;
		
		// dlog("#= ", dlog_VERSION, "/", LogFilename, " / ",  __VENDOR__, ":", __VERSION__);
		
		_outLogV(
			format("%s:%d:[%s]", __FILE__, __LINE__, getDateTimeStr()), 
			"#= ", dlog_VERSION, "/", LogFilename, "/",  __VENDOR__, ":", __VERSION__
			);
	}
	
	void _outLogV(A...)(A args) {
/**
		import std.format : formattedWrite;
		string result;
		void put(const char[] s) { result ~= s; }
		foreach (arg; args) {
			formattedWrite(&put, "%s", arg);
		}
		_outLoglf(result);
**/
		import std.format : formattedWrite;
		import std.array : appender;
		auto w = appender!string();
		foreach (arg; args) {
			formattedWrite(w, "%s", arg);
		}
		 _outLoglf(w.data);
	}
	
	void _outLog(lazy string s) {
		if (LogFlag) {
			add(s);
			version (useDirectWrite) {
				writeFile();
			}
		}
	}

	void _outLoglf(lazy string s) {
		if (LogFlag) {
			add(s ~ "\n");
			version (useDirectWrite) {
				writeFile();
			}
		}
	}
	
	string getDateStr() {
		import std.datetime;
		SysTime ctime = Clock.currTime();
		return format(
		           "%04d-%02d-%02d",
		           ctime.year,
		           ctime.month,
		           ctime.day);
	}
	
	///
	void _dumpLog(void *Buff, size_t byteSize) {
		import std.ascii : isPrintable;
		enum PrintLen = 16;
		ubyte[PrintLen] dumpBuff;
		
		void printCount(uint n) {
			_outLog(format("%06d: ", n));
		}
		void printBody(size_t n) {
			string s;
			foreach (int i, ubyte v; dumpBuff) {
				if (i == PrintLen / 2) {
					s ~= " ";
				}
				if (i < n) {
					s ~= format("%02X ", v);
				} else {
					s ~= "   ";
				}
			}
			_outLog(s);
		}
		void printAscii(size_t n) {
			string s;
			char c;
			foreach (int i, ubyte v; dumpBuff) {
				c = cast(char)v;
				if (!isPrintable(c))
					c = '.';
				if (i < n) {
					s ~= format("%c", c);
				} else {
					s ~= ".";
				}
			}
			_outLoglf(s);
		}
		// Main
		uint endPrint;
		for (uint i; i < byteSize + PrintLen; i += PrintLen) {
			endPrint = i + PrintLen;
			if (byteSize < endPrint) {
				size_t end = byteSize - i;
				if (end != 0) {
					dumpBuff = dumpBuff.init;
					dumpBuff[0 .. end] = cast(ubyte[]) Buff[i .. byteSize];
					printCount(i);
					printBody(end);
					printAscii(end);
				}
				break;
			}
			dumpBuff = cast(ubyte[]) Buff[i .. endPrint];
			printCount(i);
			printBody(PrintLen);
			printAscii(PrintLen);
		}
	}
//------------------------------------------------
// Singleton DCL(dobule Checked Locking)
	static MemBuffer thisGet() {
		if (!instantiated) {
			synchronized (MemBuffer.classinfo) {
				if (instance is null) {
					instance = new MemBuffer;
					instance.init();
					instance.setDebugLog();

				}
				instantiated = true;
			}
		}
		return instance;
	}
} // MemBuffer
/***
http://wiki.dlang.org/Low-Lock_Singleton_Pattern
http://www.kmonos.net/alang/d/migrate-to-shared.html
http://msystem.m4.coreserver.jp/weblog/?p=1620
https://davesdprogramming.wordpress.com/2013/05/06/low-lock-singletons/

class MySingleton {
  static MySingleton get() {
    if (!instantiated_) {
      synchronized {
        if (instance_ is null) {
          instance_ = new MySingleton;
        }
        instantiated_ = true;
      }
    }
    return instance_;
  }
 private:
  this() {}
  static bool instantiated_;  // Thread local
  __gshared MySingleton instance_;
 }
***/


version(Module_TEST) {

void test()
{
	int intn = 123456;
	dlog("intn = ", intn);
	dlog("intn <= 10 : ", intn <= 10);
	dlog("TEST ", 1, " ", 0.2, " ", 3L, " ", true, " ", false);
	dlog("----------------------------------------");
    
    ubyte ubytedump = 1;
    dlog("ubytedump: ", ubytedump);
	dlogDump(cast(void*)&ubytedump, ubytedump.sizeof, "ubytedump");
	dlog("----------------------------------------");
    
    int intdump = 2;
    dlog("intdump: ", intdump);
	dlogDump(cast(void*)&intdump, intdump.sizeof, "intdump");
	dlog("----------------------------------------");
    
	long longdump = 3;
	dlog("longdump: ", longdump);
	dlogDump(cast(void*)&longdump, longdump.sizeof, "longdump");
	dlog("----------------------------------------");

    ubyte[2] staticUbyteArray = [1, 2];
	dlog("staticUbyteArray: ", staticUbyteArray);
	dlogDump(cast(void*)&staticUbyteArray, staticUbyteArray.sizeof, "staticUbyteArray");
	dlogDump(cast(void*)&staticUbyteArray, staticUbyteArray.sizeof * staticUbyteArray.length, "staticUbyteArray");
	dlog("----------------------------------------");
    
    ubyte[4] ubyteArray02 = [1, 2, 3, 4];
	dlog("ubyteArray02: ", ubyteArray02);
	dlogDump(cast(void*)&ubyteArray02, ubyteArray02.sizeof, "ubyteArray");
	dlogDump(cast(void*)&ubyteArray02, ubyteArray02.sizeof * ubyteArray02.length, "ubyteArray02");
	dlog("----------------------------------------");

	// Dynamic array can not see contents in dump.　
	// DynamicArray はダンプしても内容は見れない
	ubyte[] dynamicUbyteArray = [1, 2];
	dlog("dynamicUbyteArray: ", dynamicUbyteArray);
	dlogDump(cast(void*)&dynamicUbyteArray, dynamicUbyteArray.sizeof, "dynamicUbyteArray");
	dlogDump(cast(void*)&dynamicUbyteArray, dynamicUbyteArray.sizeof * dynamicUbyteArray.length, "dynamicUbyteArray");
	dlog("----------------------------------------");

    int[8] intArray = [8, 9, 10, 11, 12, 13, 14, 15];
    dlog("intArray: ", intArray);
	dlogDump(cast(void*)&intArray, intArray.sizeof * intArray.length, "intArray");
	dlog("----------------------------------------");
	
    
    struct structS {
        char[20] c;
        int inti;
        long longl;
        double doubled;
    }
    structS ss;
    ss.c[0] = 'a';
    ss.c[1] = 'b';
    ss.c[2] = 'c';
    ss.c[3] = 'd';
    ss.c[4] = 'e';
    ss.c[5] = 'f';
    ss.c[6] = 'g';
    ss.inti = 1;
    ss.longl = 2;
    ss.doubled = 0.1;
	
	dlog("ss: ", ss);
    dlogDump(cast(void *)&ss, ss.sizeof, "ss");
	dlog("----------------------------------------");
	
	string stringCode = "abcdあいう 漢字efgh"c;
    dlogDump(cast(void*)stringCode, stringCode.length, "utf8 string");
	dlog("----------------------------------------");
    
    wstring utf16Code = "abcdあいう 漢字efgh"w;
    dlogDump(cast(void*)utf16Code, utf16Code.length * wchar.sizeof, "utf16 string");
	dlog("----------------------------------------");
    
    dstring utf32Code = "abcdあいう 漢字efgh"d;
    dlogDump(cast(void*)utf32Code, utf32Code.length * dchar.sizeof, "utf32 string");
	dlog("----------------------------------------");
}

int main()
{
	try {
		dlog("== START");
		test();
	}
	catch(Exception e) {
		dlog(e.msg);
		//writeln(e.msg);
	}
	dlog("== END");
	return 0;
}

} // version Moduel_TEST
