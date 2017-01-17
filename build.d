//
// build dwtlib
//
// dmd.2.072.2
//
// base\src\java\lang\all.d:3
// // pragma( lib, "dwt-base.lib" );
//

import std.stdio;
import std.process;
import std.string;
import std.file;
import std.path;
// import std.algorithm;

///
struct BldInfo {
	/// output .exe or.lib name
	string      base_name;
	/// dmd flags
	string      dmd_flags;
	/// source path
	string[]    sourcePath;
	/// output path
	string      outputPath;
}
///
BldInfo[] buildTabls = [ 
// BldInfo("base_name", "dmdFlangs", ["sourcePath"], outputPath ),
	//----------------------------------------------------------------
	// 32bit omf lib,  -m32 -lib 
	BldInfo("dwt_w32x86.lib",
		"-m32 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
	//----------------------------------------------------------------
	// 32bit omf debug lib, -g -m32 -lib 
	BldInfo("dwt_w32x86_debug.lib",
		"-g -m32 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
	//----------------------------------------------------------------
	// 32bit omf optimize lib, -O -release -inline -boundscheck=off -m32 -lib
	BldInfo("dwt_w32x86_optimize.lib",
		"-O -release -inline -boundscheck=off -m32 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
	//----------------------------------------------------------------
	// 64bit mscoff lib, -m64 -lib 
	BldInfo("dwt_w64x86.lib",
		"-m64 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
	//----------------------------------------------------------------
	// 64bit omf debug lib, -g -m64 -lib 
	BldInfo("dwt_w64x86_debug.lib",
		"-g -m64 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
	//----------------------------------------------------------------
	// 64bit omf optimize lib, -O -release -inline -boundscheck=off -m64 -lib
	BldInfo("dwt_w64x86_optimize.lib",
		"-O -release -inline -boundscheck=off -m64 -lib -Ibase\\src -Jorg.eclipse.swt.win32.win32.x86\\res",
		["base\\src", "org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt"],
		"lib"),
];
///
enum responsName = "dwt_Respons.txt";
///
enum responsFileComment = "# dmd @cmdfile. show dmd -v";
///
enum responsAddFileComment = "# dlang sorce files: ";

///
class Build
{
	/// dmd flags
	string dmdFlags;
	/// build directory path
	string[] buildPath;
	/// -of option pathname
	string outputPath;
	
	///
	this(BldInfo b) {
		// check sourcePath 
		foreach (v; b.sourcePath) {
			if (!v.exists()) {
				throw new Exception("setup Error: sourcePath not found. " ~ v);
			}
		}
		dmdFlags   ~= " ";
		//dmdFlags   ~= " -wi ";
		dmdFlags   ~= b.dmd_flags;
		buildPath   = b.sourcePath;
		outputPath  = b.outputPath ~ dirSeparator ~ b.base_name;
	}
	
	/// make ResponsFile (dmd @ResponsFile)
	bool makeRespons() {
		bool Result;
		string[] files;
		foreach (v; buildPath) {
			files ~= scanDfiles(v);
		}
		if (files.length != 0) {
			std.file.write(responsName, responsFileComment ~ "\n");
			std.file.append(responsName, dmdFlags ~ "\n");
			std.file.append(responsName, "-of" ~ outputPath ~ "\n");
			std.file.append(responsName, responsAddFileComment ~ "\n");
			foreach (dfile; files) {
				std.file.append(responsName, dfile ~ "\n");
			}
			Result = true;
		}
		else {
			writeln("error: .d file not found");
		}
		return Result;
	}
	///
	void dmd() {
		string command = "dmd @" ~ responsName;
		version (none) {
			if (exec(command, null) != 0) {
				throw new Exception("dmd failed.");
			}
		} else {
			if (exec(command, null) != 0) {
				writeln("dmd failed.");
			}
		}
	}
	///	
	void run() {
		writeln("#--------");
		writeln("outputPath : ", outputPath);
		writeln("dmdFlags   : ", dmdFlags);
		writeln("buildPath  : ", buildPath);
		// remove lib, debuglib, responsfile, dmdLogName
		//
		if (makeRespons()) {
			// execute dmd
			dmd();
			std.file.remove(responsName);
		}
	}
	//
}

//---------------------------------------------------------------------------
///
string[] excludeLists = [
	".git",
	".dub",
	".vscode",
	"temp",
	// "test.d",
];
///
string[] excludeDirectoyLists = [
	"dwt\\org.eclipse.swt.win32.win32.x86\\src\\org\\eclipse\\swt\\internal\\mozilla"
];
/// 
bool viewOption;
///
void oprint(T...) (T arg) {
	if (viewOption) {
		writeln(arg);
	}
}
///
bool ckExcludes(string filename) {
	foreach (v; excludeDirectoyLists) {
		if (v == filename) {
			return true;
		}
	}
	foreach (v; excludeLists) {
		if (v == filename.baseName()) {
			return true;
		}
	}
	return false;
}
///
string[] scanDfiles(string dir, bool recursive = true) {
	string[] result;
	foreach (DirEntry f; dirEntries(dir, SpanMode.shallow)) {
		oprint(f.name);
		if (!ckExcludes(f.name)) {
			if (recursive && f.isDir == true) {
				result ~= scanDfiles(f.name);
			}
			else if (f.name.extension() == ".d") {
				result ~= f.name;
			}
		}
	}
	return result;
}
//---------------------------------------------------------------------------
/// show file
/// void cat(string file)
void cat(string file) {
	if (file.exists()) {
		
		writeln(file.read());
	}
}
/// exec command
/// int exec(string command, string cwd)
int exec(string command, string cwd) {
	string logFileName = "err_logfile.txt";
	auto logFile = File(logFileName, "w");
	scope(exit) { 
		logFile.close();
		if (logFileName.getSize() == 0) {
			std.file.remove(logFileName);
		} else {
		//	cat(logFileName);
			writeln("logfile has been made, please look at it. \n", logFileName ~ ": ");
		}
	}
	auto pid = spawnShell(command, std.stdio.stdin, std.stdio.stdout, logFile, null, Config.none, cwd);
	return wait(pid);
}
/// shell command
/// int exec(ref string retString, string command, string cwd)
/// return: command result status
int exec(ref string retString, string command, string cwd) {
	auto r = executeShell(command, null, Config.none, size_t.max, cwd);
	retString = r.output.strip();
	return r.status;
}
/// ckCommand is 
void ckCommand(string command) {
	if (exec(command, null) != 0) {
		throw new Exception(command ~ " command failed.");
	}	
}
/// git clone
void git_clone(string url, string option = "") {
	string command = "git clone -q " ~ option ~ " " ~ url;
	if (exec(command, null) != 0) {
		throw new Exception("buildGit 'git clone' failed.");
	}
}
/// git pull
void git_pull(string dir) {
	string command = "git pull"; //" -q";
	if (exec(command, dir) != 0) {
		throw new Exception("buildGit 'git pull' failed.");
	}
}
///
// git checkout the latest tag
// git describe --abbrev=0 --tags
void git_checkout_latestTag(string dir) {
	string tag;
	string command = "git describe --abbrev=0 --tags";
	if (exec(tag, command, dir) != 0) {
		throw new Exception("buildGit 'git describe' failed.");
	}
	writeln("tag: ", tag);
	// git checkout tag
	command = "git checkout " ~ tag;
	if (exec(command, dir) != 0) {
		throw new Exception("buildGit 'git checkout' failed.");
	}
}
//---------------------------------------------------------------------------
/// git clone --recursive git://github.com/d-widget-toolkit/dwt.git
enum dwtGithub = "git://github.com/d-widget-toolkit/dwt.git";
enum http_dwtGithub = "http://github.com/d-widget-toolkit/dwt.git";
//
int main()
{
	int result;
	try {
		ckCommand("dmd --version");
version(none) {
		/// check build tools
		ckCommand("dmd --version");
		ckCommand("git --version");
		writeln("#----");
		/// download
		string workpath = baseName(dwtGithub, ".git");
		writeln("workpath:", workpath);
	version(USE_GITCLONE) {
		if (workpath.exists()) {
			git_pull(workpath);
		} else {
			git_clone(dwtGithub, "--recursive");
			// git_checkout_latestTag(workpath);
		}
	} else {
		if (!workpath.exists()) {
			git_clone(dwtGithub, "--recursive");
		}
	}
} // versiion
		/// build
		foreach (v; buildTabls) {
			auto bld = new Build(v);
			bld.run();
		}
	}
	catch (Exception ex) {
		writeln("Exception: ", ex.toString());
		result = 1;
	}
	return result;
}
// eof
