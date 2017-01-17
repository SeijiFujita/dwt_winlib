/*******************************************************************************
 * Copyright (c) 2000, 2007 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.swt.internal.win32.OS;

public import org.eclipse.swt.internal.win32.WINTYPES;

static import org.eclipse.swt.internal.win32.WINAPI;

import org.eclipse.swt.internal.C;
import org.eclipse.swt.internal.Library;
import java.lang.all;
import java.nonstandard.SharedLib;

version (Tango) {
	static import tango.sys.Common;

	static import tango.stdc.stdlib;

	static import tango.stdc.string; //for strlen
	import tango.sys.win32.CodePage : CodePage;

	private import tango.stdc.stringz;
}
else { // Phobos
	static import core.stdc.stdlib;

	static import core.stdc.string; //for strlen
	static import std.windows.charset; //for toMBSz
	static import core.sys.windows.windows; //for GetLastError
	static import std.windows.syserror; //for sysErrorString
}

alias DWTWINAPI = org.eclipse.swt.internal.win32.WINAPI;

void trace(int line) {
	getDwtLogger.trace(__FILE__, __LINE__, "OS {}", line);
}

// declare of Callback functions
extern (Windows) {
	alias Function0 = int function();
	alias Function1 = int function(void*);
	alias Function2 = int function(void*, int);
	alias Function2P = int function(void*, void*);
	alias Function3 = int function(void*, int, int);
	alias Function4 = int function(void*, int, int, int);
	alias Function5 = int function(void*, int, int, int, int);
	alias Function6 = int function(void*, int, int, int, int, int);
	alias Function7 = int function(void*, int, int, int, int, int, int);
	alias Function8 = int function(void*, int, int, int, int, int, int, int);
	alias Function9 = int function(void*, int, int, int, int, int, int, int, int);
}

/*
Compile time versions
    ANSI
    WinCE

    OS.IsUnicode
    OS.IsWinCE

    OS.IsHPC

    OS.IsSP
    OS.IsPPC
    OS.IsWin95
    OS.IsWinNT

*/

public class LDWTRESULT {
	public.LRESULT value;
	// initalize ONE and ZERO in static OS.this();
	mixin(gshared!(`public static LDWTRESULT ONE;`));
	mixin(gshared!(`public static LDWTRESULT ZERO;`));
	public this(.LRESULT value) {
		this.value = value;
	}

	public this(void* value) {
		this.value = cast(.LRESULT) value;
	}
}

public class OS : C {

	public static HINSTANCE GetLibraryHandle() {
		//PORTING_FIXME: GetLibraryHandle
		// is the hInstance of the DLL or null, if not a DLL.
		// At the moment SWT is statically linked but this needs to be fixed
		return null;
	}

	// macro from winnt.h
	public static int PRIMARYLANGID(int lgid) {
		return lgid & 0x3FF;
	}

	public static int LVITEM_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 1)) ? LVITEM.sizeof : 40;
	}

	public static int MENUITEMINFO_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 0)) ? MENUITEMINFO.sizeof : 44;
	}

	public static int NMLVCUSTOMDRAW_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 1)) ? NMLVCUSTOMDRAW.sizeof : 60;
	}

	public static int NMLVDISPINFO_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 1)) ? NMLVDISPINFO.sizeof : 52;
	}

	public static int OPENFILENAME_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 0)) ? OPENFILENAME.sizeof : 76;
	}

	public static int TOOLINFO_sizeof() {
		return (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION(5, 1)) ? TOOLINFO.sizeof : 44;
	}
	//     private static int getNOTIFYICONDATAA_V2_SIZE (){
	//         // hm, NOTIFYICONDATAA.dwInfoFlags.offsetof did not compile
	//         return IsWinCE ? NOTIFYICONDATAA.sizeof : cast(int)(&(cast(NOTIFYICONDATAA*)null).dwInfoFlags) + int.sizeof;
	//     }
	//
	//     private static int getNOTIFYICONDATAW_V2_SIZE (){
	//         return IsWinCE ? NOTIFYICONDATAW.sizeof : cast(int)(&(cast(NOTIFYICONDATAW*)null).dwInfoFlags) + int.sizeof;
	//     }
	// kernel32 winxp/vista
	public static extern (Windows) {
		HANDLE function(ACTCTX* pActCtx) CreateActCtx;
		BOOL function(HACTCTX hActCtx, ULONG_PTR* lpCookie) ActivateActCtx;
		LANGID function() GetSystemDefaultUILanguage;
		BOOL function(LANGUAGEGROUP_ENUMPROC pLangGroupEnumProc, // callback function
				DWORD dwFlags, // language groups
				LONG_PTR lParam // callback parameter
				) EnumSystemLanguageGroupsA;
		BOOL function(LANGUAGEGROUP_ENUMPROC pLangGroupEnumProc, // callback function
				DWORD dwFlags, // language groups
				LONG_PTR lParam // callback parameter
				) EnumSystemLanguageGroupsW;
		BOOL function(LOCALE_ENUMPROC lpLocaleEnumProc, // callback function
				DWORD dwFlags // locales
				) EnumSystemLocalesA;
		BOOL function(LOCALE_ENUMPROC lpLocaleEnumProc, // callback function
				DWORD dwFlags // locales
				) EnumSystemLocalesW;
	}

	/*
    * SWT Windows flags
    */
	mixin(gshared!(`public static BOOL IsWin32s;`));
	mixin(gshared!(`public static BOOL IsWin95;`));
	mixin(gshared!(`public static BOOL IsWinNT;`));

	version (WinCE) {
		mixin(gshared!(`public const static BOOL IsWinCE = true;`));
		mixin(gshared!(`public static const BOOL IsHPC   = false`)); //todo
	}
	else {
		mixin(gshared!(`public const static BOOL IsWinCE = false;`));
		mixin(gshared!(`public static const BOOL IsHPC   = false;`));
	}

	mixin(gshared!(`public static const BOOL IsPPC = false;`));

	// PORTING_FIXME, is it Windows WFSP?
	mixin(gshared!(`public static const BOOL IsSP = false;`));

	mixin(gshared!(`public static const BOOL IsDBLocale;`));

	version (ANSI) {
		public static const BOOL IsUnicode = false;
	}
	else {
		public static const BOOL IsUnicode = true;
	}

	mixin(gshared!(`public static const int WIN32_MAJOR, WIN32_MINOR, WIN32_VERSION;`));
	mixin(gshared!(`public static const int COMCTL32_MAJOR, COMCTL32_MINOR, COMCTL32_VERSION;`));
	mixin(gshared!(`public static const int SHELL32_MAJOR, SHELL32_MINOR, SHELL32_VERSION;`));

	public static const char[] NO_MANIFEST = "org.eclipse.swt.internal.win32.OS.NO_MANIFEST";

	/*
    * Flags for Window API GetVersionEx()
    */
	public static const int VER_PLATFORM_WIN32s = 0;
	public static const int VER_PLATFORM_WIN32_WINDOWS = 1;
	public static const int VER_PLATFORM_WIN32_NT = 2;
	public static const int VER_PLATFORM_WIN32_CE = 3;

	/* Forward references */
	public static const int HEAP_ZERO_MEMORY = 0x8;
	public static const int ACTCTX_FLAG_RESOURCE_NAME_VALID = 0x00000008;
	public static const int ACTCTX_FLAG_SET_PROCESS_DEFAULT = 0x00000010;
	public static const int ACTCTX_FLAG_APPLICATION_NAME_VALID = 0x00000020;
	public static const int ACTCTX_FLAG_OVERRIDEMANIFEST_VALID = 0x00000100;
	public static const TCHAR* MANIFEST_RESOURCE_ID = cast(TCHAR*) 1;
	public static const int SM_DBCSENABLED = 0x2A;
	public static const int SM_IMMENABLED = 0x52;
	public static const int LANG_KOREAN = 0x12;
	public static const int MAX_PATH = 260;

	//     static this(){
	//         NOTIFYICONDATAA_V2_SIZE = getNOTIFYICONDATAA_V2_SIZE ();
	//         NOTIFYICONDATAW_V2_SIZE = getNOTIFYICONDATAW_V2_SIZE ();
	//         NOTIFYICONDATA_V2_SIZE = IsUnicode ? getNOTIFYICONDATAW_V2_SIZE : getNOTIFYICONDATAA_V2_SIZE;
	//         OSVERSIONINFO info;
	//         IsWin32s = (info.dwPlatformId is VER_PLATFORM_WIN32s);
	//         IsWin95 = (info.dwPlatformId is VER_PLATFORM_WIN32_WINDOWS);
	//         IsWinNT = (info.dwPlatformId is VER_PLATFORM_WIN32_NT);
	//         //IsSP_ = false;
	//         //IsPPC_ = false;
	//         //IsHPC = false;
	//         IsDBLocale = false;
	//         WIN32_MAJOR = info.dwMajorVersion;
	//         WIN32_MINOR = info.dwMinorVersion;
	//         WIN32_VERSION = VERSION (WIN32_MAJOR, WIN32_MINOR);
	//         //IsUnicode = !IsWin32s && !IsWin95;
	//         DLLVERSIONINFO dvi;
	//         COMCTL32_MAJOR = dvi.dwMajorVersion;
	//         COMCTL32_MINOR = dvi.dwMinorVersion;
	//         COMCTL32_VERSION = VERSION (COMCTL32_MAJOR, COMCTL32_MINOR);
	//         SHELL32_MAJOR = dvi.dwMajorVersion;
	//         SHELL32_MINOR = dvi.dwMinorVersion;
	//         SHELL32_VERSION = VERSION (SHELL32_MAJOR, SHELL32_MINOR);
	//     }

	/* Get the Windows version and the flags */
	mixin(sharedStaticThis!(`{
        static_this_1();
        static_this_2();
        static_this_3();
        static_this_4();
        LDWTRESULT.ONE = new LDWTRESULT(1);
        LDWTRESULT.ZERO = new LDWTRESULT(0);
        /*
        * Try the UNICODE version of GetVersionEx first
        * and then the ANSI version.  The UNICODE version
        * is present on all versions of Windows but is not
        * implemented on Win95/98/ME.
        *
        * NOTE: The value of OSVERSIONINFO.sizeof cannot
        * be static final because it relies on the Windows
        * platform version to be initialized and IsUnicode
        * has not been calculated.  It must be initialized
        * here, after the platform is determined in order
        * for the value to be correct.
        */
        OSVERSIONINFO info;
        info.dwOSVersionInfoSize = OSVERSIONINFO.sizeof;
        if(!OS.GetVersionEx(&info)){
            MessageBoxA(null,
                    _PCHAR!("SWT Unicode version applications can't run in a non-Unicode platform !"),
                    _PCHAR!("Error"),
                    MB_OK|MB_ICONERROR);
            version(Tango){
                tango.stdc.stdlib.exit(-1);
            } else { // Phobos
                core.stdc.stdlib.exit(-1);
            }
        }
        //OSVERSIONINFO info = new OSVERSIONINFOW ();
        //info.dwOSVersionInfoSize = OSVERSIONINFOW.sizeof;
        //if (!OS.GetVersionExW ((OSVERSIONINFOW)info)) {
        //    info = new OSVERSIONINFOA ();
        //    info.dwOSVersionInfoSize = OSVERSIONINFOA.sizeof;
        //    OS.GetVersionExA ((OSVERSIONINFOA)info);
        //}
        //OSVERSIONINFO.sizeof = info.dwOSVersionInfoSize;

        IsWin32s = (info.dwPlatformId is VER_PLATFORM_WIN32s);
        IsWin95 = (info.dwPlatformId is VER_PLATFORM_WIN32_WINDOWS);
        IsWinNT = (info.dwPlatformId is VER_PLATFORM_WIN32_NT);
        //PORTING_CHANGE: made by version
        //IsWinCE = (info.dwPlatformId is VER_PLATFORM_WIN32_CE);
        //PORTING_CHANGE: made by version
        //IsSP  = IsSP();
        //PORTING_CHANGE: made by version
        //IsPPC = IsPPC();
        version(WinCE) {
            IsHPC = IsWinCE && !IsPPC && !IsSP;
        }
        WIN32_MAJOR = info.dwMajorVersion;
        WIN32_MINOR = info.dwMinorVersion;
        WIN32_VERSION = VERSION (WIN32_MAJOR, WIN32_MINOR);

        if (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (5, 0)) {
            SharedLib.loadLibSymbols( Symbols_Kernel32, "Kernel32.dll", WIN32_MAJOR, WIN32_MINOR );
        }

        //PORTING_CHANGE: made by version
        //IsUnicode = !IsWin32s && !IsWin95;

        /* Load the manifest to force the XP Theme */
        if (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (5, 1)) {
            //enableVisualStyles();
        }

        // when to load uxtheme
        if (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (5, 1)) {
            SharedLib.loadLibSymbols( Symbols_UxTheme, "UxTheme.dll", WIN32_MAJOR, WIN32_MINOR );
        }
        if (OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (5, 1)) {
            SharedLib.loadLibSymbols( Symbols_CoreImm, "Coreimm.dll", WIN32_MAJOR, WIN32_MINOR );
        }
        if (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (5, 0)) {
            SharedLib.loadLibSymbols( Symbols_User32, "User32.dll", WIN32_MAJOR, WIN32_MINOR );
        }
        if (!OS.IsWinCE && OS.WIN32_VERSION >= OS.VERSION (4, 0)) {
            SharedLib.loadLibSymbols( Symbols_Imm32, "Imm32.dll", WIN32_MAJOR, WIN32_MINOR );
        }

        /* Make the process DPI aware for Windows Vista */
        if (OS.WIN32_VERSION >= OS.VERSION (6, 0)) OS.SetProcessDPIAware ();

        /* Get the DBCS flag */
        BOOL dbcsEnabled = OS.GetSystemMetrics (SM_DBCSENABLED) !is 0;
        BOOL immEnabled = OS.GetSystemMetrics (SM_IMMENABLED) !is 0;
        IsDBLocale = dbcsEnabled || immEnabled;

        /*
        * Bug in Windows.  On Korean Windows XP when the Text
        * Services Framework support for legacy applications
        * is enabled, certain legacy calls segment fault.
        * For example, when ImmSetCompositionWindow() is used
        * to move the composition window outside of the client
        * area, Windows crashes.  The fix is to disable legacy
        * support.
        *
        * Note: The bug is fixed in Service Pack 2.
        */
        if (!OS.IsWinCE && OS.WIN32_VERSION is OS.VERSION (5, 1)) {
            short langID = OS.GetSystemDefaultUILanguage ();
            short primaryLang = cast(short) OS.PRIMARYLANGID (langID);
            if (primaryLang is LANG_KOREAN) {
                OSVERSIONINFOEX infoex;
                infoex.dwOSVersionInfoSize = OSVERSIONINFOEX.sizeof;
                GetVersionEx (cast(OSVERSIONINFO*) &infoex );
                if (infoex.wServicePackMajor < 2) {
                    OS.ImmDisableTextFrameService (0);
                }
            }
        }

        /* Get the COMCTL32.DLL version */
        DLLVERSIONINFO dvi;
        dvi.cbSize = DLLVERSIONINFO.sizeof;
        dvi.dwMajorVersion = 4;
        dvi.dwMinorVersion = 0;
        //PORTING_CHANGE: comctl is loaded automatically
        //TCHAR lpLibFileName = new TCHAR (0, "comctl32.dll", true); //$NON-NLS-1$
        //auto hModule = OS.LoadLibrary (lpLibFileName);
        SharedLib.tryUseSymbol( "DllGetVersion", "comctl32.dll", (void* ptr){
            alias extern(Windows) void function(DLLVERSIONINFO*) TDllGetVersion;
            auto func = cast( TDllGetVersion ) ptr;
            func(&dvi);
        });
        COMCTL32_MAJOR = dvi.dwMajorVersion;
        COMCTL32_MINOR = dvi.dwMinorVersion;
        COMCTL32_VERSION = VERSION (COMCTL32_MAJOR, COMCTL32_MINOR);

        /* Get the Shell32.DLL version */
        dvi = DLLVERSIONINFO.init;
        dvi.cbSize = DLLVERSIONINFO.sizeof;
        dvi.dwMajorVersion = 4;
        //TCHAR lpLibFileName = new TCHAR (0, "Shell32.dll", true); //$NON-NLS-1$
        //auto hModule = OS.LoadLibrary (lpLibFileName);
        SharedLib.tryUseSymbol( "DllGetVersion", "Shell32.dll", (void* ptr){
            alias extern(Windows) void function(DLLVERSIONINFO*) TDllGetVersion;
            auto func = cast( TDllGetVersion ) ptr;
            func(&dvi);
        });
        SHELL32_MAJOR = dvi.dwMajorVersion;
        SHELL32_MINOR = dvi.dwMinorVersion;
        SHELL32_VERSION = VERSION (SHELL32_MAJOR, SHELL32_MINOR);
    }`));

	/**************************************************************************

    **************************************************************************/

	public static void enableVisualStyles() {
		void printError(String msg) {
			version (Tango) {
				char[] winMsg = tango.sys.Common.SysError.lastMsg();
				char[2000] buf;
				getDwtLogger.error(__FILE__, __LINE__, "{}: {}", msg, CodePage.from(winMsg, buf));
			}
			else { // Phobos
				auto err = core.sys.windows.windows.GetLastError();
				getDwtLogger.error(__FILE__, __LINE__, "{}: {}", msg,
						std.windows.syserror.sysErrorString(err));
			}
		}

		TCHAR[] buffer = new TCHAR[MAX_PATH];
		buffer[] = 0;
		HANDLE hModule = OS.GetLibraryHandle();
		while (OS.GetModuleFileName(hModule, buffer.ptr, cast(DWORD) buffer.length) is buffer
				.length) {
			buffer.length = buffer.length + MAX_PATH;
			buffer[] = 0;
		}
		auto hHeap = OS.GetProcessHeap();
		auto byteCount = buffer.length * TCHAR.sizeof;
		TCHAR* pszText = cast(TCHAR*) OS.HeapAlloc(hHeap, HEAP_ZERO_MEMORY, byteCount);
		OS.MoveMemory(pszText, buffer.ptr, byteCount);

		ACTCTX pActCtx;
		pActCtx.cbSize = ACTCTX.sizeof;
		pActCtx.dwFlags = 0 | ACTCTX_FLAG_RESOURCE_NAME_VALID | ACTCTX_FLAG_SET_PROCESS_DEFAULT;
		pActCtx.lpSource = pszText;
		pActCtx.lpApplicationName = pszText;
		pActCtx.lpResourceName = MANIFEST_RESOURCE_ID;
		HANDLE hActCtx = OS.CreateActCtx(&pActCtx);
		if (hActCtx is INVALID_HANDLE_VALUE) {
			printError("CreateActCtx failed, hence theme support will not be available\n"
					~ "Please check for:\n" ~ " - missing link option -L/su:windows:5 or -L/su:console:5\n"
					~ " - missing link option -L/rc:org.eclipse.swt\n"
					~ " - resource file 'org.eclipse.swt.res' was not accessible by linker\n");
		}
		else {
			ULONG_PTR ulpActivationCookie;
			if (!OS.ActivateActCtx(hActCtx, &ulpActivationCookie)) {
				printError("ActivateActCtx failed");
			}
		}

		if (pszText !is null) {
			OS.HeapFree(hHeap, 0, pszText);
		}

		/*
        * NOTE:  A single activation context is created and activated
        * for the entire lifetime of the program.  It is deactivated
        * and released by Windows when the program exits.
        */
	}

	/**************************************************************************

    **************************************************************************/

	/* Flag used on WinCE */

	static const int SYS_COLOR_INDEX_FLAG = OS.IsWinCE ? 0x40000000 : 0x0;

	/*
    * NOTE:  There is a bug in JVM 1.2 where loading
    * a class with a large number of constants causes
    * a segment fault to occur sometime later after
    * the class is loaded.  The fix is to break the
    * class up into a hierarchy of classes that each
    * contain a smaller number of constants.  This
    * fix is not necessary at this time but is required
    * when all constants are uncommented.  We have not
    * done the research to determine the limit.
    */

	/* Constants */
	public static const int ABS_DOWNDISABLED = 8;
	public static const int ABS_DOWNHOT = 6;
	public static const int ABS_DOWNNORMAL = 5;
	public static const int ABS_DOWNPRESSED = 7;
	public static const int ABS_LEFTDISABLED = 12;
	public static const int ABS_LEFTHOT = 10;
	public static const int ABS_LEFTNORMAL = 9;
	public static const int ABS_LEFTPRESSED = 11;
	public static const int ABS_RIGHTDISABLED = 16;
	public static const int ABS_RIGHTHOT = 14;
	public static const int ABS_RIGHTNORMAL = 13;
	public static const int ABS_RIGHTPRESSED = 15;
	public static const int ABS_UPDISABLED = 4;
	public static const int ABS_UPHOT = 2;
	public static const int ABS_UPNORMAL = 1;
	public static const int ABS_UPPRESSED = 3;
	public static const int AC_SRC_OVER = 0;
	public static const int AC_SRC_ALPHA = 1;
	//  public static const int ACTCTX_FLAG_RESOURCE_NAME_VALID = 0x00000008;
	//  public static const int ACTCTX_FLAG_SET_PROCESS_DEFAULT = 0x00000010;
	public static const int ALTERNATE = 1;
	public static const int ASSOCF_NOTRUNCATE = 0x00000020;
	public static const int ASSOCF_INIT_IGNOREUNKNOWN = 0x400;
	public static const int ASSOCSTR_COMMAND = 1;
	public static const int ASSOCSTR_DEFAULTICON = 15;
	public static const int ASSOCSTR_FRIENDLYAPPNAME = 4;
	public static const int ASSOCSTR_FRIENDLYDOCNAME = 3;
	public static const int AW_SLIDE = 0x00040000;
	public static const int AW_ACTIVATE = 0x00020000;
	public static const int AW_BLEND = 0x00080000;
	public static const int AW_HIDE = 0x00010000;
	public static const int AW_CENTER = 0x00000010;
	public static const int AW_HOR_POSITIVE = 0x00000001;
	public static const int AW_HOR_NEGATIVE = 0x00000002;
	public static const int AW_VER_POSITIVE = 0x00000004;
	public static const int AW_VER_NEGATIVE = 0x00000008;
	public static const int ATTR_INPUT = 0x00;
	public static const int ATTR_TARGET_CONVERTED = 0x01;
	public static const int ATTR_CONVERTED = 0x02;
	public static const int ATTR_TARGET_NOTCONVERTED = 0x03;
	public static const int ATTR_INPUT_ERROR = 0x04;
	public static const int ATTR_FIXEDCONVERTED = 0x05;
	public static const int BCM_FIRST = 0x1600;
	public static const int BCM_GETIDEALSIZE = BCM_FIRST + 0x1;
	public static const int BCM_GETIMAGELIST = BCM_FIRST + 0x3;
	public static const int BCM_GETNOTE = BCM_FIRST + 0xa;
	public static const int BCM_GETNOTELENGTH = BCM_FIRST + 0xb;
	public static const int BCM_SETIMAGELIST = BCM_FIRST + 0x2;
	public static const int BCM_SETNOTE = BCM_FIRST + 0x9;
	public static const int BDR_RAISEDOUTER = 0x0001;
	public static const int BDR_SUNKENOUTER = 0x0002;
	public static const int BDR_RAISEDINNER = 0x0004;
	public static const int BDR_SUNKENINNER = 0x0008;
	public static const int BDR_OUTER = 0x0003;
	public static const int BDR_INNER = 0x000c;
	public static const int BDR_RAISED = 0x0005;
	public static const int BDR_SUNKEN = 0x000a;
	public static const int BFFM_INITIALIZED = 0x1;
	public static const int BFFM_SETSELECTION = IsUnicode ? 0x467 : 0x466;
	public static const int BFFM_VALIDATEFAILED = IsUnicode ? 0x4 : 0x3;
	public static const int BFFM_VALIDATEFAILEDW = 0x4;
	public static const int BFFM_VALIDATEFAILEDA = 0x3;
	public static const int BF_ADJUST = 0x2000;
	public static const int BF_LEFT = 0x0001;
	public static const int BF_TOP = 0x0002;
	public static const int BF_RIGHT = 0x0004;
	public static const int BF_BOTTOM = 0x0008;
	public static const int BF_RECT = (BF_LEFT | BF_TOP | BF_RIGHT | BF_BOTTOM);
	public static const int BIF_EDITBOX = 0x10;
	public static const int BIF_NEWDIALOGSTYLE = 0x40;
	public static const int BIF_RETURNONLYFSDIRS = 0x1;
	public static const int BIF_VALIDATE = 0x20;
	public static const int BITSPIXEL = 0xc;
	public static const int BI_BITFIELDS = 3;
	public static const int BI_RGB = 0;
	public static const int BLACKNESS = 0x42;
	public static const int BLACK_BRUSH = 4;
	public static const int BUTTON_IMAGELIST_ALIGN_LEFT = 0;
	public static const int BUTTON_IMAGELIST_ALIGN_RIGHT = 1;
	public static const int BUTTON_IMAGELIST_ALIGN_CENTER = 4;
	public static const int BM_CLICK = 0xf5;
	public static const int BM_GETCHECK = 0xf0;
	public static const int BM_SETCHECK = 0xf1;
	public static const int BM_SETIMAGE = 0xf7;
	public static const int BM_SETSTYLE = 0xf4;
	public static const int BN_CLICKED = 0x0;
	public static const int BN_DOUBLECLICKED = 0x5;
	public static const int BPBF_COMPATIBLEBITMAP = 0;
	public static const int BPBF_DIB = 1;
	public static const int BPBF_TOPDOWNDIB = 2;
	public static const int BPBF_TOPDOWNMONODIB = 3;
	public static const int BPPF_ERASE = 0x0001;
	public static const int BPPF_NOCLIP = 0x0002;
	public static const int BPPF_NONCLIENT = 0x0004;
	public static const int BP_PUSHBUTTON = 1;
	public static const int BP_RADIOBUTTON = 2;
	public static const int BP_CHECKBOX = 3;
	public static const int BP_GROUPBOX = 4;
	public static const int BST_CHECKED = 0x1;
	public static const int BST_INDETERMINATE = 0x2;
	public static const int BST_UNCHECKED = 0x0;
	public static const int BS_3STATE = 0x5;
	public static const int BS_BITMAP = 0x80;
	public static const int BS_CENTER = 0x300;
	public static const int BS_CHECKBOX = 0x2;
	public static const int BS_COMMANDLINK = 0xe;
	public static const int BS_DEFPUSHBUTTON = 0x1;
	public static const int BS_FLAT = 0x8000;
	public static const int BS_GROUPBOX = 0x7;
	public static const int BS_ICON = 0x40;
	public static const int BS_LEFT = 0x100;
	public static const int BS_NOTIFY = 0x4000;
	public static const int BS_OWNERDRAW = 0xb;
	public static const int BS_PATTERN = 0x3;
	public static const int BS_PUSHBUTTON = 0x0;
	public static const int BS_PUSHLIKE = 0x1000;
	public static const int BS_RADIOBUTTON = 0x4;
	public static const int BS_RIGHT = 0x200;
	public static const int BS_SOLID = 0x0;
	public static const int BTNS_AUTOSIZE = 0x10;
	public static const int BTNS_BUTTON = 0x0;
	public static const int BTNS_CHECK = 0x2;
	public static const int BTNS_CHECKGROUP = 0x6;
	public static const int BTNS_DROPDOWN = 0x8;
	public static const int BTNS_GROUP = 0x4;
	public static const int BTNS_SEP = 0x1;
	public static const int BTNS_SHOWTEXT = 0x40;
	public static const int CBN_EDITCHANGE = 0x5;
	public static const int CBN_KILLFOCUS = 0x4;
	public static const int CBN_SELCHANGE = 0x1;
	public static const int CBN_SETFOCUS = 0x3;
	public static const int CBS_AUTOHSCROLL = 0x40;
	public static const int CBS_DROPDOWN = 0x2;
	public static const int CBS_DROPDOWNLIST = 0x3;
	public static const int CBS_CHECKEDNORMAL = 5;
	public static const int CBS_MIXEDNORMAL = 9;
	public static const int CBS_NOINTEGRALHEIGHT = 0x400;
	public static const int CBS_SIMPLE = 0x1;
	public static const int CBS_UNCHECKEDNORMAL = 1;
	public static const int CBS_CHECKEDDISABLED = 8;
	public static const int CBS_CHECKEDHOT = 6;
	public static const int CBS_CHECKEDPRESSED = 7;
	public static const int CBS_MIXEDDISABLED = 0;
	public static const int CBS_MIXEDHOT = 0;
	public static const int CBS_MIXEDPRESSED = 0;
	public static const int CBS_UNCHECKEDDISABLED = 4;
	public static const int CBS_UNCHECKEDHOT = 2;
	public static const int CBS_UNCHECKEDPRESSED = 3;
	public static const int CB_ADDSTRING = 0x143;
	public static const int CB_DELETESTRING = 0x144;
	public static const int CB_ERR = 0xffffffff;
	public static const int CB_ERRSPACE = 0xfffffffe;
	public static const int CB_FINDSTRINGEXACT = 0x158;
	public static const int CB_GETCOUNT = 0x146;
	public static const int CB_GETCURSEL = 0x147;
	public static const int CB_GETDROPPEDCONTROLRECT = 0x152;
	public static const int CB_GETDROPPEDSTATE = 0x157;
	public static const int CB_GETDROPPEDWIDTH = 0x015f;
	public static const int CB_GETEDITSEL = 0x140;
	public static const int CB_GETHORIZONTALEXTENT = 0x015d;
	public static const int CB_GETITEMHEIGHT = 0x154;
	public static const int CB_GETLBTEXT = 0x148;
	public static const int CB_GETLBTEXTLEN = 0x149;
	public static const int CB_INSERTSTRING = 0x14a;
	public static const int CB_LIMITTEXT = 0x141;
	public static const int CB_RESETCONTENT = 0x14b;
	public static const int CB_SELECTSTRING = 0x14d;
	public static const int CB_SETCURSEL = 0x14e;
	public static const int CB_SETDROPPEDWIDTH = 0x0160;
	public static const int CB_SETEDITSEL = 0x142;
	public static const int CB_SETHORIZONTALEXTENT = 0x015e;
	public static const int CB_SETITEMHEIGHT = 0x0153;
	public static const int CB_SHOWDROPDOWN = 0x14f;
	public static const int CBXS_NORMAL = 1;
	public static const int CBXS_HOT = 2;
	public static const int CBXS_PRESSED = 3;
	public static const int CBXS_DISABLED = 4;
	public static const int CCHILDREN_SCROLLBAR = 5;
	public static const int CCM_FIRST = 0x2000;
	public static const int CCM_SETBKCOLOR = 0x2001;
	public static const int CCM_SETVERSION = 0x2007;
	public static const int CCS_NODIVIDER = 0x40;
	public static const int CCS_NORESIZE = 0x4;
	public static const int CCS_VERT = 0x80;
	public static const int CC_ANYCOLOR = 0x100;
	public static const int CC_ENABLEHOOK = 0x10;
	public static const int CC_FULLOPEN = 0x2;
	public static const int CC_RGBINIT = 0x1;
	public static const int CDDS_POSTERASE = 0x00000004;
	public static const int CDDS_POSTPAINT = 0x00000002;
	public static const int CDDS_PREERASE = 0x00000003;
	public static const int CDDS_PREPAINT = 0x00000001;
	public static const int CDDS_ITEM = 0x00010000;
	public static const int CDDS_ITEMPOSTPAINT = CDDS_ITEM | CDDS_POSTPAINT;
	public static const int CDDS_ITEMPREPAINT = CDDS_ITEM | CDDS_PREPAINT;
	public static const int CDDS_SUBITEM = 0x00020000;
	public static const int CDDS_SUBITEMPOSTPAINT = CDDS_ITEMPOSTPAINT | CDDS_SUBITEM;
	public static const int CDDS_SUBITEMPREPAINT = CDDS_ITEMPREPAINT | CDDS_SUBITEM;
	public static const int CDIS_SELECTED = 0x0001;
	public static const int CDIS_GRAYED = 0x0002;
	public static const int CDIS_DISABLED = 0x0004;
	public static const int CDIS_CHECKED = 0x0008;
	public static const int CDIS_FOCUS = 0x0010;
	public static const int CDIS_DEFAULT = 0x0020;
	public static const int CDIS_HOT = 0x0040;
	public static const int CDIS_MARKED = 0x0080;
	public static const int CDIS_INDETERMINATE = 0x0100;
	public static const int CDM_FIRST = 0x0400 + 100;
	public static const int CDM_GETSPEC = CDM_FIRST;
	public static const int CDN_FIRST = -601;
	public static const int CDN_SELCHANGE = CDN_FIRST - 1;
	public static const int CDRF_DODEFAULT = 0x00000000;
	public static const int CDRF_DOERASE = 0x00000008;
	public static const int CDRF_NEWFONT = 0x00000002;
	public static const int CDRF_NOTIFYITEMDRAW = 0x00000020;
	public static const int CDRF_NOTIFYPOSTERASE = 0x00000040;
	public static const int CDRF_NOTIFYPOSTPAINT = 0x00000010;
	public static const int CDRF_NOTIFYSUBITEMDRAW = 0x00000020;
	public static const int CDRF_SKIPDEFAULT = 0x04;
	public static const int CDRF_SKIPPOSTPAINT = 0x00000100;
	public static const int CFE_AUTOCOLOR = 0x40000000;
	public static const int CFE_ITALIC = 0x2;
	public static const int CFE_STRIKEOUT = 0x8;
	public static const int CFE_UNDERLINE = 0x4;
	public static const int CFM_BOLD = 0x1;
	public static const int CFM_CHARSET = 0x8000000;
	public static const int CFM_COLOR = 0x40000000;
	public static const int CFM_FACE = 0x20000000;
	public static const int CFM_ITALIC = 0x2;
	public static const int CFM_SIZE = 0x80000000;
	public static const int CFM_STRIKEOUT = 0x8;
	public static const int CFM_UNDERLINE = 0x4;
	public static const int CFM_WEIGHT = 0x400000;
	public static const int CFS_POINT = 0x2;
	public static const int CFS_RECT = 0x1;
	public static const int CFS_CANDIDATEPOS = 0x0040;
	public static const int CFS_EXCLUDE = 0x0080;
	public static const int CF_EFFECTS = 0x100;
	public static const int CF_INITTOLOGFONTSTRUCT = 0x40;
	public static const int CF_SCREENFONTS = 0x1;
	public static const int CF_TEXT = 0x1;
	public static const int CF_UNICODETEXT = 13;
	public static const int CF_USESTYLE = 0x80;
	public static const int CLR_DEFAULT = 0xff000000;
	public static const int CLR_INVALID = 0xffffffff;
	public static const int CLR_NONE = 0xffffffff;
	public static const int CLSCTX_INPROC_SERVER = 1;
	public static const int COLORONCOLOR = 0x3;
	public static const int COLOR_3DDKSHADOW = 0x15 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_3DFACE = 0xf | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_3DHIGHLIGHT = 0x14 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_3DHILIGHT = 0x14 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_3DLIGHT = 0x16 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_3DSHADOW = 0x10 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_ACTIVECAPTION = 0x2 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_BTNFACE = 0xf | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_BTNHIGHLIGHT = 0x14 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_BTNSHADOW = 0x10 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_BTNTEXT = 0x12 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_CAPTIONTEXT = 0x9 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_GRADIENTACTIVECAPTION = 0x1b | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_GRADIENTINACTIVECAPTION = 0x1c | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_GRAYTEXT = 0x11 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_HIGHLIGHT = 0xd | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_HIGHLIGHTTEXT = 0xe | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_HOTLIGHT = 26 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_INACTIVECAPTION = 0x3 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_INACTIVECAPTIONTEXT = 0x13 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_INFOBK = 0x18 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_INFOTEXT = 0x17 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_MENU = 0x4 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_MENUTEXT = 0x7 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_SCROLLBAR = 0x0 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_WINDOW = 0x5 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_WINDOWFRAME = 0x6 | SYS_COLOR_INDEX_FLAG;
	public static const int COLOR_WINDOWTEXT = 0x8 | SYS_COLOR_INDEX_FLAG;
	public static const int COMPLEXREGION = 0x3;
	public static const int CP_ACP = 0x0;
	public static const int CP_UTF8 = 65001;
	public static const int CP_DROPDOWNBUTTON = 1;
	public static const int CP_INSTALLED = 0x1;
	public static const int CPS_COMPLETE = 0x1;
	public static const int CS_BYTEALIGNWINDOW = 0x2000;
	public static const int CS_DBLCLKS = 0x8;
	public static const int CS_DROPSHADOW = 0x20000;
	public static const int CS_GLOBALCLASS = 0x4000;
	public static const int CS_HREDRAW = 0x2;
	public static const int CS_VREDRAW = 0x1;
	public static const int CW_USEDEFAULT = 0x80000000;
	public static const TCHAR[] DATETIMEPICK_CLASS = "SysDateTimePick32\0"; //$NON-NLS-1$
	public static const int DATE_LONGDATE = 0x00000002;
	public static const int DATE_SHORTDATE = 0x00000001;
	public static const int DATE_YEARMONTH = 0x00000008; //#if(WINVER >= 0x0500)
	public static const int DCX_CACHE = 0x2;
	public static const int DCX_CLIPCHILDREN = 0x8;
	public static const int DCX_CLIPSIBLINGS = 0x10;
	public static const int DCX_INTERSECTRGN = 0x80;
	public static const int DCX_WINDOW = 0x1;
	public static const int DEFAULT_CHARSET = 0x1;
	public static const int DEFAULT_GUI_FONT = 0x11;
	public static const int DFCS_BUTTONCHECK = 0x0;
	public static const int DFCS_CHECKED = 0x400;
	public static const int DFCS_FLAT = 0x4000;
	public static const int DFCS_INACTIVE = 0x100;
	public static const int DFCS_PUSHED = 0x200;
	public static const int DFCS_SCROLLDOWN = 0x1;
	public static const int DFCS_SCROLLLEFT = 0x2;
	public static const int DFCS_SCROLLRIGHT = 0x3;
	public static const int DFCS_SCROLLUP = 0x0;
	public static const int DFC_BUTTON = 0x4;
	public static const int DFC_SCROLL = 0x3;
	public static const int DIB_RGB_COLORS = 0x0;
	public static const int DISP_E_EXCEPTION = 0x80020009;
	public static const int DI_NORMAL = 0x3;
	public static const int DI_NOMIRROR = 0x10;
	public static const int DLGC_BUTTON = 0x2000;
	public static const int DLGC_HASSETSEL = 0x8;
	public static const int DLGC_STATIC = 0x100;
	public static const int DLGC_WANTALLKEYS = 0x4;
	public static const int DLGC_WANTARROWS = 0x1;
	public static const int DLGC_WANTCHARS = 0x80;
	public static const int DLGC_WANTTAB = 0x2;
	public static const int DM_SETDEFID = 0x401;
	public static const int DSS_DISABLED = 0x20;
	public static const int DSTINVERT = 0x550009;
	public static const int DST_BITMAP = 0x4;
	public static const int DST_ICON = 0x3;
	public static const int DT_BOTTOM = 0x8;
	public static const int DT_CALCRECT = 0x400;
	public static const int DT_CENTER = 0x1;
	public static const int DT_EDITCONTROL = 0x2000;
	public static const int DT_EXPANDTABS = 0x40;
	public static const int DT_ENDELLIPSIS = 32768;
	public static const int DT_HIDEPREFIX = 0x100000;
	public static const int DT_LEFT = 0x0;
	public static const int DT_NOPREFIX = 0x800;
	public static const int DT_RASPRINTER = 0x2;
	public static const int DT_RIGHT = 0x2;
	public static const int DT_SINGLELINE = 0x20;
	public static const int DT_TOP = 0;
	public static const int DT_VCENTER = 4;
	public static const int DT_WORDBREAK = 0x10;
	public static const int DTM_FIRST = 0x1000;
	public static const int DTM_GETSYSTEMTIME = DTM_FIRST + 1;
	public static const int DTM_SETFORMAT = IsUnicode ? DTM_FIRST + 50 : DTM_FIRST + 5;
	public static const int DTM_SETSYSTEMTIME = DTM_FIRST + 2;
	public static const int DTN_FIRST = 0xFFFFFD08;
	public static const int DTN_DATETIMECHANGE = DTN_FIRST + 1;
	public static const int DTN_CLOSEUP = DTN_FIRST + 7;
	public static const int DTN_DROPDOWN = DTN_FIRST + 6;
	public static const int DTS_LONGDATEFORMAT = 0x0004;
	public static const int DTS_SHORTDATECENTURYFORMAT = 0x000C;
	public static const int DTS_SHORTDATEFORMAT = 0x0000;
	public static const int DTS_TIMEFORMAT = 0x0009;
	public static const int DTS_UPDOWN = 0x0001;
	public static const int DWM_BB_ENABLE = 0x1;
	public static const int DWM_BB_BLURREGION = 0x2;
	public static const int DWM_BB_TRANSITIONONMAXIMIZED = 0x4;
	public static const int E_POINTER = 0x80004003;
	public static const int EBP_NORMALGROUPBACKGROUND = 5;
	public static const int EBP_NORMALGROUPCOLLAPSE = 6;
	public static const int EBP_NORMALGROUPEXPAND = 7;
	public static const int EBP_NORMALGROUPHEAD = 8;
	public static const int EBNGC_NORMAL = 1;
	public static const int EBNGC_HOT = 2;
	public static const int EBNGC_PRESSED = 3;
	public static const int EBP_HEADERBACKGROUND = 1;
	public static const int EC_LEFTMARGIN = 0x1;
	public static const int EC_RIGHTMARGIN = 0x2;
	public static const int ECOOP_AND = 0x3;
	public static const int ECOOP_OR = 0x2;
	public static const int ECO_AUTOHSCROLL = 0x80;
	public static const int EDGE_RAISED = (BDR_RAISEDOUTER | BDR_RAISEDINNER);
	public static const int EDGE_SUNKEN = (BDR_SUNKENOUTER | BDR_SUNKENINNER);
	public static const int EDGE_ETCHED = (BDR_SUNKENOUTER | BDR_RAISEDINNER);
	public static const int EDGE_BUMP = (BDR_RAISEDOUTER | BDR_SUNKENINNER);
	public static const int ELF_VENDOR_SIZE = 4;
	public static const int EM_CANUNDO = 0xc6;
	public static const int EM_CHARFROMPOS = 0xd7;
	public static const int EM_DISPLAYBAND = 0x433;
	public static const int EM_GETFIRSTVISIBLELINE = 0xce;
	public static const int EM_GETLIMITTEXT = 0xd5;
	public static const int EM_GETLINE = 0xc4;
	public static const int EM_GETLINECOUNT = 0xba;
	public static const int EM_GETMARGINS = 0xd4;
	public static const int EM_GETPASSWORDCHAR = 0xd2;
	public static const int EM_GETSCROLLPOS = 0x4dd;
	public static const int EM_GETSEL = 0xb0;
	public static const int EM_LIMITTEXT = 0xc5;
	public static const int EM_LINEFROMCHAR = 0xc9;
	public static const int EM_LINEINDEX = 0xbb;
	public static const int EM_LINELENGTH = 0xc1;
	public static const int EM_LINESCROLL = 0xb6;
	public static const int EM_POSFROMCHAR = 0xd6;
	public static const int EM_REPLACESEL = 0xc2;
	public static const int EM_SCROLLCARET = 0xb7;
	public static const int EM_SETBKGNDCOLOR = 0x443;
	public static const int EM_SETLIMITTEXT = 0xc5;
	public static const int EM_SETMARGINS = 211;
	public static const int EM_SETOPTIONS = 0x44d;
	public static const int EM_SETPARAFORMAT = 0x447;
	public static const int EM_SETPASSWORDCHAR = 0xcc;
	public static const int EM_SETCUEBANNER = 0x1500 + 1;
	public static const int EM_SETREADONLY = 0xcf;
	public static const int EM_SETSEL = 0xb1;
	public static const int EM_SETTABSTOPS = 0xcb;
	public static const int EM_UNDO = 199;
	public static const int EMR_EXTCREATEFONTINDIRECTW = 82;
	public static const int EMR_EXTTEXTOUTW = 84;
	public static const int EN_ALIGN_LTR_EC = 0x0700;
	public static const int EN_ALIGN_RTL_EC = 0x0701;
	public static const int EN_CHANGE = 0x300;
	public static const int EP_EDITTEXT = 1;
	public static const int ERROR_NO_MORE_ITEMS = 0x103;
	public static const int ESB_DISABLE_BOTH = 0x3;
	public static const int ESB_ENABLE_BOTH = 0x0;
	public static const int ES_AUTOHSCROLL = 0x80;
	public static const int ES_AUTOVSCROLL = 0x40;
	public static const int ES_CENTER = 0x1;
	public static const int ES_MULTILINE = 0x4;
	public static const int ES_NOHIDESEL = 0x100;
	public static const int ES_PASSWORD = 0x20;
	public static const int ES_READONLY = 0x800;
	public static const int ES_RIGHT = 0x2;
	public static const int ETO_CLIPPED = 0x4;
	public static const int ETS_NORMAL = 1;
	public static const int ETS_HOT = 2;
	public static const int ETS_SELECTED = 3;
	public static const int ETS_DISABLED = 4;
	public static const int ETS_FOCUSED = 5;
	public static const int ETS_READONLY = 6;
	public static const int EVENT_OBJECT_FOCUS = 0x8005;
	public static const int EVENT_OBJECT_LOCATIONCHANGE = 0x800B;
	//  public static const int EVENT_OBJECT_SELECTION = 0x8006;
	public static const int EVENT_OBJECT_SELECTIONWITHIN = 0x8009;
	public static const int EVENT_OBJECT_VALUECHANGE = 0x800E;
	public static const int FALT = 0x10;
	public static const int FCONTROL = 0x8;
	public static const int FE_FONTSMOOTHINGCLEARTYPE = 0x0002;
	public static const int FEATURE_DISABLE_NAVIGATION_SOUNDS = 21;
	public static const int FILE_ATTRIBUTE_NORMAL = 0x00000080;
	public static const int FNERR_INVALIDFILENAME = 0x3002;
	public static const int FNERR_BUFFERTOOSMALL = 0x3003;
	public static const int FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
	public static const int FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;
	public static const int FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200;
	public static const int FR_PRIVATE = 0x10;
	public static const int FSHIFT = 0x4;
	public static const int FVIRTKEY = 0x1;
	public static const int GBS_NORMAL = 1;
	public static const int GBS_DISABLED = 2;
	public static const int GCS_COMPSTR = 0x8;
	public static const int GCS_RESULTSTR = 0x800;
	public static const int GCS_COMPATTR = 0x0010;
	public static const int GCS_COMPCLAUSE = 0x0020;
	public static const int GCS_CURSORPOS = 0x0080;
	public static const int GDT_VALID = 0;
	public static const int GET_FEATURE_FROM_PROCESS = 0x2;
	public static const int GLPS_CLOSED = 1;
	public static const int GLPS_OPENED = 2;
	public static const int GM_ADVANCED = 2;
	public static const int GMDI_USEDISABLED = 0x1;
	public static const int GMEM_FIXED = 0x0;
	public static const int GMEM_ZEROINIT = 0x40;
	public static const int GN_CONTEXTMENU = 1000;
	public static const int GPTR = 0x40;
	public static const int GRADIENT_FILL_RECT_H = 0x0;
	public static const int GRADIENT_FILL_RECT_V = 0x1;
	public static const int GTL_NUMBYTES = 0x10;
	public static const int GTL_NUMCHARS = 0x8;
	public static const int GTL_PRECISE = 0x2;
	public static const int GT_DEFAULT = 0x0;
	public static const int GUI_16BITTASK = 0x20;
	public static const int GUI_CARETBLINKING = 0x1;
	public static const int GUI_INMENUMODE = 0x4;
	public static const int GUI_INMOVESIZE = 0x2;
	public static const int GUI_POPUPMENUMODE = 0x10;
	public static const int GUI_SYSTEMMENUMODE = 0x8;
	public static const int GWL_EXSTYLE = 0xffffffec;
	public static const int GWL_ID = -12;
	public static const int GWL_HWNDPARENT = -8;
	public static const int GWL_STYLE = 0xfffffff0;
	public static const int GWL_USERDATA = 0xffffffeb;
	public static const int GWL_WNDPROC = 0xfffffffc;
	public static const int GWLP_ID = -12;
	public static const int GWLP_HWNDPARENT = -8;
	public static const int GWLP_USERDATA = 0xffffffeb;
	public static const int GWLP_WNDPROC = 0xfffffffc;
	public static const int GW_CHILD = 0x5;
	public static const int GW_HWNDFIRST = 0x0;
	public static const int GW_HWNDLAST = 0x1;
	public static const int GW_HWNDNEXT = 0x2;
	public static const int GW_HWNDPREV = 0x3;
	public static const int GW_OWNER = 0x4;
	public static const HBITMAP HBMMENU_CALLBACK = cast(HBITMAP)-1;
	public static const int HCBT_CREATEWND = 3;
	public static const int HCF_HIGHCONTRASTON = 0x1;
	public static const int HDF_BITMAP = 0x2000;
	public static const int HDF_BITMAP_ON_RIGHT = 0x1000;
	public static const int HDF_CENTER = 2;
	public static const int HDF_JUSTIFYMASK = 0x3;
	public static const int HDF_IMAGE = 0x0800;
	public static const int HDF_LEFT = 0;
	public static const int HDF_RIGHT = 1;
	public static const int HDF_SORTUP = 0x0400;
	public static const int HDF_SORTDOWN = 0x0200;
	public static const int HDI_BITMAP = 0x0010;
	public static const int HDI_IMAGE = 32;
	public static const int HDI_ORDER = 0x80;
	public static const int HDI_TEXT = 0x2;
	public static const int HDI_WIDTH = 0x1;
	public static const int HDI_FORMAT = 0x4;
	public static const int HDM_FIRST = 0x1200;
	public static const int HDM_DELETEITEM = HDM_FIRST + 2;
	public static const int HDM_GETBITMAPMARGIN = HDM_FIRST + 21;
	public static const int HDM_GETITEMCOUNT = 0x1200;
	public static const int HDM_GETITEMA = HDM_FIRST + 3;
	public static const int HDM_GETITEMW = HDM_FIRST + 11;
	public static const int HDM_GETITEM = IsUnicode ? HDM_GETITEMW : HDM_GETITEMA;
	public static const int HDM_GETITEMRECT = HDM_FIRST + 7;
	public static const int HDM_GETORDERARRAY = HDM_FIRST + 17;
	public static const int HDM_HITTEST = HDM_FIRST + 6;
	public static const int HDM_INSERTITEMA = HDM_FIRST + 1;
	public static const int HDM_INSERTITEMW = HDM_FIRST + 10;
	public static const int HDM_INSERTITEM = IsUnicode ? HDM_INSERTITEMW : HDM_INSERTITEMA;
	public static const int HDM_LAYOUT = HDM_FIRST + 5;
	public static const int HDM_ORDERTOINDEX = HDM_FIRST + 15;
	public static const int HDM_SETIMAGELIST = HDM_FIRST + 8;
	public static const int HDM_SETITEMA = HDM_FIRST + 4;
	public static const int HDM_SETITEMW = HDM_FIRST + 12;
	public static const int HDM_SETITEM = IsUnicode ? HDM_SETITEMW : HDM_SETITEMA;
	public static const int HDM_SETORDERARRAY = HDM_FIRST + 18;
	public static const int HDN_FIRST = 0xfffffed4;
	public static const int HDN_BEGINDRAG = HDN_FIRST - 10;
	public static const int HDN_BEGINTRACK = IsUnicode ? 0xfffffeba : 0xfffffece;
	public static const int HDN_BEGINTRACKW = 0xfffffeba;
	public static const int HDN_BEGINTRACKA = 0xfffffece;
	public static const int HDN_DIVIDERDBLCLICKA = HDN_FIRST - 5;
	public static const int HDN_DIVIDERDBLCLICKW = HDN_FIRST - 25;
	public static const int HDN_DIVIDERDBLCLICK = IsUnicode ? HDN_DIVIDERDBLCLICKW
		: HDN_DIVIDERDBLCLICKA;
	public static const int HDN_ENDDRAG = HDN_FIRST - 11;
	public static const int HDN_ITEMCHANGED = IsUnicode ? 0xfffffebf : 0xfffffed3;
	public static const int HDN_ITEMCHANGEDW = 0xfffffebf;
	public static const int HDN_ITEMCHANGEDA = 0xfffffed3;
	public static const int HDN_ITEMCHANGINGW = HDN_FIRST - 20;
	public static const int HDN_ITEMCHANGINGA = HDN_FIRST;
	public static const int HDN_ITEMCLICKW = HDN_FIRST - 22;
	public static const int HDN_ITEMCLICKA = HDN_FIRST - 2;
	public static const int HDN_ITEMDBLCLICKW = HDN_FIRST - 23;
	public static const int HDN_ITEMDBLCLICKA = HDN_FIRST - 3;
	public static const int HDN_ITEMDBLCLICK = IsUnicode ? HDN_ITEMDBLCLICKW : HDN_ITEMDBLCLICKA;
	public static const int HDS_BUTTONS = 0x2;
	public static const int HDS_DRAGDROP = 0x0040;
	public static const int HDS_FULLDRAG = 0x80;
	public static const int HDS_HIDDEN = 0x8;
	//  public static const int HEAP_ZERO_MEMORY = 0x8;
	public static const int HELPINFO_MENUITEM = 0x2;
	public static const int HHT_ONDIVIDER = 0x4;
	public static const int HHT_ONDIVOPEN = 0x8;
	public static const int HICF_ARROWKEYS = 0x2;
	public static const int HINST_COMMCTRL = 0xffffffff;
	public static const HKEY HKEY_CLASSES_ROOT = cast(HKEY) 0x80000000U;
	public static const HKEY HKEY_CURRENT_USER = cast(HKEY) 0x80000001U;
	public static const HKEY HKEY_LOCAL_MACHINE = cast(HKEY) 0x80000002U;
	public static const int HORZRES = 0x8;
	public static const int HTBORDER = 0x12;
	public static const int HTCAPTION = 0x2;
	public static const int HTCLIENT = 0x1;
	public static const int HTERROR = -2;
	public static const int HTHSCROLL = 0x6;
	public static const int HTMENU = 0x5;
	public static const int HTNOWHERE = 0x0;
	public static const int HTSYSMENU = 0x3;
	public static const int HTTRANSPARENT = 0xffffffff;
	public static const int HTVSCROLL = 0x7;
	public static const int HWND_BOTTOM = 0x1;
	public static const int HWND_TOP = 0x0;
	public static const int HWND_TOPMOST = 0xffffffff;
	public static const int HWND_NOTOPMOST = -2;
	public static const int ICC_COOL_CLASSES = 0x400;
	public static const int ICC_DATE_CLASSES = 0x100;
	public static const int ICM_NOTOPEN = 0x0;
	public static const int ICON_BIG = 0x1;
	public static const int ICON_SMALL = 0x0;
	public static const int I_IMAGECALLBACK = -1;
	public static const int I_IMAGENONE = -2;
	public static const int IDABORT = 0x3;
	public static const int IDANI_CAPTION = 3;
	public static const int IDB_STD_SMALL_COLOR = 0x0;
	public static const ptrdiff_t IDC_APPSTARTING = 0x7f8a;
	public static const ptrdiff_t IDC_ARROW = 0x7f00;
	public static const ptrdiff_t IDC_CROSS = 0x7f03;
	public static const ptrdiff_t IDC_HAND = 0x7f89;
	public static const ptrdiff_t IDC_HELP = 0x7f8b;
	public static const ptrdiff_t IDC_IBEAM = 0x7f01;
	public static const ptrdiff_t IDC_NO = 0x7f88;
	public static const ptrdiff_t IDC_SIZE = 0x7f80;
	public static const ptrdiff_t IDC_SIZEALL = 0x7f86;
	public static const ptrdiff_t IDC_SIZENESW = 0x7f83;
	public static const ptrdiff_t IDC_SIZENS = 0x7f85;
	public static const ptrdiff_t IDC_SIZENWSE = 0x7f82;
	public static const ptrdiff_t IDC_SIZEWE = 0x7f84;
	public static const ptrdiff_t IDC_UPARROW = 0x7f04;
	public static const ptrdiff_t IDC_WAIT = 0x7f02;
	public static const int IDI_APPLICATION = 32512;
	public static const int IDNO = 0x7;
	public static const int IDOK = 0x1;
	public static const int IDRETRY = 0x4;
	public static const int IDYES = 0x6;
	public static const int ILC_COLOR = 0x0;
	public static const int ILC_COLOR16 = 0x10;
	public static const int ILC_COLOR24 = 0x18;
	public static const int ILC_COLOR32 = 0x20;
	public static const int ILC_COLOR4 = 0x4;
	public static const int ILC_COLOR8 = 0x8;
	public static const int ILC_MASK = 0x1;
	public static const int ILC_MIRROR = 0x2000;
	public static const int ILD_NORMAL = 0x0;
	public static const int ILD_SELECTED = 0x4;
	public static const int IMAGE_BITMAP = 0x0;
	public static const int IMAGE_CURSOR = 0x2;
	public static const int IMAGE_ICON = 0x1;
	public static const int IME_CMODE_FULLSHAPE = 0x8;
	public static const int IME_CMODE_KATAKANA = 0x2;
	public static const int IME_CMODE_NATIVE = 0x1;
	public static const int IME_CMODE_ROMAN = 0x10;
	public static const int IMEMOUSE_LDOWN = 1;
	public static const int INFINITE = 0xffffffff;
	public static const int INPUT_KEYBOARD = 1;
	public static const int INPUT_MOUSE = 0;
	public static const int INTERNET_OPTION_END_BROWSER_SESSION = 42;
	public static const int KEY_ENUMERATE_SUB_KEYS = 0x8;
	public static const int KEY_NOTIFY = 0x10;
	public static const int KEY_QUERY_VALUE = 0x1;
	public static const int KEY_READ = 0x20019;
	public static const int KEYEVENTF_KEYUP = 0x0002;
	public static const int L_MAX_URL_LENGTH = 2084;
	//  public static const int LANG_KOREAN = 0x12;
	public static const int LANG_NEUTRAL = 0x0;
	public static const int LANG_USER_DEFAULT = 1 << 10;
	public static const int LAYOUT_RTL = 0x1;
	public static const int LAYOUT_BITMAPORIENTATIONPRESERVED = 0x8;
	public static const int LBN_DBLCLK = 0x2;
	public static const int LBN_SELCHANGE = 0x1;
	public static const int LBS_EXTENDEDSEL = 0x800;
	public static const int LBS_MULTIPLESEL = 0x8;
	public static const int LBS_NOINTEGRALHEIGHT = 0x100;
	public static const int LBS_NOTIFY = 0x1;
	public static const int LB_ADDSTRING = 0x180;
	public static const int LB_DELETESTRING = 0x182;
	public static const int LB_ERR = 0xffffffff;
	public static const int LB_ERRSPACE = 0xfffffffe;
	public static const int LB_FINDSTRINGEXACT = 0x1a2;
	public static const int LB_GETCARETINDEX = 0x19f;
	public static const int LB_GETCOUNT = 0x18b;
	public static const int LB_GETCURSEL = 0x188;
	public static const int LB_GETHORIZONTALEXTENT = 0x193;
	public static const int LB_GETITEMHEIGHT = 0x1a1;
	public static const int LB_GETITEMRECT = 0x198;
	public static const int LB_GETSEL = 0x187;
	public static const int LB_GETSELCOUNT = 0x190;
	public static const int LB_GETSELITEMS = 0x191;
	public static const int LB_GETTEXT = 0x189;
	public static const int LB_GETTEXTLEN = 0x18a;
	public static const int LB_GETTOPINDEX = 0x18e;
	public static const int LB_INITSTORAGE = 0x1a8;
	public static const int LB_INSERTSTRING = 0x181;
	public static const int LB_RESETCONTENT = 0x184;
	public static const int LB_SELITEMRANGE = 0x19b;
	public static const int LB_SELITEMRANGEEX = 0x183;
	public static const int LB_SETANCHORINDEX = 0xf19c;
	public static const int LB_SETCARETINDEX = 0x19e;
	public static const int LB_SETCURSEL = 0x186;
	public static const int LB_SETHORIZONTALEXTENT = 0x194;
	public static const int LB_SETSEL = 0x185;
	public static const int LB_SETTOPINDEX = 0x197;
	public static const int LF_FULLFACESIZE = 64;
	public static const int LF_FACESIZE = 32;
	public static const int LGRPID_ARABIC = 0xd;
	public static const int LGRPID_HEBREW = 0xc;
	public static const int LGRPID_INSTALLED = 1;
	public static const int LIF_ITEMINDEX = 0x1;
	public static const int LIF_STATE = 0x2;
	public static const int LIS_FOCUSED = 0x1;
	public static const int LIS_ENABLED = 0x2;
	public static const int LISS_HOT = 0x2;
	public static const int LISS_SELECTED = 0x3;
	public static const int LISS_SELECTEDNOTFOCUS = 0x5;
	public static const int LM_GETIDEALHEIGHT = 0x701;
	public static const int LM_SETITEM = 0x702;
	public static const int LM_GETITEM = 0x703;
	public static const int LCID_SUPPORTED = 0x2;
	public static const int LOCALE_IDEFAULTANSICODEPAGE = 0x1004;
	public static const int LOCALE_IDATE = 0x00000021;
	public static const int LOCALE_ITIME = 0x00000023;
	public static const int LOCALE_RETURN_NUMBER = 0x20000000; // #if(WINVER >= 0x0400)
	public static const int LOCALE_S1159 = 0x00000028;
	public static const int LOCALE_S2359 = 0x00000029;
	public static const int LOCALE_SDECIMAL = 14;
	public static const int LOCALE_SISO3166CTRYNAME = 0x5a;
	public static const int LOCALE_SISO639LANGNAME = 0x59;
	public static const int LOCALE_SLONGDATE = 0x00000020;
	public static const int LOCALE_SSHORTDATE = 0x0000001F;
	public static const int LOCALE_STIMEFORMAT = 0x00001003;
	public static const int LOCALE_SYEARMONTH = 0x00001006; // #if(WINVER >= 0x0500)
	public static const int LOCALE_SDAYNAME1 = 0x0000002A; // long name for Monday
	public static const int LOCALE_SDAYNAME2 = 0x0000002B; // long name for Tuesday
	public static const int LOCALE_SDAYNAME3 = 0x0000002C; // long name for Wednesday
	public static const int LOCALE_SDAYNAME4 = 0x0000002D; // long name for Thursday
	public static const int LOCALE_SDAYNAME5 = 0x0000002E; // long name for Friday
	public static const int LOCALE_SDAYNAME6 = 0x0000002F; // long name for Saturday
	public static const int LOCALE_SDAYNAME7 = 0x00000030; // long name for Sunday
	public static const int LOCALE_SMONTHNAME1 = 0x00000038; // long name for January
	public static const int LOCALE_SMONTHNAME2 = 0x00000039; // long name for February
	public static const int LOCALE_SMONTHNAME3 = 0x0000003A; // long name for March
	public static const int LOCALE_SMONTHNAME4 = 0x0000003B; // long name for April
	public static const int LOCALE_SMONTHNAME5 = 0x0000003C; // long name for May
	public static const int LOCALE_SMONTHNAME6 = 0x0000003D; // long name for June
	public static const int LOCALE_SMONTHNAME7 = 0x0000003E; // long name for July
	public static const int LOCALE_SMONTHNAME8 = 0x0000003F; // long name for August
	public static const int LOCALE_SMONTHNAME9 = 0x00000040; // long name for September
	public static const int LOCALE_SMONTHNAME10 = 0x00000041; // long name for October
	public static const int LOCALE_SMONTHNAME11 = 0x00000042; // long name for November
	public static const int LOCALE_SMONTHNAME12 = 0x00000043; // long name for December
	public static const int LOCALE_USER_DEFAULT = 1024;
	public static const int LOGPIXELSX = 0x58;
	public static const int LOGPIXELSY = 0x5a;
	public static const TCHAR* LPSTR_TEXTCALLBACK = cast(TCHAR*)-1;
	public static const int LR_DEFAULTCOLOR = 0x0;
	public static const int LR_SHARED = 0x8000;
	public static const int LVCFMT_BITMAP_ON_RIGHT = 0x1000;
	public static const int LVCFMT_CENTER = 0x2;
	public static const int LVCFMT_IMAGE = 0x800;
	public static const int LVCFMT_LEFT = 0x0;
	public static const int LVCFMT_RIGHT = 0x1;
	public static const int LVCF_FMT = 0x1;
	public static const int LVCF_IMAGE = 0x10;
	public static const int LVCFMT_JUSTIFYMASK = 0x3;
	public static const int LVCF_TEXT = 0x4;
	public static const int LVCF_WIDTH = 0x2;
	public static const int LVHT_ONITEM = 0xe;
	public static const int LVHT_ONITEMICON = 0x2;
	public static const int LVHT_ONITEMLABEL = 0x4;
	public static const int LVHT_ONITEMSTATEICON = 0x8;
	public static const int LVIF_IMAGE = 0x2;
	public static const int LVIF_INDENT = 0x10;
	public static const int LVIF_STATE = 0x8;
	public static const int LVIF_TEXT = 0x1;
	public static const int LVIR_BOUNDS = 0x0;
	public static const int LVIR_ICON = 0x1;
	public static const int LVIR_LABEL = 0x2;
	public static const int LVIR_SELECTBOUNDS = 0x3;
	public static const int LVIS_DROPHILITED = 0x8;
	public static const int LVIS_FOCUSED = 0x1;
	public static const int LVIS_SELECTED = 0x2;
	public static const int LVIS_STATEIMAGEMASK = 0xf000;
	public static const int LVM_FIRST = 0x1000;
	public static const int LVM_APPROXIMATEVIEWRECT = 0x1040;
	public static const int LVM_CREATEDRAGIMAGE = LVM_FIRST + 33;
	public static const int LVM_DELETEALLITEMS = 0x1009;
	public static const int LVM_DELETECOLUMN = 0x101c;
	public static const int LVM_DELETEITEM = 0x1008;
	public static const int LVM_ENSUREVISIBLE = 0x1013;
	public static const int LVM_GETBKCOLOR = 0x1000;
	public static const int LVM_GETCOLUMN = IsUnicode ? 0x105f : 0x1019;
	public static const int LVM_GETCOLUMNORDERARRAY = LVM_FIRST + 59;
	public static const int LVM_GETCOLUMNWIDTH = 0x101d;
	public static const int LVM_GETCOUNTPERPAGE = 0x1028;
	public static const int LVM_GETEXTENDEDLISTVIEWSTYLE = 0x1037;
	public static const int LVM_GETHEADER = 0x101f;
	public static const int LVM_GETIMAGELIST = 0x1002;
	public static const int LVM_GETITEM = IsUnicode ? 0x104b : 0x1005;
	public static const int LVM_GETITEMW = 0x104b;
	public static const int LVM_GETITEMA = 0x1005;
	public static const int LVM_GETITEMCOUNT = 0x1004;
	public static const int LVM_GETITEMRECT = 0x100e;
	public static const int LVM_GETITEMSTATE = 0x102c;
	public static const int LVM_GETNEXTITEM = 0x100c;
	public static const int LVM_GETSELECTEDCOLUMN = LVM_FIRST + 174;
	public static const int LVM_GETSELECTEDCOUNT = 0x1032;
	public static const int LVM_GETSTRINGWIDTH = IsUnicode ? 0x1057 : 0x1011;
	public static const int LVM_GETSUBITEMRECT = 0x1038;
	public static const int LVM_GETTEXTCOLOR = 0x1023;
	public static const int LVM_GETTOOLTIPS = 0x104e;
	public static const int LVM_GETTOPINDEX = 0x1027;
	public static const int LVM_HITTEST = 0x1012;
	public static const int LVM_INSERTCOLUMN = IsUnicode ? 0x1061 : 0x101b;
	public static const int LVM_INSERTITEM = IsUnicode ? 0x104d : 0x1007;
	public static const int LVM_REDRAWITEMS = LVM_FIRST + 21;
	public static const int LVM_SCROLL = 0x1014;
	public static const int LVM_SETBKCOLOR = 0x1001;
	public static const int LVM_SETCALLBACKMASK = LVM_FIRST + 11;
	public static const int LVM_SETCOLUMN = IsUnicode ? 0x1060 : 0x101a;
	public static const int LVM_SETCOLUMNORDERARRAY = LVM_FIRST + 58;
	public static const int LVM_SETCOLUMNWIDTH = 0x101e;
	public static const int LVM_SETEXTENDEDLISTVIEWSTYLE = 0x1036;
	public static const int LVM_SETIMAGELIST = 0x1003;
	public static const int LVM_SETITEM = IsUnicode ? 0x104c : 0x1006;
	public static const int LVM_SETITEMCOUNT = LVM_FIRST + 47;
	public static const int LVM_SETITEMSTATE = 0x102b;
	public static const int LVM_SETSELECTIONMARK = LVM_FIRST + 67;
	public static const int LVM_SETSELECTEDCOLUMN = LVM_FIRST + 140;
	public static const int LVM_SETTEXTBKCOLOR = 0x1026;
	public static const int LVM_SETTEXTCOLOR = 0x1024;
	public static const int LVM_SETTOOLTIPS = LVM_FIRST + 74;
	public static const int LVM_SUBITEMHITTEST = LVM_FIRST + 57;
	public static const int LVNI_FOCUSED = 0x1;
	public static const int LVNI_SELECTED = 0x2;
	public static const int LVN_BEGINDRAG = 0xffffff93;
	public static const int LVN_BEGINRDRAG = 0xffffff91;
	public static const int LVN_COLUMNCLICK = 0xffffff94;
	public static const int LVN_FIRST = 0xffffff9c;
	public static const int LVN_GETDISPINFOA = LVN_FIRST - 50;
	public static const int LVN_GETDISPINFOW = LVN_FIRST - 77;
	public static const int LVN_ITEMACTIVATE = 0xffffff8e;
	public static const int LVN_ITEMCHANGED = 0xffffff9b;
	public static const int LVN_MARQUEEBEGIN = 0xffffff64;
	public static const int LVN_ODFINDITEMA = LVN_FIRST - 52;
	public static const int LVN_ODFINDITEMW = LVN_FIRST - 79;
	public static const int LVN_ODSTATECHANGED = LVN_FIRST - 15;
	public static const int LVP_LISTITEM = 1;
	public static const int LVSCW_AUTOSIZE = 0xffffffff;
	public static const int LVSCW_AUTOSIZE_USEHEADER = 0xfffffffe;
	public static const int LVSICF_NOINVALIDATEALL = 0x1;
	public static const int LVSICF_NOSCROLL = 0x2;
	public static const int LVSIL_SMALL = 0x1;
	public static const int LVSIL_STATE = 0x2;
	public static const int LVS_EX_DOUBLEBUFFER = 0x10000;
	public static const int LVS_EX_FULLROWSELECT = 0x20;
	public static const int LVS_EX_GRIDLINES = 0x1;
	public static const int LVS_EX_HEADERDRAGDROP = 0x10;
	public static const int LVS_EX_LABELTIP = 0x4000;
	public static const int LVS_EX_ONECLICKACTIVATE = 0x40;
	public static const int LVS_EX_SUBITEMIMAGES = 0x2;
	public static const int LVS_EX_TRACKSELECT = 0x8;
	public static const int LVS_EX_TRANSPARENTBKGND = 0x800000;
	public static const int LVS_EX_TWOCLICKACTIVATE = 0x80;
	public static const int LVS_LIST = 0x3;
	public static const int LVS_NOCOLUMNHEADER = 0x4000;
	public static const int LVS_NOSCROLL = 0x2000;
	public static const int LVS_OWNERDATA = 0x1000;
	public static const int LVS_OWNERDRAWFIXED = 0x400;
	public static const int LVS_REPORT = 0x1;
	public static const int LVS_SHAREIMAGELISTS = 0x40;
	public static const int LVS_SHOWSELALWAYS = 0x8;
	public static const int LVS_SINGLESEL = 0x4;
	public static const int LWA_COLORKEY = 0x00000001;
	public static const int LWA_ALPHA = 0x00000002;
	public static const int MAX_LINKID_TEXT = 48;
	//  public static const int MAX_PATH = 260;
	public static const int MA_NOACTIVATE = 0x3;
	//  public static const int MANIFEST_RESOURCE_ID = 2;
	public static const int MB_ABORTRETRYIGNORE = 0x2;
	public static const int MB_APPLMODAL = 0x0;
	public static const int MB_ICONERROR = 0x10;
	public static const int MB_ICONINFORMATION = 0x40;
	public static const int MB_ICONQUESTION = 0x20;
	public static const int MB_ICONWARNING = 0x30;
	public static const int MB_OK = 0x0;
	public static const int MB_OKCANCEL = 0x1;
	public static const int MB_PRECOMPOSED = 0x1;
	public static const int MB_RETRYCANCEL = 0x5;
	public static const int MB_RIGHT = 0x00080000;
	public static const int MB_RTLREADING = 0x100000;
	public static const int MB_SYSTEMMODAL = 0x1000;
	public static const int MB_TASKMODAL = 0x2000;
	public static const int MB_TOPMOST = 0x00040000;
	public static const int MB_YESNO = 0x4;
	public static const int MB_YESNOCANCEL = 0x3;
	public static const int MCM_FIRST = 0x1000;
	public static const int MCM_GETCURSEL = MCM_FIRST + 1;
	public static const int MCM_SETCURSEL = MCM_FIRST + 2;
	public static const int MCN_FIRST = 0xFFFFFD12;
	public static const int MCN_SELCHANGE = MCN_FIRST + 1;
	public static const int MCN_SELECT = MCN_FIRST + 4;
	public static const int MCM_GETMINREQRECT = MCM_FIRST + 9;
	public static const int MCS_NOTODAY = 0x0010;
	public static const int MDIS_ALLCHILDSTYLES = 0x0001;
	public static const int MFS_CHECKED = 0x8;
	public static const int MFS_DISABLED = 0x3;
	public static const int MFS_GRAYED = 0x3;
	public static const int MFT_RADIOCHECK = 0x200;
	public static const int MFT_RIGHTJUSTIFY = 0x4000;
	public static const int MFT_RIGHTORDER = 0x2000;
	public static const int MFT_SEPARATOR = 0x800;
	public static const int MFT_STRING = 0x0;
	public static const int MF_BYCOMMAND = 0x0;
	public static const int MF_BYPOSITION = 0x400;
	public static const int MF_CHECKED = 0x8;
	public static const int MF_DISABLED = 0x2;
	public static const int MF_ENABLED = 0x0;
	public static const int MF_GRAYED = 0x1;
	public static const int MF_HILITE = 0x80;
	public static const int MF_POPUP = 0x10;
	public static const int MF_SEPARATOR = 0x800;
	public static const int MF_SYSMENU = 0x2000;
	public static const int MF_UNCHECKED = 0x0;
	public static const int MIIM_BITMAP = 0x80;
	public static const int MIIM_DATA = 0x20;
	public static const int MIIM_ID = 0x2;
	public static const int MIIM_STATE = 0x1;
	public static const int MIIM_STRING = 0x40;
	public static const int MIIM_SUBMENU = 0x4;
	public static const int MIIM_TYPE = 0x10;
	public static const int MIM_BACKGROUND = 0x2;
	public static const int MIM_STYLE = 0x10;
	public static const int MK_ALT = 0x20;
	public static const int MK_CONTROL = 0x8;
	public static const int MK_LBUTTON = 0x1;
	public static const int MK_MBUTTON = 0x10;
	public static const int MK_RBUTTON = 0x2;
	public static const int MK_SHIFT = 0x4;
	public static const int MK_XBUTTON1 = 0x20;
	public static const int MK_XBUTTON2 = 0x40;
	public static const int MM_TEXT = 0x1;
	public static const int MNC_CLOSE = 0x1;
	public static const int MNS_CHECKORBMP = 0x4000000;
	public static const int MONITOR_DEFAULTTONEAREST = 0x2;
	public static const int MONITORINFOF_PRIMARY = 0x1;
	public static const TCHAR[] MONTHCAL_CLASS = "SysMonthCal32\0"; //$NON-NLS-1$
	public static const int MOUSEEVENTF_ABSOLUTE = 0x8000;
	public static const int MOUSEEVENTF_LEFTDOWN = 0x0002;
	public static const int MOUSEEVENTF_LEFTUP = 0x0004;
	public static const int MOUSEEVENTF_MIDDLEDOWN = 0x0020;
	public static const int MOUSEEVENTF_MIDDLEUP = 0x0040;
	public static const int MOUSEEVENTF_MOVE = 0x0001;
	public static const int MOUSEEVENTF_RIGHTDOWN = 0x0008;
	public static const int MOUSEEVENTF_RIGHTUP = 0x0010;
	public static const int MOUSEEVENTF_VIRTUALDESK = 0x4000;
	public static const int MOUSEEVENTF_WHEEL = 0x0800;
	public static const int MOUSEEVENTF_XDOWN = 0x0080;
	public static const int MOUSEEVENTF_XUP = 0x0100;
	public static const int MSGF_DIALOGBOX = 0;
	public static const int MSGF_COMMCTRL_BEGINDRAG = 0x4200;
	public static const int MSGF_COMMCTRL_SIZEHEADER = 0x4201;
	public static const int MSGF_COMMCTRL_DRAGSELECT = 0x4202;
	public static const int MSGF_COMMCTRL_TOOLBARCUST = 0x4203;
	public static const int MSGF_MAINLOOP = 8;
	public static const int MSGF_MENU = 2;
	public static const int MSGF_MOVE = 3;
	public static const int MSGF_MESSAGEBOX = 1;
	public static const int MSGF_NEXTWINDOW = 6;
	public static const int MSGF_SCROLLBAR = 5;
	public static const int MSGF_SIZE = 4;
	public static const int MSGF_USER = 4096;
	public static const int MWMO_INPUTAVAILABLE = 0x4;
	public static const int NI_COMPOSITIONSTR = 0x15;
	public static const int NIF_ICON = 0x00000002;
	public static const int NIF_INFO = 0x00000010;
	public static const int NIF_MESSAGE = 0x00000001;
	public static const int NIF_STATE = 0x00000008;
	public static const int NIF_TIP = 0x00000004;
	public static const int NIIF_ERROR = 0x00000003;
	public static const int NIIF_INFO = 0x00000001;
	public static const int NIIF_NONE = 0x00000000;
	public static const int NIIF_WARNING = 0x00000002;
	public static const int NIM_ADD = 0x00000000;
	public static const int NIM_DELETE = 0x00000002;
	public static const int NIM_MODIFY = 0x00000001;
	public static const int NIN_SELECT = 0x400 + 0;
	public static const int NINF_KEY = 0x1;
	public static const int NIN_KEYSELECT = NIN_SELECT | NINF_KEY;
	public static const int NIN_BALLOONSHOW = 0x400 + 2;
	public static const int NIN_BALLOONHIDE = 0x400 + 3;
	public static const int NIN_BALLOONTIMEOUT = 0x400 + 4;
	public static const int NIN_BALLOONUSERCLICK = 0x400 + 5;
	public static const int NIS_HIDDEN = 0x00000001;
	public static const int NM_FIRST = 0x0;
	public static const int NM_CLICK = 0xfffffffe;
	public static const int NM_CUSTOMDRAW = NM_FIRST - 12;
	public static const int NM_DBLCLK = 0xfffffffd;
	public static const int NM_RECOGNIZEGESTURE = NM_FIRST - 16;
	public static const int NM_RELEASEDCAPTURE = NM_FIRST - 16;
	public static const int NM_RETURN = 0xfffffffc;
	public static int NOTIFYICONDATAA_V2_SIZE;
	public static int NOTIFYICONDATAW_V2_SIZE;
	public static int NOTIFYICONDATA_V2_SIZE;
	public static const int NOTSRCCOPY = 0x330008;
	public static const int NULLREGION = 0x1;
	public static const int NULL_BRUSH = 0x5;
	public static const int NULL_PEN = 0x8;
	public static const int NUMRESERVED = 106;
	public static const int OBJID_CARET = 0xFFFFFFF8;
	public static const int OBJID_CLIENT = 0xFFFFFFFC;
	public static const int OBJID_MENU = 0xFFFFFFFD;
	public static const int OBJID_WINDOW = 0x00000000;
	public static const int OBJ_BITMAP = 0x7;
	public static const int OBJ_FONT = 0x6;
	public static const int OBJ_PEN = 0x1;
	public static const int OBJID_HSCROLL = 0xFFFFFFFA;
	public static const int OBJID_VSCROLL = 0xFFFFFFFB;
	public static const TCHAR* OBM_CHECKBOXES = cast(TCHAR*) 0x7ff7;
	public static const int ODS_SELECTED = 0x1;
	public static const int ODT_MENU = 0x1;
	public static const int OFN_ALLOWMULTISELECT = 0x200;
	public static const int OFN_EXPLORER = 0x80000;
	public static const int OFN_ENABLEHOOK = 0x20;
	public static const int OFN_HIDEREADONLY = 0x4;
	public static const int OFN_NOCHANGEDIR = 0x8;
	public static const int OFN_OVERWRITEPROMPT = 0x2;
	public static const int OIC_BANG = 0x7F03;
	public static const int OIC_HAND = 0x7F01;
	public static const int OIC_INFORMATION = 0x7F04;
	public static const int OIC_QUES = 0x7F02;
	public static const int OIC_WINLOGO = 0x7F05;
	public static const int OPAQUE = 0x2;
	public static const int PATCOPY = 0xf00021;
	public static const int PATINVERT = 0x5a0049;
	public static const int PBM_GETPOS = 0x408;
	public static const int PBM_GETRANGE = 0x407;
	public static const int PBM_GETSTATE = 0x400 + 17;
	public static const int PBM_SETBARCOLOR = 0x409;
	public static const int PBM_SETBKCOLOR = 0x2001;
	public static const int PBM_SETMARQUEE = 0x400 + 10;
	public static const int PBM_SETPOS = 0x402;
	public static const int PBM_SETRANGE32 = 0x406;
	public static const int PBM_SETSTATE = 0x400 + 16;
	public static const int PBM_STEPIT = 0x405;
	public static const int PBS_MARQUEE = 0x08;
	public static const int PBS_SMOOTH = 0x1;
	public static const int PBS_VERTICAL = 0x4;
	public static const int PBS_NORMAL = 1;
	public static const int PBS_HOT = 2;
	public static const int PBS_PRESSED = 3;
	public static const int PBS_DISABLED = 4;
	public static const int PBS_DEFAULTED = 5;
	public static const int PBST_NORMAL = 0x0001;
	public static const int PBST_ERROR = 0x0002;
	public static const int PBST_PAUSED = 0x0003;
	public static const int PD_ALLPAGES = 0x0;
	public static const int PD_COLLATE = 0x10;
	public static const int PD_PAGENUMS = 0x2;
	public static const int PD_PRINTTOFILE = 0x20;
	public static const int PD_RETURNDC = 0x100;
	public static const int PD_SELECTION = 0x1;
	public static const int PD_USEDEVMODECOPIESANDCOLLATE = 0x40000;
	public static const int PT_CLOSEFIGURE = 1;
	public static const int PT_LINETO = 2;
	public static const int PT_BEZIERTO = 4;
	public static const int PT_MOVETO = 6;
	public static const int PFM_TABSTOPS = 0x10;
	public static const int PHYSICALHEIGHT = 0x6f;
	public static const int PHYSICALOFFSETX = 0x70;
	public static const int PHYSICALOFFSETY = 0x71;
	public static const int PHYSICALWIDTH = 0x6e;
	public static const int PLANES = 0xe;
	public static const int PM_NOREMOVE = 0x0;
	public static const int PM_NOYIELD = 0x2;
	public static const int QS_HOTKEY = 0x0080;
	public static const int QS_KEY = 0x0001;
	public static const int QS_MOUSEMOVE = 0x0002;
	public static const int QS_MOUSEBUTTON = 0x0004;
	public static const int QS_MOUSE = QS_MOUSEMOVE | QS_MOUSEBUTTON;
	public static const int QS_INPUT = QS_KEY | QS_MOUSE;
	public static const int QS_POSTMESSAGE = 0x0008;
	public static const int QS_TIMER = 0x0010;
	public static const int QS_PAINT = 0x0020;
	public static const int QS_SENDMESSAGE = 0x0040;
	public static const int QS_ALLINPUT = QS_MOUSEMOVE | QS_MOUSEBUTTON | QS_KEY
		| QS_POSTMESSAGE | QS_TIMER | QS_PAINT | QS_SENDMESSAGE;
	public static const int PM_QS_INPUT = QS_INPUT << 16;
	public static const int PM_QS_POSTMESSAGE = (QS_POSTMESSAGE | QS_HOTKEY | QS_TIMER) << 16;
	public static const int PM_QS_PAINT = QS_PAINT << 16;
	public static const int PM_QS_SENDMESSAGE = QS_SENDMESSAGE << 16;
	public static const int PM_REMOVE = 0x1;
	public static const TCHAR[] PROGRESS_CLASS = "msctls_progress32\0"; //$NON-NLS-1$
	public static const int PP_BAR = 1;
	public static const int PP_BARVERT = 2;
	public static const int PP_CHUNK = 3;
	public static const int PP_CHUNKVERT = 4;
	public static const int PRF_CHILDREN = 16;
	public static const int PRF_CLIENT = 0x4;
	public static const int PRF_ERASEBKGND = 0x8;
	public static const int PRF_NONCLIENT = 0x2;
	public static const int PROGRESSCHUNKSIZE = 2411;
	public static const int PROGRESSSPACESIZE = 2412;
	public static const int PS_DASH = 0x1;
	public static const int PS_DASHDOT = 0x3;
	public static const int PS_DASHDOTDOT = 0x4;
	public static const int PS_DOT = 0x2;
	public static const int PS_ENDCAP_FLAT = 0x200;
	public static const int PS_ENDCAP_SQUARE = 0x100;
	public static const int PS_ENDCAP_ROUND = 0x000;
	public static const int PS_ENDCAP_MASK = 0xF00;
	public static const int PS_GEOMETRIC = 0x10000;
	public static const int PS_JOIN_BEVEL = 0x1000;
	public static const int PS_JOIN_MASK = 0xF000;
	public static const int PS_JOIN_MITER = 0x2000;
	public static const int PS_JOIN_ROUND = 0x0000;
	public static const int PS_SOLID = 0x0;
	public static const int PS_STYLE_MASK = 0xf;
	public static const int PS_TYPE_MASK = 0x000f0000;
	public static const int PS_USERSTYLE = 0x7;
	public static const int R2_COPYPEN = 0xd;
	public static const int R2_XORPEN = 0x7;
	public static const int RASTERCAPS = 0x26;
	public static const int RASTER_FONTTYPE = 0x1;
	public static const int RBBIM_CHILD = 0x10;
	public static const int RBBIM_CHILDSIZE = 0x20;
	public static const int RBBIM_COLORS = 0x2;
	public static const int RBBIM_HEADERSIZE = 0x800;
	public static const int RBBIM_ID = 0x100;
	public static const int RBBIM_IDEALSIZE = 0x200;
	public static const int RBBIM_SIZE = 0x40;
	public static const int RBBIM_STYLE = 0x1;
	public static const int RBBIM_TEXT = 0x4;
	public static const int RBBS_BREAK = 0x1;
	public static const int RBBS_GRIPPERALWAYS = 0x80;
	public static const int RBBS_NOGRIPPER = 0x00000100;
	public static const int RBBS_USECHEVRON = 0x00000200;
	public static const int RBBS_VARIABLEHEIGHT = 0x40;
	public static const int RBN_FIRST = 0xfffffcc1;
	public static const int RBN_BEGINDRAG = RBN_FIRST - 4;
	public static const int RBN_CHILDSIZE = RBN_FIRST - 8;
	public static const int RBN_CHEVRONPUSHED = RBN_FIRST - 10;
	public static const int RBN_HEIGHTCHANGE = 0xfffffcc1;
	public static const int RBS_DBLCLKTOGGLE = 0x8000;
	public static const int RBS_BANDBORDERS = 0x400;
	public static const int RBS_VARHEIGHT = 0x200;
	public static const int RB_DELETEBAND = 0x402;
	public static const int RB_GETBANDBORDERS = 0x422;
	public static const int RB_GETBANDCOUNT = 0x40c;
	public static const int RB_GETBANDINFO = IsUnicode ? 0x41c : 0x41d;
	public static const int RB_GETBANDMARGINS = 0x428;
	public static const int RB_GETBARHEIGHT = 0x41b;
	public static const int RB_GETBKCOLOR = 0x414;
	public static const int RB_GETRECT = 0x409;
	public static const int RB_GETTEXTCOLOR = 0x416;
	public static const int RB_IDTOINDEX = 0x410;
	public static const int RB_INSERTBAND = IsUnicode ? 0x40a : 0x401;
	public static const int RB_MOVEBAND = 0x427;
	public static const int RB_SETBANDINFO = IsUnicode ? 0x40b : 0x406;
	public static const int RB_SETBKCOLOR = 0x413;
	public static const int RB_SETTEXTCOLOR = 0x415;
	public static const int RC_BITBLT = 0x1;
	public static const int RC_PALETTE = 0x100;
	public static const int RDW_ALLCHILDREN = 0x80;
	public static const int RDW_ERASE = 0x4;
	public static const int RDW_FRAME = 0x400;
	public static const int RDW_INVALIDATE = 0x1;
	public static const int RDW_UPDATENOW = 0x100;
	public static const int READ_CONTROL = 0x20000;
	public static const TCHAR[] REBARCLASSNAME = "ReBarWindow32\0"; //$NON-NLS-1$
	public static const int RGN_AND = 0x1;
	public static const int RGN_COPY = 5;
	public static const int RGN_DIFF = 0x4;
	public static const int RGN_ERROR = 0;
	public static const int RGN_OR = 0x2;
	public static const int RP_BAND = 3;
	public static const int SBP_ARROWBTN = 0x1;
	public static const int SBP_THUMBBTNHORZ = 2;
	public static const int SBP_THUMBBTNVERT = 3;
	public static const int SBP_LOWERTRACKHORZ = 4;
	public static const int SBP_UPPERTRACKHORZ = 5;
	public static const int SBP_LOWERTRACKVERT = 6;
	public static const int SBP_UPPERTRACKVERT = 7;
	public static const int SBP_GRIPPERHORZ = 8;
	public static const int SBP_GRIPPERVERT = 9;
	public static const int SBP_SIZEBOX = 10;
	public static const int SBS_HORZ = 0x0;
	public static const int SBS_VERT = 0x1;
	public static const int SB_BOTH = 0x3;
	public static const int SB_BOTTOM = 0x7;
	public static const int SB_CTL = 0x2;
	public static const int SB_ENDSCROLL = 0x8;
	public static const int SB_HORZ = 0x0;
	public static const int SB_LINEDOWN = 0x1;
	public static const int SB_LINEUP = 0x0;
	public static const int SB_PAGEDOWN = 0x3;
	public static const int SB_PAGEUP = 0x2;
	public static const int SB_THUMBPOSITION = 0x4;
	public static const int SB_THUMBTRACK = 0x5;
	public static const int SB_TOP = 0x6;
	public static const int SB_VERT = 0x1;
	public static const int SCF_ALL = 0x4;
	public static const int SCF_DEFAULT = 0x0;
	public static const int SCF_SELECTION = 0x1;
	public static const int SC_CLOSE = 0xf060;
	public static const int SC_HSCROLL = 0xf080;
	public static const int SC_KEYMENU = 0xf100;
	public static const int SC_MAXIMIZE = 0xf030;
	public static const int SC_MINIMIZE = 0xf020;
	public static const int SC_NEXTWINDOW = 0xF040;
	public static const int SC_RESTORE = 0xf120;
	public static const int SC_SIZE = 0xf000;
	public static const int SC_TASKLIST = 0xf130;
	public static const int SC_VSCROLL = 0xf070;
	public static const int SCRBS_NORMAL = 1;
	public static const int SCRBS_HOT = 2;
	public static const int SCRBS_PRESSED = 3;
	public static const int SCRBS_DISABLED = 4;
	public static const int SEM_FAILCRITICALERRORS = 0x1;
	public static const int SET_FEATURE_ON_PROCESS = 0x2;
	public static const int SF_RTF = 0x2;
	public static const int SHCMBF_HIDDEN = 0x2;
	public static const int SHCMBM_OVERRIDEKEY = 0x400 + 403;
	public static const int SHCMBM_SETSUBMENU = 0x590;
	public static const int SHCMBM_GETSUBMENU = 0x591;
	public static const int SHGFI_ICON = 0x000000100;
	public static const int SHGFI_SMALLICON = 0x1;
	public static const int SHGFI_USEFILEATTRIBUTES = 0x000000010;
	public static const int SHMBOF_NODEFAULT = 0x1;
	public static const int SHMBOF_NOTIFY = 0x2;
	public static const int SHRG_RETURNCMD = 0x1;
	public static const int SIF_ALL = 0x17;
	public static const int SIF_DISABLENOSCROLL = 0x8;
	public static const int SIF_PAGE = 0x2;
	public static const int SIF_POS = 0x4;
	public static const int SIF_RANGE = 0x1;
	public static const int SIF_TRACKPOS = 0x10;
	public static const int SIP_DOWN = 1;
	public static const int SIP_UP = 0;
	public static const int SIPF_ON = 0x1;
	public static const int SIZE_RESTORED = 0;
	public static const int SIZE_MINIMIZED = 1;
	public static const int SIZE_MAXIMIZED = 2;
	public static const int SIZEPALETTE = 104;
	public static const int SM_CMONITORS = 80;
	public static const int SM_CXBORDER = 0x5;
	public static const int SM_CXCURSOR = 0xd;
	public static const int SM_CXDOUBLECLK = 36;
	public static const int SM_CYDOUBLECLK = 37;
	public static const int SM_CXEDGE = 0x2d;
	public static const int SM_CXFOCUSBORDER = 83;
	public static const int SM_CXHSCROLL = 0x15;
	public static const int SM_CXICON = 0x0b;
	public static const int SM_CYICON = 0x0c;
	public static const int SM_CXVIRTUALSCREEN = 78;
	public static const int SM_CYVIRTUALSCREEN = 79;
	public static const int SM_CXSMICON = 49;
	public static const int SM_CYSMICON = 50;
	public static const int SM_CXSCREEN = 0x0;
	public static const int SM_XVIRTUALSCREEN = 76;
	public static const int SM_YVIRTUALSCREEN = 77;
	public static const int SM_CXVSCROLL = 0x2;
	public static const int SM_CYBORDER = 0x6;
	public static const int SM_CYCURSOR = 0xe;
	public static const int SM_CYFOCUSBORDER = 84;
	public static const int SM_CYHSCROLL = 0x3;
	public static const int SM_CYMENU = 0xf;
	public static const int SM_CXMINTRACK = 34;
	public static const int SM_CYMINTRACK = 35;
	public static const int SM_CMOUSEBUTTONS = 43;
	public static const int SM_CYSCREEN = 0x1;
	public static const int SM_CYVSCROLL = 0x14;
	//  public static const int SM_DBCSENABLED = 0x2A;
	//  public static const int SM_IMMENABLED = 0x52;
	public static const int SPI_GETFONTSMOOTHINGTYPE = 0x200A;
	public static const int SPI_GETHIGHCONTRAST = 66;
	public static const int SPI_GETWORKAREA = 0x30;
	public static const int SPI_GETMOUSEVANISH = 0x1020;
	public static const int SPI_GETNONCLIENTMETRICS = 41;
	public static const int SPI_GETWHEELSCROLLLINES = 104;
	public static const int SPI_GETCARETWIDTH = 0x2006;
	public static const int SPI_SETSIPINFO = 224;
	public static const int SPI_SETHIGHCONTRAST = 67;
	public static const int SRCAND = 0x8800c6;
	public static const int SRCCOPY = 0xcc0020;
	public static const int SRCINVERT = 0x660046;
	public static const int SRCPAINT = 0xee0086;
	public static const int SS_BITMAP = 0xe;
	public static const int SS_CENTER = 0x1;
	public static const int SS_CENTERIMAGE = 0x200;
	public static const int SS_EDITCONTROL = 0x2000;
	public static const int SS_ICON = 0x3;
	public static const int SS_LEFT = 0x0;
	public static const int SS_LEFTNOWORDWRAP = 0xc;
	public static const int SS_NOTIFY = 0x100;
	public static const int SS_OWNERDRAW = 0xd;
	public static const int SS_REALSIZEIMAGE = 0x800;
	public static const int SS_RIGHT = 0x2;
	public static const int SSA_FALLBACK = 0x00000020;
	public static const int SSA_GLYPHS = 0x00000080;
	public static const int SSA_METAFILE = 0x00000800;
	public static const int SSA_LINK = 0x00001000;
	public static const int STANDARD_RIGHTS_READ = 0x20000;
	public static const int STARTF_USESHOWWINDOW = 0x1;
	public static const int STATE_SYSTEM_INVISIBLE = 0x00008000;
	public static const int STATE_SYSTEM_OFFSCREEN = 0x00010000;
	public static const int STATE_SYSTEM_UNAVAILABLE = 0x00000001;
	public static const int STD_COPY = 0x1;
	public static const int STD_CUT = 0x0;
	public static const int STD_FILENEW = 0x6;
	public static const int STD_FILEOPEN = 0x7;
	public static const int STD_FILESAVE = 0x8;
	public static const int STD_PASTE = 0x2;
	public static const int STM_GETIMAGE = 0x173;
	public static const int STM_SETIMAGE = 0x172;
	public static const int SWP_ASYNCWINDOWPOS = 0x4000;
	public static const int SWP_DRAWFRAME = 0x20;
	public static const int SWP_NOACTIVATE = 0x10;
	public static const int SWP_NOCOPYBITS = 0x100;
	public static const int SWP_NOMOVE = 0x2;
	public static const int SWP_NOREDRAW = 0x8;
	public static const int SWP_NOSIZE = 0x1;
	public static const int SWP_NOZORDER = 0x4;
	public static const int SW_ERASE = 0x4;
	public static const int SW_HIDE = 0x0;
	public static const int SW_INVALIDATE = 0x2;
	public static const int SW_MINIMIZE = 0x6;
	public static const int SW_PARENTOPENING = 0x3;
	public static const int SW_RESTORE = IsWinCE ? 0xd : 0x9;
	public static const int SW_SCROLLCHILDREN = 0x1;
	public static const int SW_SHOW = 0x5;
	public static const int SW_SHOWMAXIMIZED = IsWinCE ? 0xb : 0x3;
	public static const int SW_SHOWMINIMIZED = 0x2;
	public static const int SW_SHOWMINNOACTIVE = 0x7;
	public static const int SW_SHOWNA = 0x8;
	public static const int SW_SHOWNOACTIVATE = 0x4;
	public static const int SYNCHRONIZE = 0x100000;
	public static const int SYSRGN = 0x4;
	public static const int SYSTEM_FONT = 0xd;
	public static const int S_OK = 0x0;
	public static const int TABP_TABITEM = 1;
	public static const int TABP_TABITEMLEFTEDGE = 2;
	public static const int TABP_TABITEMRIGHTEDGE = 3;
	public static const int TABP_TABITEMBOTHEDGE = 4;
	public static const int TABP_TOPTABITEM = 5;
	public static const int TABP_TOPTABITEMLEFTEDGE = 6;
	public static const int TABP_TOPTABITEMRIGHTEDGE = 7;
	public static const int TABP_TOPTABITEMBOTHEDGE = 8;
	public static const int TABP_PANE = 9;
	public static const int TABP_BODY = 10;
	public static const int TBIF_COMMAND = 0x20;
	public static const int TBIF_STATE = 0x4;
	public static const int TBIF_IMAGE = 0x1;
	public static const int TBIF_LPARAM = 0x10;
	public static const int TBIF_SIZE = 0x40;
	public static const int TBIF_STYLE = 0x8;
	public static const int TBIF_TEXT = 0x2;
	public static const int TB_GETEXTENDEDSTYLE = 0x400 + 85;
	public static const int TBM_GETLINESIZE = 0x418;
	public static const int TBM_GETPAGESIZE = 0x416;
	public static const int TBM_GETPOS = 0x400;
	public static const int TBM_GETRANGEMAX = 0x402;
	public static const int TBM_GETRANGEMIN = 0x401;
	public static const int TBM_GETTHUMBRECT = 0x419;
	public static const int TBM_SETLINESIZE = 0x417;
	public static const int TBM_SETPAGESIZE = 0x415;
	public static const int TBM_SETPOS = 0x405;
	public static const int TBM_SETRANGEMAX = 0x408;
	public static const int TBM_SETRANGEMIN = 0x407;
	public static const int TBM_SETTICFREQ = 0x414;
	public static const int TBN_DROPDOWN = 0xfffffd3a;
	public static const int TBN_FIRST = 0xfffffd44;
	public static const int TBN_HOTITEMCHANGE = 0xFFFFFD37;
	public static const int TBSTATE_CHECKED = 0x1;
	public static const int TBSTATE_PRESSED = 0x02;
	public static const int TBSTYLE_CUSTOMERASE = 0x2000;
	public static const int TBSTYLE_DROPDOWN = 0x8;
	public static const int TBSTATE_ENABLED = 0x4;
	public static const int TBSTYLE_AUTOSIZE = 0x10;
	public static const int TBSTYLE_EX_DOUBLEBUFFER = 0x80;
	public static const int TBSTYLE_EX_DRAWDDARROWS = 0x1;
	public static const int TBSTYLE_EX_HIDECLIPPEDBUTTONS = 0x10;
	public static const int TBSTYLE_EX_MIXEDBUTTONS = 0x8;
	public static const int TBSTYLE_FLAT = 0x800;
	public static const int TBSTYLE_LIST = 0x1000;
	public static const int TBSTYLE_TOOLTIPS = 0x100;
	public static const int TBSTYLE_TRANSPARENT = 0x8000;
	public static const int TBSTYLE_WRAPABLE = 0x200;
	public static const int TBS_AUTOTICKS = 0x1;
	public static const int TBS_BOTH = 0x8;
	public static const int TBS_DOWNISLEFT = 0x0400;
	public static const int TBS_HORZ = 0x0;
	public static const int TBS_VERT = 0x2;
	public static const int TB_ADDSTRING = IsUnicode ? 0x44d : 0x41c;
	public static const int TB_AUTOSIZE = 0x421;
	public static const int TB_BUTTONCOUNT = 0x418;
	public static const int TB_BUTTONSTRUCTSIZE = 0x41e;
	public static const int TB_COMMANDTOINDEX = 0x419;
	public static const int TB_DELETEBUTTON = 0x416;
	public static const int TB_ENDTRACK = 0x8;
	public static const int TB_GETBUTTON = 0x417;
	public static const int TB_GETBUTTONINFO = IsUnicode ? 0x43f : 0x441;
	public static const int TB_GETBUTTONSIZE = 0x43a;
	public static const int TB_GETBUTTONTEXT = IsUnicode ? 0x44b : 0x42d;
	public static const int TB_GETDISABLEDIMAGELIST = 0x437;
	public static const int TB_GETHOTIMAGELIST = 0x435;
	public static const int TB_GETHOTITEM = 0x0400 + 71;
	public static const int TB_GETIMAGELIST = 0x431;
	public static const int TB_GETITEMRECT = 0x41d;
	public static const int TB_GETPADDING = 0x0400 + 86;
	public static const int TB_GETROWS = 0x428;
	public static const int TB_GETSTATE = 0x412;
	public static const int TB_GETTOOLTIPS = 0x423;
	public static const int TB_INSERTBUTTON = IsUnicode ? 0x443 : 0x415;
	public static const int TB_LOADIMAGES = 0x432;
	public static const int TB_MAPACCELERATOR = 0x0400 + (IsUnicode ? 90 : 78);
	public static const int TB_SETBITMAPSIZE = 0x420;
	public static const int TB_SETBUTTONINFO = IsUnicode ? 0x440 : 0x442;
	public static const int TB_SETBUTTONSIZE = 0x41f;
	public static const int TB_SETDISABLEDIMAGELIST = 0x436;
	public static const int TB_SETEXTENDEDSTYLE = 0x454;
	public static const int TB_SETHOTIMAGELIST = 0x434;
	public static const int TB_SETHOTITEM = 0x0400 + 72;
	public static const int TB_SETIMAGELIST = 0x430;
	public static const int TB_SETPARENT = 0x400 + 37;
	public static const int TB_SETROWS = 0x427;
	public static const int TB_SETSTATE = 0x411;
	public static const int TB_THUMBPOSITION = 0x4;
	public static const int TCIF_IMAGE = 0x2;
	public static const int TCIF_TEXT = 0x1;
	public static const int TCI_SRCCHARSET = 0x1;
	public static const int TCI_SRCCODEPAGE = 0x2;
	public static const int TCM_ADJUSTRECT = 0x1328;
	public static const int TCM_DELETEITEM = 0x1308;
	public static const int TCM_GETCURSEL = 0x130b;
	public static const int TCM_GETITEMCOUNT = 0x1304;
	public static const int TCM_GETITEMRECT = 0x130a;
	public static const int TCM_GETTOOLTIPS = 0x132d;
	public static const int TCM_HITTEST = 0x130d;
	public static const int TCM_INSERTITEM = IsUnicode ? 0x133e : 0x1307;
	public static const int TCM_SETCURSEL = 0x130c;
	public static const int TCM_SETIMAGELIST = 0x1303;
	public static const int TCM_SETITEM = IsUnicode ? 0x133d : 0x1306;
	public static const int TCN_SELCHANGE = 0xfffffdd9;
	public static const int TCN_SELCHANGING = 0xfffffdd8;
	public static const int TCS_BOTTOM = 0x0002;
	public static const int TCS_FOCUSNEVER = 0x8000;
	public static const int TCS_MULTILINE = 0x200;
	public static const int TCS_TABS = 0x0;
	public static const int TCS_TOOLTIPS = 0x4000;
	public static const int TECHNOLOGY = 0x2;
	public static const int TF_ATTR_INPUT = 0;
	public static const int TF_ATTR_TARGET_CONVERTED = 1;
	public static const int TF_ATTR_CONVERTED = 2;
	public static const int TF_ATTR_TARGET_NOTCONVERTED = 3;
	public static const int TF_ATTR_INPUT_ERROR = 4;
	public static const int TF_ATTR_FIXEDCONVERTED = 5;
	public static const int TF_ATTR_OTHER = -1;
	public alias TF_CT_NONE = TF_DA_COLORTYPE.TF_CT_NONE;
	public alias TF_CT_SYSCOLOR = TF_DA_COLORTYPE.TF_CT_SYSCOLOR;
	public alias TF_CT_COLORREF = TF_DA_COLORTYPE.TF_CT_COLORREF;
	public alias TF_LS_NONE = TF_DA_LINESTYLE.TF_LS_NONE;
	public alias TF_LS_SOLID = TF_DA_LINESTYLE.TF_LS_SOLID;
	public alias TF_LS_DOT = TF_DA_LINESTYLE.TF_LS_DOT;
	public alias TF_LS_DASH = TF_DA_LINESTYLE.TF_LS_DASH;
	public alias TF_LS_SQUIGGLE = TF_DA_LINESTYLE.TF_LS_SQUIGGLE;
	public static const int TIME_NOSECONDS = 0x2;
	public static const int TIS_NORMAL = 1;
	public static const int TIS_HOT = 2;
	public static const int TIS_SELECTED = 3;
	public static const int TIS_DISABLED = 4;
	public static const int TIS_FOCUSED = 5;
	public static const int TKP_TRACK = 1;
	public static const int TKP_TRACKVERT = 2;
	public static const int TKP_THUMB = 3;
	public static const int TKP_THUMBBOTTOM = 4;
	public static const int TKP_THUMBTOP = 5;
	public static const int TKP_THUMBVERT = 6;
	public static const int TKP_THUMBLEFT = 7;
	public static const int TKP_THUMBRIGHT = 8;
	public static const int TKP_TICS = 9;
	public static const int TKP_TICSVERT = 10;
	public static const int TME_HOVER = 0x1;
	public static const int TME_LEAVE = 0x2;
	public static const int TME_QUERY = 0x40000000;
	public static const int TMPF_VECTOR = 0x2;
	public static const int TMT_CONTENTMARGINS = 3602;
	public static const TCHAR[] TOOLBARCLASSNAME = "ToolbarWindow32\0"; //$NON-NLS-1$
	public static const TCHAR[] TOOLTIPS_CLASS = "tooltips_class32\0"; //$NON-NLS-1$
	public static const int TP_BUTTON = 1;
	public static const int TP_DROPDOWNBUTTON = 2;
	public static const int TP_SPLITBUTTON = 3;
	public static const int TP_SPLITBUTTONDROPDOWN = 4;
	public static const int TP_SEPARATOR = 5;
	public static const int TP_SEPARATORVERT = 6;
	public static const int TPM_LEFTALIGN = 0x0;
	public static const int TPM_LEFTBUTTON = 0x0;
	public static const int TPM_RIGHTBUTTON = 0x2;
	public static const int TPM_RIGHTALIGN = 0x8;
	public static const TCHAR[] TRACKBAR_CLASS = "msctls_trackbar32\0"; //$NON-NLS-1$
	public static const int TRANSPARENT = 0x1;
	public static const int TREIS_DISABLED = 4;
	public static const int TREIS_HOT = 2;
	public static const int TREIS_NORMAL = 1;
	public static const int TREIS_SELECTED = 3;
	public static const int TREIS_SELECTEDNOTFOCUS = 5;
	public static const int TS_MIN = 0;
	public static const int TS_TRUE = 1;
	public static const int TS_DRAW = 2;
	public static const int TS_NORMAL = 1;
	public static const int TS_HOT = 2;
	public static const int TS_PRESSED = 3;
	public static const int TS_DISABLED = 4;
	public static const int TS_CHECKED = 5;
	public static const int TS_HOTCHECKED = 6;
	public static const int TTDT_AUTOMATIC = 0;
	public static const int TTDT_RESHOW = 1;
	public static const int TTDT_AUTOPOP = 2;
	public static const int TTDT_INITIAL = 3;
	public static const int TTF_ABSOLUTE = 0x80;
	public static const int TTF_IDISHWND = 0x1;
	public static const int TTF_SUBCLASS = 0x10;
	public static const int TTF_RTLREADING = 0x4;
	public static const int TTF_TRACK = 0x20;
	public static const int TTF_TRANSPARENT = 0x100;
	public static const int TTI_NONE = 0;
	public static const int TTI_INFO = 1;
	public static const int TTI_WARNING = 2;
	public static const int TTI_ERROR = 3;
	public static const int TTM_ACTIVATE = 0x400 + 1;
	public static const int TTM_ADDTOOL = IsUnicode ? 0x432 : 0x404;
	public static const int TTM_ADJUSTRECT = 0x400 + 31;
	public static const int TTM_GETCURRENTTOOLA = 0x400 + 15;
	public static const int TTM_GETCURRENTTOOLW = 0x400 + 59;
	public static const int TTM_GETCURRENTTOOL = 0x400 + (IsUnicode ? 59 : 15);
	public static const int TTM_GETDELAYTIME = 0x400 + 21;
	public static const int TTM_DELTOOL = IsUnicode ? 0x433 : 0x405;
	public static const int TTM_GETTOOLINFO = 0x400 + (IsUnicode ? 53 : 8);
	public static const int TTM_NEWTOOLRECT = 0x400 + (IsUnicode ? 52 : 6);
	public static const int TTM_POP = 0x400 + 28;
	public static const int TTM_SETDELAYTIME = 0x400 + 3;
	public static const int TTM_SETMAXTIPWIDTH = 0x418;
	public static const int TTM_SETTITLEA = 0x400 + 32;
	public static const int TTM_SETTITLEW = 0x400 + 33;
	public static const int TTM_SETTITLE = 0x400 + (IsUnicode ? 33 : 32);
	public static const int TTM_TRACKPOSITION = 1042;
	public static const int TTM_TRACKACTIVATE = 1041;
	public static const int TTM_UPDATE = 0x41D;
	public static const int TTN_FIRST = 0xfffffdf8;
	public static const int TTN_GETDISPINFO = IsUnicode ? 0xfffffdee : 0xfffffdf8;
	public static const int TTN_GETDISPINFOW = 0xfffffdee;
	public static const int TTN_GETDISPINFOA = 0xfffffdf8;
	public static const int TTN_POP = TTN_FIRST - 2;
	public static const int TTN_SHOW = TTN_FIRST - 1;
	public static const int TTS_ALWAYSTIP = 0x1;
	public static const int TTS_BALLOON = 0x40;
	public static const int TTS_NOANIMATE = 0x10;
	public static const int TTS_NOFADE = 0x20;
	public static const int TTS_NOPREFIX = 0x02;
	public static const int TV_FIRST = 0x1100;
	public static const int TVE_COLLAPSE = 0x1;
	public static const int TVE_COLLAPSERESET = 0x8000;
	public static const int TVE_EXPAND = 0x2;
	public static const int TVGN_CARET = 0x9;
	public static const int TVGN_CHILD = 0x4;
	public static const int TVGN_DROPHILITED = 0x8;
	public static const int TVGN_FIRSTVISIBLE = 0x5;
	public static const int TVGN_LASTVISIBLE = 0xa;
	public static const int TVGN_NEXT = 0x1;
	public static const int TVGN_NEXTVISIBLE = 0x6;
	public static const int TVGN_PARENT = 0x3;
	public static const int TVGN_PREVIOUS = 0x2;
	public static const int TVGN_PREVIOUSVISIBLE = 0x7;
	public static const int TVGN_ROOT = 0x0;
	public static const int TVHT_ONITEM = 0x46;
	public static const int TVHT_ONITEMBUTTON = 16;
	public static const int TVHT_ONITEMICON = 0x2;
	public static const int TVHT_ONITEMINDENT = 0x8;
	public static const int TVHT_ONITEMRIGHT = 0x20;
	public static const int TVHT_ONITEMLABEL = 0x4;
	public static const int TVHT_ONITEMSTATEICON = 0x40;
	public static const int TVIF_HANDLE = 0x10;
	public static const int TVIF_IMAGE = 0x2;
	public static const int TVIF_INTEGRAL = 0x0080;
	public static const int TVIF_PARAM = 0x4;
	public static const int TVIF_SELECTEDIMAGE = 0x20;
	public static const int TVIF_STATE = 0x8;
	public static const int TVIF_TEXT = 0x1;
	public static const int TVIS_DROPHILITED = 0x8;
	public static const int TVIS_EXPANDED = 0x20;
	public static const int TVIS_SELECTED = 0x2;
	public static const int TVIS_STATEIMAGEMASK = 0xf000;
	public static const ULONG_PTR TVI_FIRST = cast(ULONG_PTR)-0x0FFFF;
	public static const ULONG_PTR TVI_LAST = cast(ULONG_PTR)-0x0FFFE;
	public static const ULONG_PTR TVI_ROOT = cast(ULONG_PTR)-0x10000;
	public static const ULONG_PTR TVI_SORT = cast(ULONG_PTR)-0x0FFFD;
	public static const int TVM_CREATEDRAGIMAGE = TV_FIRST + 18;
	public static const int TVM_DELETEITEM = 0x1101;
	public static const int TVM_ENSUREVISIBLE = 0x1114;
	public static const int TVM_EXPAND = 0x1102;
	public static const int TVM_GETBKCOLOR = 0x111f;
	public static const int TVM_GETCOUNT = 0x1105;
	public static const int TVM_GETEXTENDEDSTYLE = TV_FIRST + 45;
	public static const int TVM_GETIMAGELIST = 0x1108;
	public static const int TVM_GETITEM = IsUnicode ? 0x113e : 0x110c;
	public static const int TVM_GETITEMHEIGHT = 0x111c;
	public static const int TVM_GETITEMRECT = 0x1104;
	public static const int TVM_GETITEMSTATE = TV_FIRST + 39;
	public static const int TVM_GETNEXTITEM = 0x110a;
	public static const int TVM_GETTEXTCOLOR = 0x1120;
	public static const int TVM_GETTOOLTIPS = TV_FIRST + 25;
	public static const int TVM_GETVISIBLECOUNT = TV_FIRST + 16;
	public static const int TVM_HITTEST = 0x1111;
	public static const int TVM_INSERTITEM = IsUnicode ? 0x1132 : 0x1100;
	public static const int TVM_MAPACCIDTOHTREEITEM = TV_FIRST + 42;
	public static const int TVM_MAPHTREEITEMTOACCID = TV_FIRST + 43;
	public static const int TVM_SELECTITEM = 0x110b;
	public static const int TVM_SETBKCOLOR = 0x111d;
	public static const int TVM_SETEXTENDEDSTYLE = TV_FIRST + 44;
	public static const int TVM_SETIMAGELIST = 0x1109;
	public static const int TVM_SETINSERTMARK = 0x111a;
	public static const int TVM_SETITEM = IsUnicode ? 0x113f : 0x110d;
	public static const int TVM_SETITEMHEIGHT = TV_FIRST + 27;
	public static const int TVM_SETSCROLLTIME = TV_FIRST + 33;
	public static const int TVM_SETTEXTCOLOR = 0x111e;
	public static const int TVM_SORTCHILDREN = TV_FIRST + 19;
	public static const int TVM_SORTCHILDRENCB = TV_FIRST + 21;
	public static const int TVN_BEGINDRAGW = 0xfffffe38;
	public static const int TVN_BEGINDRAGA = 0xfffffe69;
	public static const int TVN_BEGINRDRAGW = 0xfffffe37;
	public static const int TVN_BEGINRDRAGA = 0xfffffe68;
	public static const int TVN_FIRST = 0xfffffe70;
	public static const int TVN_GETDISPINFOA = TVN_FIRST - 3;
	public static const int TVN_GETDISPINFOW = TVN_FIRST - 52;
	public static const int TVN_ITEMCHANGINGW = TVN_FIRST - 17;
	public static const int TVN_ITEMCHANGINGA = TVN_FIRST - 16;
	public static const int TVN_ITEMEXPANDEDA = TVN_FIRST - 6;
	public static const int TVN_ITEMEXPANDEDW = TVN_FIRST - 55;
	public static const int TVN_ITEMEXPANDINGW = 0xfffffe3a;
	public static const int TVN_ITEMEXPANDINGA = 0xfffffe6b;
	public static const int TVN_SELCHANGEDW = 0xfffffe3d;
	public static const int TVN_SELCHANGEDA = 0xfffffe6e;
	public static const int TVN_SELCHANGINGW = 0xfffffe3e;
	public static const int TVN_SELCHANGINGA = 0xfffffe6f;
	public static const int TVP_GLYPH = 2;
	public static const int TVP_TREEITEM = 1;
	public static const int TVSIL_NORMAL = 0x0;
	public static const int TVSIL_STATE = 0x2;
	public static const int TVS_DISABLEDRAGDROP = 0x10;
	public static const int TVS_EX_AUTOHSCROLL = 0x0020;
	public static const int TVS_EX_DOUBLEBUFFER = 0x0004;
	public static const int TVS_EX_DIMMEDCHECKBOXES = 0x0200;
	public static const int TVS_EX_DRAWIMAGEASYNC = 0x0400;
	public static const int TVS_EX_EXCLUSIONCHECKBOXES = 0x0100;
	public static const int TVS_EX_FADEINOUTEXPANDOS = 0x0040;
	public static const int TVS_EX_MULTISELECT = 0x0002;
	public static const int TVS_EX_NOINDENTSTATE = 0x0008;
	public static const int TVS_EX_PARTIALCHECKBOXES = 0x0080;
	public static const int TVS_EX_RICHTOOLTIP = 0x0010;
	public static const int TVS_FULLROWSELECT = 0x1000;
	public static const int TVS_HASBUTTONS = 0x1;
	public static const int TVS_HASLINES = 0x2;
	public static const int TVS_LINESATROOT = 0x4;
	public static const int TVS_NOHSCROLL = 0x8000;
	public static const int TVS_NONEVENHEIGHT = 0x4000;
	public static const int TVS_NOSCROLL = 0x2000;
	public static const int TVS_NOTOOLTIPS = 0x80;
	public static const int TVS_SHOWSELALWAYS = 0x20;
	public static const int TVS_TRACKSELECT = 0x200;
	public static const int UDM_GETACCEL = 0x046C;
	public static const int UDM_GETRANGE32 = 0x0470;
	public static const int UDM_GETPOS = 0x468;
	public static const int UDM_GETPOS32 = 0x0472;
	public static const int UDM_SETACCEL = 0x046B;
	public static const int UDM_SETRANGE32 = 0x046f;
	public static const int UDM_SETPOS = 0x467;
	public static const int UDM_SETPOS32 = 0x0471;
	public static const int UDN_DELTAPOS = -722;
	public static const int UDS_ALIGNLEFT = 0x008;
	public static const int UDS_ALIGNRIGHT = 0x004;
	public static const int UDS_AUTOBUDDY = 0x0010;
	public static const int UDS_WRAP = 0x0001;
	public static const int UIS_CLEAR = 2;
	public static const int UIS_INITIALIZE = 3;
	public static const int UIS_SET = 1;
	public static const int UISF_HIDEACCEL = 0x2;
	public static const int UISF_HIDEFOCUS = 0x1;
	public static const TCHAR[] UPDOWN_CLASS = "msctls_updown32\0"; //$NON-NLS-1$
	public static const int USP_E_SCRIPT_NOT_IN_FONT = 0x80040200;
	public static const int VERTRES = 0xa;
	public static const int VK_BACK = 0x8;
	public static const int VK_CANCEL = 0x3;
	public static const int VK_CAPITAL = 0x14;
	public static const int VK_CONTROL = 0x11;
	public static const int VK_DECIMAL = 0x6E;
	public static const int VK_DELETE = 0x2e;
	public static const int VK_DIVIDE = 0x6f;
	public static const int VK_DOWN = 0x28;
	public static const int VK_END = 0x23;
	public static const int VK_ESCAPE = 0x1b;
	public static const int VK_F1 = 0x70;
	public static const int VK_F10 = 0x79;
	public static const int VK_F11 = 0x7a;
	public static const int VK_F12 = 0x7b;
	public static const int VK_F13 = 0x7c;
	public static const int VK_F14 = 0x7d;
	public static const int VK_F15 = 0x7e;
	public static const int VK_F2 = 0x71;
	public static const int VK_F3 = 0x72;
	public static const int VK_F4 = 0x73;
	public static const int VK_F5 = 0x74;
	public static const int VK_F6 = 0x75;
	public static const int VK_F7 = 0x76;
	public static const int VK_F8 = 0x77;
	public static const int VK_F9 = 0x78;
	public static const int VK_HOME = 0x24;
	public static const int VK_INSERT = 0x2d;
	public static const int VK_LBUTTON = 0x1;
	public static const int VK_LEFT = 0x25;
	public static const int VK_MBUTTON = 0x4;
	public static const int VK_MENU = 0x12;
	public static const int VK_MULTIPLY = 0x6A;
	public static const int VK_N = 0x4e;
	public static const int VK_NEXT = 0x22;
	public static const int VK_NUMLOCK = 0x90;
	public static const int VK_NUMPAD0 = 0x60;
	public static const int VK_NUMPAD1 = 0x61;
	public static const int VK_NUMPAD2 = 0x62;
	public static const int VK_NUMPAD3 = 0x63;
	public static const int VK_NUMPAD4 = 0x64;
	public static const int VK_NUMPAD5 = 0x65;
	public static const int VK_NUMPAD6 = 0x66;
	public static const int VK_NUMPAD7 = 0x67;
	public static const int VK_NUMPAD8 = 0x68;
	public static const int VK_NUMPAD9 = 0x69;
	public static const int VK_PAUSE = 0x13;
	public static const int VK_PRIOR = 0x21;
	public static const int VK_RBUTTON = 0x2;
	public static const int VK_RETURN = 0xd;
	public static const int VK_RIGHT = 0x27;
	public static const int VK_SCROLL = 0x91;
	public static const int VK_SEPARATOR = 0x6C;
	public static const int VK_SHIFT = 0x10;
	public static const int VK_SNAPSHOT = 0x2C;
	public static const int VK_SPACE = 0x20;
	public static const int VK_SUBTRACT = 0x6D;
	public static const int VK_TAB = 0x9;
	public static const int VK_UP = 0x26;
	public static const int VK_XBUTTON1 = 0x05;
	public static const int VK_XBUTTON2 = 0x06;
	public static const int VK_ADD = 0x6B;
	public static const int VK_APP1 = 0xc1;
	public static const int VK_APP2 = 0xc2;
	public static const int VK_APP3 = 0xc3;
	public static const int VK_APP4 = 0xc4;
	public static const int VK_APP5 = 0xc5;
	public static const int VK_APP6 = 0xc6;
	public static const TCHAR[] WC_HEADER = "SysHeader32\0"; //$NON-NLS-1$
	public static const TCHAR[] WC_LINK = "SysLink\0"; //$NON-NLS-1$
	public static const TCHAR[] WC_LISTVIEW = "SysListView32\0"; //$NON-NLS-1$
	public static const TCHAR[] WC_TABCONTROL = "SysTabControl32\0"; //$NON-NLS-1$
	public static const TCHAR[] WC_TREEVIEW = "SysTreeView32\0"; //$NON-NLS-1$
	public static const int WINDING = 2;
	public static const int WH_CBT = 5;
	public static const int WH_GETMESSAGE = 0x3;
	public static const int WH_MSGFILTER = 0xFFFFFFFF;
	public static const int WH_FOREGROUNDIDLE = 11;
	public static const int WHEEL_DELTA = 120;
	public static const int WHEEL_PAGESCROLL = 0xFFFFFFFF;
	public static const int WHITE_BRUSH = 0;
	public static const int WM_ACTIVATE = 0x6;
	public static const int WM_ACTIVATEAPP = 0x1c;
	public static const int WM_APP = 0x8000;
	public static const int WM_DWMCOLORIZATIONCOLORCHANGED = 0x320;
	public static const int WM_CANCELMODE = 0x1f;
	public static const int WM_CAPTURECHANGED = 0x0215;
	public static const int WM_CHANGEUISTATE = 0x0127;
	public static const int WM_CHAR = 0x102;
	public static const int WM_CLEAR = 0x303;
	public static const int WM_CLOSE = 0x10;
	public static const int WM_COMMAND = 0x111;
	public static const int WM_CONTEXTMENU = 0x7b;
	public static const int WM_COPY = 0x301;
	public static const int WM_CREATE = 0x0001;
	public static const int WM_CTLCOLORBTN = 0x135;
	public static const int WM_CTLCOLORDLG = 0x136;
	public static const int WM_CTLCOLOREDIT = 0x133;
	public static const int WM_CTLCOLORLISTBOX = 0x134;
	public static const int WM_CTLCOLORMSGBOX = 0x132;
	public static const int WM_CTLCOLORSCROLLBAR = 0x137;
	public static const int WM_CTLCOLORSTATIC = 0x138;
	public static const int WM_CUT = 0x300;
	public static const int WM_DEADCHAR = 0x103;
	public static const int WM_DESTROY = 0x2;
	public static const int WM_DRAWITEM = 0x2b;
	public static const int WM_ENDSESSION = 0x16;
	public static const int WM_ENTERIDLE = 0x121;
	public static const int WM_ERASEBKGND = 0x14;
	public static const int WM_GETDLGCODE = 0x87;
	public static const int WM_GETFONT = 0x31;
	//  public static const int WM_GETICON = 0x7f;
	public static const int WM_GETOBJECT = 0x003D;
	public static const int WM_GETMINMAXINFO = 0x0024;
	public static const int WM_HELP = 0x53;
	public static const int WM_HOTKEY = 0x0312;
	public static const int WM_HSCROLL = 0x114;
	public static const int WM_IME_CHAR = 0x286;
	public static const int WM_IME_COMPOSITION = 0x10f;
	public static const int WM_IME_COMPOSITION_START = 0x010D;
	public static const int WM_IME_ENDCOMPOSITION = 0x010E;
	public static const int WM_INITDIALOG = 0x110;
	public static const int WM_INITMENUPOPUP = 0x117;
	public static const int WM_INPUTLANGCHANGE = 0x51;
	public static const int WM_KEYDOWN = 0x100;
	public static const int WM_KEYFIRST = 0x100;
	public static const int WM_KEYLAST = 0x108;
	public static const int WM_KEYUP = 0x101;
	public static const int WM_KILLFOCUS = 0x8;
	public static const int WM_LBUTTONDBLCLK = 0x203;
	public static const int WM_LBUTTONDOWN = 0x201;
	public static const int WM_LBUTTONUP = 0x202;
	public static const int WM_MBUTTONDBLCLK = 0x209;
	public static const int WM_MBUTTONDOWN = 0x207;
	public static const int WM_MBUTTONUP = 0x208;
	public static const int WM_MEASUREITEM = 0x2c;
	public static const int WM_MENUCHAR = 0x120;
	public static const int WM_MENUSELECT = 0x11f;
	public static const int WM_MOUSEACTIVATE = 0x21;
	public static const int WM_MOUSEFIRST = 0x200;
	public static const int WM_MOUSEHOVER = 0x2a1;
	public static const int WM_MOUSELEAVE = 0x2a3;
	public static const int WM_MOUSEMOVE = 0x200;
	public static const int WM_MOUSEWHEEL = 0x20a;
	public static const int WM_MOUSELAST = 0x20d;
	public static const int WM_MOVE = 0x3;
	public static const int WM_NCACTIVATE = 0x86;
	public static const int WM_NCCALCSIZE = 0x83;
	public static const int WM_NCHITTEST = 0x84;
	public static const int WM_NCLBUTTONDOWN = 0x00A1;
	public static const int WM_NCPAINT = 0x85;
	public static const int WM_NOTIFY = 0x4e;
	public static const int WM_NULL = 0x0;
	public static const int WM_PAINT = 0xf;
	public static const int WM_PALETTECHANGED = 0x311;
	public static const int WM_PARENTNOTIFY = 0x0210;
	public static const int WM_PASTE = 0x302;
	public static const int WM_PRINT = 0x0317;
	public static const int WM_PRINTCLIENT = 0x0318;
	public static const int WM_QUERYENDSESSION = 0x11;
	public static const int WM_QUERYNEWPALETTE = 0x30f;
	public static const int WM_QUERYOPEN = 0x13;
	public static const int WM_QUERYUISTATE = 0x129;
	public static const int WM_RBUTTONDBLCLK = 0x206;
	public static const int WM_RBUTTONDOWN = 0x204;
	public static const int WM_RBUTTONUP = 0x205;
	public static const int WM_SETCURSOR = 0x20;
	public static const int WM_SETFOCUS = 0x7;
	public static const int WM_SETFONT = 0x30;
	public static const int WM_SETICON = 0x80;
	public static const int WM_SETREDRAW = 0xb;
	public static const int WM_SETTEXT = 12;
	public static const int WM_SETTINGCHANGE = 0x1A;
	public static const int WM_SHOWWINDOW = 0x18;
	public static const int WM_SIZE = 0x5;
	public static const int WM_SYSCHAR = 0x106;
	public static const int WM_SYSCOLORCHANGE = 0x15;
	public static const int WM_SYSCOMMAND = 0x112;
	public static const int WM_SYSKEYDOWN = 0x104;
	public static const int WM_SYSKEYUP = 0x105;
	public static const int WM_TIMER = 0x113;
	public static const int WM_THEMECHANGED = 0x031a;
	public static const int WM_UNDO = 0x304;
	public static const int WM_UPDATEUISTATE = 0x0128;
	public static const int WM_USER = 0x400;
	public static const int WM_VSCROLL = 0x115;
	public static const int WM_WINDOWPOSCHANGED = 0x47;
	public static const int WM_WINDOWPOSCHANGING = 0x46;
	public static const int WS_BORDER = 0x800000;
	public static const int WS_CAPTION = 0xc00000;
	public static const int WS_CHILD = 0x40000000;
	public static const int WS_MINIMIZE = 0x20000000; //PORTING_TODO: from org.eclipse.swt, why?
	public static const int WS_CLIPCHILDREN = 0x2000000;
	public static const int WS_CLIPSIBLINGS = 0x4000000;
	public static const int WS_DISABLED = 0x4000000;
	public static const int WS_EX_APPWINDOW = 0x40000;
	public static const int WS_EX_CAPTIONOKBTN = 0x80000000;
	public static const int WS_EX_CLIENTEDGE = 0x200;
	public static const int WS_EX_COMPOSITED = 0x2000000;
	public static const int WS_EX_DLGMODALFRAME = 0x1;
	public static const int WS_EX_LAYERED = 0x00080000;
	public static const int WS_EX_LAYOUTRTL = 0x00400000;
	public static const int WS_EX_LEFTSCROLLBAR = 0x00004000;
	public static const int WS_EX_MDICHILD = 0x00000040;
	public static const int WS_EX_NOINHERITLAYOUT = 0x00100000;
	public static const int WS_EX_NOACTIVATE = 0x08000000;
	public static const int WS_EX_RIGHT = 0x00001000;
	public static const int WS_EX_RTLREADING = 0x00002000;
	public static const int WS_EX_STATICEDGE = 0x20000;
	public static const int WS_EX_TOOLWINDOW = 0x80;
	public static const int WS_EX_TOPMOST = 0x8;
	public static const int WS_EX_TRANSPARENT = 0x20;
	public static const int WS_HSCROLL = 0x100000;
	public static const int WS_MAXIMIZEBOX = IsWinCE ? 0x20000 : 0x10000;
	public static const int WS_MINIMIZEBOX = IsWinCE ? 0x10000 : 0x20000;
	public static const int WS_OVERLAPPED = IsWinCE ? WS_BORDER | WS_CAPTION : 0x0;
	public static const int WS_OVERLAPPEDWINDOW = 0xcf0000;
	public static const int WS_POPUP = 0x80000000;
	public static const int WS_SYSMENU = 0x80000;
	public static const int WS_TABSTOP = 0x10000;
	public static const int WS_THICKFRAME = 0x40000;
	public static const int WS_VISIBLE = 0x10000000;
	public static const int WS_VSCROLL = 0x200000;
	public static const int WM_XBUTTONDOWN = 0x020B;
	public static const int WM_XBUTTONUP = 0x020C;
	public static const int WM_XBUTTONDBLCLK = 0x020D;
	public static const int XBUTTON1 = 0x1;
	public static const int XBUTTON2 = 0x2;

	/** Ansi/Unicode wrappers */
	// Unicode/Ansi alias
	version (ANSI) {
		alias AddFontResourceEx = DWTWINAPI.AddFontResourceExA;
		alias AssocQueryString = DWTWINAPI.AssocQueryStringA;
		alias CallWindowProc = DWTWINAPI.CallWindowProcA;
		alias CharLower = DWTWINAPI.CharLowerA;
		alias CharUpper = DWTWINAPI.CharUpperA;
		alias ChooseColor = DWTWINAPI.ChooseColorA;
		alias ChooseFont = DWTWINAPI.ChooseFontA;
		alias CreateAcceleratorTable = DWTWINAPI.CreateAcceleratorTableA;
		alias CreateDC = DWTWINAPI.CreateDCA;
		alias CreateEnhMetaFile = DWTWINAPI.CreateEnhMetaFileA;
		alias CreateEvent = DWTWINAPI.CreateEventA;
		alias CreateFile = DWTWINAPI.CreateFileA;
		alias CreateFontIndirect = DWTWINAPI.CreateFontIndirectA;
		alias CreateWindowEx = DWTWINAPI.CreateWindowExA;
		alias DefFrameProc = DWTWINAPI.DefFrameProcA;
		alias DefMDIChildProc = DWTWINAPI.DefMDIChildProcA;
		alias DefWindowProc = DWTWINAPI.DefWindowProcA;
		alias DeleteFile = DWTWINAPI.DeleteFileA;
		alias DispatchMessage = DWTWINAPI.DispatchMessageA;
		alias DragQueryFile = DWTWINAPI.DragQueryFileA;
		alias DrawState = DWTWINAPI.DrawStateA;
		alias DrawText = DWTWINAPI.DrawTextA;
		alias EnumFontFamiliesEx = DWTWINAPI.EnumFontFamiliesExA;
		alias EnumFontFamilies = DWTWINAPI.EnumFontFamiliesA;
		alias EnumSystemLanguageGroups = DWTWINAPI.EnumSystemLanguageGroupsA;
		alias EnumSystemLocales = EnumSystemLocalesA;
		alias ExpandEnvironmentStrings = DWTWINAPI.ExpandEnvironmentStringsA;
		alias ExtTextOut = DWTWINAPI.ExtTextOutA;
		alias ExtractIconEx = DWTWINAPI.ExtractIconExA;
		alias FindResource = DWTWINAPI.FindResourceA;
		alias FindWindow = DWTWINAPI.FindWindowA;
		alias FormatMessage = DWTWINAPI.FormatMessageA;
		alias GetCharABCWidths = DWTWINAPI.GetCharABCWidthsA;
		alias GetCharWidth = DWTWINAPI.GetCharWidthA;
		alias GetCharacterPlacement = DWTWINAPI.GetCharacterPlacementA;
		alias GetClassInfo = DWTWINAPI.GetClassInfoA;
		alias GetClassInfoEx = DWTWINAPI.GetClassInfoExA;
		alias GetClassName = DWTWINAPI.GetClassNameA;
		alias GetClipboardFormatName = DWTWINAPI.GetClipboardFormatNameA;
		alias GetDateFormat = DWTWINAPI.GetDateFormatA;
		alias GetTimeFormat = DWTWINAPI.GetTimeFormatA;
		alias GetKeyNameText = DWTWINAPI.GetKeyNameTextA;
		alias GetLocaleInfo = DWTWINAPI.GetLocaleInfoA;
		alias GetMenuItemInfo = DWTWINAPI.GetMenuItemInfoA;
		alias GetMessage = DWTWINAPI.GetMessageA;
		alias GetModuleFileName = DWTWINAPI.GetModuleFileNameA;
		alias GetModuleHandle = DWTWINAPI.GetModuleHandleA;
		alias GetMonitorInfo = DWTWINAPI.GetMonitorInfoA;
		alias GetObject = DWTWINAPI.GetObjectA;
		alias GetOpenFileName = DWTWINAPI.GetOpenFileNameA;
		alias GetOutlineTextMetrics = DWTWINAPI.GetOutlineTextMetricsA;
		alias _GetProfileString = DWTWINAPI.GetProfileStringA;
		alias GetProp = DWTWINAPI.GetPropA;
		alias GetSaveFileName = DWTWINAPI.GetSaveFileNameA;
		alias GetStartupInfo = DWTWINAPI.GetStartupInfoA;
		alias GetTextExtentPoint32 = DWTWINAPI.GetTextExtentPoint32A;
		alias GetTextMetrics = DWTWINAPI.GetTextMetricsA;
		alias GetVersionEx = DWTWINAPI.GetVersionExA;
		alias GetWindowLong = DWTWINAPI.GetWindowLongA;
		alias GetWindowLongPtr = DWTWINAPI.GetWindowLongPtrA;
		alias _GetWindowText = DWTWINAPI.GetWindowTextA;
		alias GetWindowTextLength = DWTWINAPI.GetWindowTextLengthA;
		alias GlobalAddAtom = DWTWINAPI.GlobalAddAtomA;
		//     alias DWTWINAPI.ImmGetCompositionFontA ImmGetCompositionFont;
		//     alias DWTWINAPI.ImmGetCompositionStringA ImmGetCompositionString;
		//     alias DWTWINAPI.ImmSetCompositionFontA ImmSetCompositionFont;
		alias InsertMenu = DWTWINAPI.InsertMenuA;
		alias InsertMenuItem = DWTWINAPI.InsertMenuItemA;
		alias LoadBitmap = DWTWINAPI.LoadBitmapA;
		alias LoadCursor = DWTWINAPI.LoadCursorA;
		alias LoadIcon = DWTWINAPI.LoadIconA;
		alias LoadImage = DWTWINAPI.LoadImageA;
		alias LoadLibrary = DWTWINAPI.LoadLibraryA;
		alias LoadString = DWTWINAPI.LoadStringA;
		alias MapVirtualKey = DWTWINAPI.MapVirtualKeyA;
		alias MessageBox = DWTWINAPI.MessageBoxA;
		alias OutputDebugString = DWTWINAPI.OutputDebugStringA;
		alias PeekMessage = DWTWINAPI.PeekMessageA;
		alias PostMessage = DWTWINAPI.PostMessageA;
		alias PostThreadMessage = DWTWINAPI.PostThreadMessageA;
		alias PrintDlg = DWTWINAPI.PrintDlgA;
		alias RegEnumKeyEx = DWTWINAPI.RegEnumKeyExA;
		alias RegOpenKeyEx = DWTWINAPI.RegOpenKeyExA;
		alias RegQueryInfoKey = DWTWINAPI.RegQueryInfoKeyA;
		alias RegQueryValueEx = DWTWINAPI.RegQueryValueExA;
		alias RegisterClass = DWTWINAPI.RegisterClassA;
		alias RegisterClipboardFormat = DWTWINAPI.RegisterClipboardFormatA;
		alias RegOpenKeyEx = DWTWINAPI.RegOpenKeyExA;
		alias RegisterWindowMessage = DWTWINAPI.RegisterWindowMessageA;
		alias RemoveProp = DWTWINAPI.RemovePropA;
		alias SHBrowseForFolder = DWTWINAPI.SHBrowseForFolderA;
		alias SHGetPathFromIDList = DWTWINAPI.SHGetPathFromIDListA;
		alias SendMessage = DWTWINAPI.SendMessageA;
		alias SetMenuItemInfo = DWTWINAPI.SetMenuItemInfoA;
		alias SetProp = DWTWINAPI.SetPropA;
		alias SetWindowLong = DWTWINAPI.SetWindowLongA;
		alias SetWindowLongPtr = DWTWINAPI.SetWindowLongPtrA;
		alias SetWindowText = DWTWINAPI.SetWindowTextA;
		alias SetWindowsHookEx = DWTWINAPI.SetWindowsHookExA;
		alias ShellExecuteEx = DWTWINAPI.ShellExecuteExA;
		alias Shell_NotifyIcon = DWTWINAPI.Shell_NotifyIconA;
		alias StartDoc = DWTWINAPI.StartDocA;
		alias SystemParametersInfo = DWTWINAPI.SystemParametersInfoA;
		alias TranslateAccelerator = DWTWINAPI.TranslateAcceleratorA;
		alias UnregisterClass = DWTWINAPI.UnregisterClassA;
		alias VkKeyScan = DWTWINAPI.VkKeyScanA;
	}
	else {
		alias AddFontResourceEx = DWTWINAPI.AddFontResourceExW;
		alias AssocQueryString = DWTWINAPI.AssocQueryStringW;
		alias CallWindowProc = DWTWINAPI.CallWindowProcW;
		alias CharLower = DWTWINAPI.CharLowerW;
		alias CharUpper = DWTWINAPI.CharUpperW;
		alias ChooseColor = DWTWINAPI.ChooseColorW;
		alias ChooseFont = DWTWINAPI.ChooseFontW;
		alias CreateAcceleratorTable = DWTWINAPI.CreateAcceleratorTableW;
		alias CreateDC = DWTWINAPI.CreateDCW;
		alias CreateEnhMetaFile = DWTWINAPI.CreateEnhMetaFileW;
		alias CreateEvent = DWTWINAPI.CreateEventW;
		alias CreateFile = DWTWINAPI.CreateFileW;
		alias CreateFontIndirect = DWTWINAPI.CreateFontIndirectW;
		alias CreateWindowEx = DWTWINAPI.CreateWindowExW;
		alias DefFrameProc = DWTWINAPI.DefFrameProcW;
		alias DefMDIChildProc = DWTWINAPI.DefMDIChildProcW;
		alias DefWindowProc = DWTWINAPI.DefWindowProcW;
		alias DeleteFile = DWTWINAPI.DeleteFileW;
		alias DispatchMessage = DWTWINAPI.DispatchMessageW;
		alias DragQueryFile = DWTWINAPI.DragQueryFileW;
		alias DrawState = DWTWINAPI.DrawStateW;
		alias DrawText = DWTWINAPI.DrawTextW;
		alias EnumFontFamiliesEx = DWTWINAPI.EnumFontFamiliesExW;
		alias EnumFontFamilies = DWTWINAPI.EnumFontFamiliesW;
		alias EnumSystemLanguageGroups = EnumSystemLanguageGroupsW;
		alias EnumSystemLocales = EnumSystemLocalesW;
		alias ExpandEnvironmentStrings = DWTWINAPI.ExpandEnvironmentStringsW;
		alias ExtTextOut = DWTWINAPI.ExtTextOutW;
		alias ExtractIconEx = DWTWINAPI.ExtractIconExW;
		alias FindResource = DWTWINAPI.FindResourceW;
		alias FindWindow = DWTWINAPI.FindWindowW;
		alias FormatMessage = DWTWINAPI.FormatMessageW;
		alias GetCharABCWidths = DWTWINAPI.GetCharABCWidthsW;
		alias GetCharWidth = DWTWINAPI.GetCharWidthW;
		alias GetCharacterPlacement = DWTWINAPI.GetCharacterPlacementW;
		alias GetClassInfo = DWTWINAPI.GetClassInfoW;
		alias GetClassInfoEx = DWTWINAPI.GetClassInfoExW;
		alias GetClassName = DWTWINAPI.GetClassNameW;
		alias GetClipboardFormatName = DWTWINAPI.GetClipboardFormatNameW;
		alias GetDateFormat = DWTWINAPI.GetDateFormatW;
		alias GetTimeFormat = DWTWINAPI.GetTimeFormatW;
		alias GetKeyNameText = DWTWINAPI.GetKeyNameTextW;
		alias GetLocaleInfo = DWTWINAPI.GetLocaleInfoW;
		alias GetMenuItemInfo = DWTWINAPI.GetMenuItemInfoW;
		alias GetMessage = DWTWINAPI.GetMessageW;
		alias GetModuleFileName = DWTWINAPI.GetModuleFileNameW;
		alias GetModuleHandle = DWTWINAPI.GetModuleHandleW;
		alias GetMonitorInfo = DWTWINAPI.GetMonitorInfoW;
		alias GetObject = DWTWINAPI.GetObjectW;
		alias GetOpenFileName = DWTWINAPI.GetOpenFileNameW;
		alias GetOutlineTextMetrics = DWTWINAPI.GetOutlineTextMetricsW;
		alias _GetProfileString = DWTWINAPI.GetProfileStringW;
		alias GetProp = DWTWINAPI.GetPropW;
		alias GetSaveFileName = DWTWINAPI.GetSaveFileNameW;
		alias CreateProcess = DWTWINAPI.CreateProcessW;
		alias GetStartupInfo = DWTWINAPI.GetStartupInfoW;
		alias GetTextExtentPoint32 = DWTWINAPI.GetTextExtentPoint32W;
		alias GetTextMetrics = DWTWINAPI.GetTextMetricsW;
		alias GetVersionEx = DWTWINAPI.GetVersionExW;
		alias GetWindowLong = DWTWINAPI.GetWindowLongW;
		alias GetWindowLongPtr = DWTWINAPI.GetWindowLongPtrW;
		alias _GetWindowText = DWTWINAPI.GetWindowTextW;
		alias GetWindowTextLength = DWTWINAPI.GetWindowTextLengthW;
		alias GlobalAddAtom = DWTWINAPI.GlobalAddAtomW;
		//     alias DWTWINAPI.ImmGetCompositionFontW ImmGetCompositionFont;
		//     alias DWTWINAPI.ImmGetCompositionStringW ImmGetCompositionString;
		//     alias DWTWINAPI.ImmSetCompositionFontW ImmSetCompositionFont;
		alias InsertMenu = DWTWINAPI.InsertMenuW;
		alias InsertMenuItem = DWTWINAPI.InsertMenuItemW;
		alias LoadBitmap = DWTWINAPI.LoadBitmapW;
		alias LoadCursor = DWTWINAPI.LoadCursorW;
		alias LoadIcon = DWTWINAPI.LoadIconW;
		alias LoadImage = DWTWINAPI.LoadImageW;
		alias LoadLibrary = DWTWINAPI.LoadLibraryW;
		alias LoadString = DWTWINAPI.LoadStringW;
		alias MapVirtualKey = DWTWINAPI.MapVirtualKeyW;
		alias MessageBox = DWTWINAPI.MessageBoxW;
		alias OutputDebugString = DWTWINAPI.OutputDebugStringW;
		alias PeekMessage = DWTWINAPI.PeekMessageW;
		alias PostMessage = DWTWINAPI.PostMessageW;
		alias PostThreadMessage = DWTWINAPI.PostThreadMessageW;
		alias PrintDlg = DWTWINAPI.PrintDlgW;
		alias RegEnumKeyEx = DWTWINAPI.RegEnumKeyExW;
		alias RegOpenKeyEx = DWTWINAPI.RegOpenKeyExW;
		alias RegQueryInfoKey = DWTWINAPI.RegQueryInfoKeyW;
		alias RegQueryValueEx = DWTWINAPI.RegQueryValueExW;
		alias RegisterClass = DWTWINAPI.RegisterClassW;
		alias RegisterClipboardFormat = DWTWINAPI.RegisterClipboardFormatW;
		alias RegisterWindowMessage = DWTWINAPI.RegisterWindowMessageW;
		alias RemoveProp = DWTWINAPI.RemovePropW;
		alias SHBrowseForFolder = DWTWINAPI.SHBrowseForFolderW;
		alias SHGetPathFromIDList = DWTWINAPI.SHGetPathFromIDListW;
		alias SendMessage = DWTWINAPI.SendMessageW;
		alias SetMenuItemInfo = DWTWINAPI.SetMenuItemInfoW;
		alias SetWindowLong = DWTWINAPI.SetWindowLongW;
		alias SetWindowLongPtr = DWTWINAPI.SetWindowLongPtrW;
		alias SetWindowText = DWTWINAPI.SetWindowTextW;
		alias SetWindowsHookEx = DWTWINAPI.SetWindowsHookExW;
		alias SetProp = DWTWINAPI.SetPropW;
		alias ShellExecuteEx = DWTWINAPI.ShellExecuteExW;
		alias Shell_NotifyIcon = DWTWINAPI.Shell_NotifyIconW;
		alias StartDoc = DWTWINAPI.StartDocW;
		alias SystemParametersInfo = DWTWINAPI.SystemParametersInfoW;
		alias TranslateAccelerator = DWTWINAPI.TranslateAcceleratorW;
		alias UnregisterClass = DWTWINAPI.UnregisterClassW;
		alias VkKeyScan = DWTWINAPI.VkKeyScanW;
	}

	// ----------------------------------------------------------------------------
	// UxTheme dummies until dynamic loading is in place.
	// ----------------------------------------------------------------------------
	public static extern (Windows) {
		BOOL function() IsAppThemed;

		HRESULT function(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
				RECT* pRect, RECT* pClipRect) DrawThemeBackground;

		HRESULT function(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
				LPCRECT pDestRect, UINT uEdge, UINT uFlags, LPRECT pContentRect) DrawThemeEdge;

		HRESULT function(HTHEME hTheme, HDC hdc, int iPartId, int iStateId,
				LPCRECT pRect, HIMAGELIST himl, int iImageIndex) DrawThemeIcon;

		HRESULT function(HWND hwnd, HDC hdc, RECT* prc) DrawThemeParentBackground;

		HRESULT function(HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText,
				int iCharCount, DWORD dwTextFlags, DWORD dwTextFlags2, LPCRECT pRect) DrawThemeText;

		HTHEME function(HWND hwnd, LPCWSTR pszClassList) OpenThemeData;

		HRESULT function() BufferedPaintInit;

		HRESULT function(HTHEME hTheme) CloseThemeData;

		HRESULT function() BufferedPaintUnInit;

		HPAINTBUFFER function(HDC hdcTarget, RECT* prcTarget, uint /+BP_BUFFERFORMAT+/ dwFormat,
				void*  /+BP_PAINTPARAMS+/ pPaintParams, HDC* phdc) BeginBufferedPaint;

		HRESULT function(HPAINTBUFFER hBufferedPaint, BOOL fUpdateTarget) EndBufferedPaint;

		HRESULT function(HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText,
				int iCharCount, DWORD dwTextFlags, LPCRECT pBoundingRect, LPRECT pExtentRect) GetThemeTextExtent;

		HRESULT function(HWND hwnd, LPCWSTR pszSubAppName, LPCWSTR pszSubIdList) SetWindowTheme;

	} // public static
	mixin(gshared!(`static SymbolVersioned2[] Symbols_UxTheme;`));
	private static void static_this_1() {
		Symbols_UxTheme = [SymbolVersioned2("IsAppThemed", cast(void**)&IsAppThemed, 5, 1),
			SymbolVersioned2("DrawThemeBackground", cast(void**)&DrawThemeBackground, 5, 1),
			SymbolVersioned2("DrawThemeEdge",
					cast(void**)&DrawThemeEdge,
					5, 1), SymbolVersioned2("DrawThemeIcon", cast(void**)&DrawThemeIcon, 5, 1),
			SymbolVersioned2("DrawThemeParentBackground",
					cast(void**)&DrawThemeParentBackground, 5, 1),
			SymbolVersioned2("DrawThemeText", cast(void**)&DrawThemeText,
					5, 1), SymbolVersioned2("OpenThemeData", cast(void**)&OpenThemeData, 5, 1),
			SymbolVersioned2("CloseThemeData", cast(void**)&CloseThemeData, 5, 1),
			SymbolVersioned2("GetThemeTextExtent",
					cast(void**)&GetThemeTextExtent,
					5, 1), SymbolVersioned2("SetWindowTheme", cast(void**)&SetWindowTheme, 5, 1),
			SymbolVersioned2("BufferedPaintUnInit", cast(void**)&BufferedPaintUnInit, 6, 0),
			SymbolVersioned2("BufferedPaintInit",
					cast(void**)&BufferedPaintInit,
					6, 0), SymbolVersioned2("BeginBufferedPaint", cast(void**)&BeginBufferedPaint, 6, 0),
			SymbolVersioned2("EndBufferedPaint", cast(void**)&EndBufferedPaint, 6, 0)];
	}

	static void loadLib_UxTheme() {
		SharedLib.loadLibSymbols(Symbols_UxTheme, "uxtheme.dll", WIN32_MAJOR, WIN32_MINOR);
	}
	//----------------------------------------------------------------------
	// Coreimm.lib (WinCE)
	// this function vars exist primarily for link error elimination
	//----------------------------------------------------------------------
	public static extern (Windows) {

		BOOL function(HWND hwnd, COLORREF* pcrKey, BYTE* pbAlpha, DWORD* pdwFlags) GetLayeredWindowAttributes;

		BOOL function(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags) SetLayeredWindowAttributes;

		BOOL function(HWND hwnd, // Window to copy
				HDC hdcBlt, // HDC to print into
				UINT nFlags // Optional flags
				) PrintWindow;
	} // public static extern(Windows)

	mixin(gshared!(`static SymbolVersioned2[] Symbols_CoreImm = [
];`));

	// user32.dll vista
	public static extern (Windows) {
		BOOL function() SetProcessDPIAware;
		BOOL function(HWND hWnd) IsHungAppWindow;
	}

	mixin(gshared!(`static SymbolVersioned2[] Symbols_User32;`));
	private static void static_this_2() {
		Symbols_User32 = [SymbolVersioned2("SetProcessDPIAware", cast(void**)&SetProcessDPIAware, 6, 0),
			SymbolVersioned2("GetLayeredWindowAttributes",
					cast(void**)&GetLayeredWindowAttributes, 5, 1), SymbolVersioned2("SetLayeredWindowAttributes",
					cast(void**)&SetLayeredWindowAttributes,
					5, 0), SymbolVersioned2("PrintWindow", cast(void**)&PrintWindow, 5, 1),
			SymbolVersioned2("IsHungAppWindow", cast(void**)&IsHungAppWindow, 5, 0)];
	}

	// Imm32.lib
	public static extern (Windows) {
		HIMC function(HWND hWnd) ImmGetContext;
		BOOL function(DWORD idThread) ImmDisableTextFrameService;
		HIMC function(HWND hWnd, HIMC hIMC) ImmAssociateContext;

		HIMC function() ImmCreateContext;
		int function(HIMC hIMC) ImmDestroyContext;
		BOOL function(HIMC hIMC, LPDWORD lpfdwConversion, LPDWORD lpfdwSentence) ImmGetConversionStatus;
		HWND function(HWND hWnd) ImmGetDefaultIMEWnd;
		BOOL function(HIMC hIMC) ImmGetOpenStatus;
		BOOL function(HWND hWnd, HIMC hIMC) ImmReleaseContext;
		version (ANSI) {
			BOOL function(HIMC hIMC, LOGFONTA* lplf) ImmSetCompositionFont;
			LONG function(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen) ImmGetCompositionString;
			BOOL function(HIMC hIMC, LPLOGFONTA lplf) ImmGetCompositionFont;

		}
		else {
			BOOL function(HIMC hIMC, LOGFONTW* lplf) ImmSetCompositionFont;
			LONG function(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen) ImmGetCompositionString;
			BOOL function(HIMC hIMC, LOGFONTW* lplf) ImmGetCompositionFont;
		}
		BOOL function(HIMC hIMC, LPCOMPOSITIONFORM lpCompForm) ImmSetCompositionWindow;
		BOOL function(HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence) ImmSetConversionStatus;
		BOOL function(HIMC hIMC, BOOL fOpen) ImmSetOpenStatus;
		BOOL function(HIMC hIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue) ImmNotifyIME;

		LONG function(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen) ImmGetCompositionStringA;

		LONG function(HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen) ImmGetCompositionStringW;

		BOOL function(HIMC hIMC, LPCANDIDATEFORM lpCandidate) ImmSetCandidateWindow;

	}

	mixin(gshared!(`static SymbolVersioned2[] Symbols_Imm32;`));
	private static void static_this_3() {
		Symbols_Imm32 = [SymbolVersioned2("ImmAssociateContext", cast(void**)&ImmAssociateContext, 5, 1),
			SymbolVersioned2("ImmCreateContext", cast(void**)&ImmCreateContext, 5, 1),
			SymbolVersioned2("ImmDestroyContext",
					cast(void**)&ImmDestroyContext,
					5, 1), SymbolVersioned2("ImmGetContext", cast(void**)&ImmGetContext, 5, 1),
			SymbolVersioned2("ImmGetConversionStatus", cast(void**)&ImmGetConversionStatus, 5, 1),
			SymbolVersioned2("ImmGetDefaultIMEWnd",
					cast(void**)&ImmGetDefaultIMEWnd,
					5, 1), SymbolVersioned2("ImmGetOpenStatus", cast(void**)&ImmGetOpenStatus, 5, 1),
			SymbolVersioned2("ImmReleaseContext", cast(void**)&ImmReleaseContext, 5, 1),
			SymbolVersioned2("ImmSetCompositionFontW",
					cast(void**)&ImmSetCompositionFont,
					5, 1), SymbolVersioned2("ImmGetCompositionStringW", cast(void**)&ImmGetCompositionString, 5, 1),
			SymbolVersioned2("ImmGetCompositionFontW", cast(void**)&ImmGetCompositionFont, 5, 1),
			SymbolVersioned2("ImmSetCompositionWindow",
					cast(void**)&ImmSetCompositionWindow,
					5, 1), SymbolVersioned2("ImmSetConversionStatus", cast(void**)&ImmSetConversionStatus, 5, 1),
			SymbolVersioned2("ImmSetOpenStatus", cast(void**)&ImmSetOpenStatus, 5, 1),
			SymbolVersioned2("ImmDisableTextFrameService",
					cast(void**)&ImmDisableTextFrameService,
					5, 1), SymbolVersioned2("ImmNotifyIME", cast(void**)&ImmNotifyIME, 5, 1),
			SymbolVersioned2("ImmGetCompositionStringW",
					cast(void**)&ImmGetCompositionStringW, 5, 1), SymbolVersioned2("ImmGetCompositionStringA",
					cast(void**)&ImmGetCompositionStringA, 5,
					1), SymbolVersioned2("ImmSetCandidateWindow",
					cast(void**)&ImmSetCandidateWindow, 5, 1)];
	}

	version (ANSI) {
	}
	else {
		mixin(gshared!(`static SymbolVersioned2[] Symbols_Kernel32;`));
		private static void static_this_4() {
			Symbols_Kernel32 = [SymbolVersioned2("CreateActCtxW", cast(void**)&CreateActCtx, 5, 1),
				SymbolVersioned2("ActivateActCtx", cast(void**)&ActivateActCtx, 5, 1),
				SymbolVersioned2("GetSystemDefaultUILanguage",
						cast(void**)&GetSystemDefaultUILanguage,
						5, 0), SymbolVersioned2("EnumSystemLanguageGroupsW",
						cast(void**)&EnumSystemLanguageGroupsW, 4, 0),
				SymbolVersioned2("EnumSystemLanguageGroupsA",
						cast(void**)&EnumSystemLanguageGroupsA, 4, 0),
				SymbolVersioned2("EnumSystemLocalesW", cast(void**)&EnumSystemLocalesW,
						4, 0), SymbolVersioned2("EnumSystemLocalesA",
						cast(void**)&EnumSystemLocalesA, 4, 0)];
		}
	}

	//------------------------------------------------------------------------
	/** All Natives */
	alias AbortDoc = DWTWINAPI.AbortDoc;
	alias ActivateKeyboardLayout = DWTWINAPI.ActivateKeyboardLayout;
	alias AdjustWindowRectEx = DWTWINAPI.AdjustWindowRectEx;
	alias AlphaBlend = DWTWINAPI.AlphaBlend;
	alias Arc = DWTWINAPI.Arc;
	alias BeginDeferWindowPos = DWTWINAPI.BeginDeferWindowPos;
	alias BeginPaint = DWTWINAPI.BeginPaint;
	alias BeginPath = DWTWINAPI.BeginPath;
	alias BitBlt = DWTWINAPI.BitBlt;
	alias BringWindowToTop = DWTWINAPI.BringWindowToTop;
	alias CallNextHookEx = DWTWINAPI.CallNextHookEx;
	alias CallWindowProcA = DWTWINAPI.CallWindowProcA;
	alias CallWindowProcW = DWTWINAPI.CallWindowProcW;
	alias CharLowerA = DWTWINAPI.CharLowerA;
	alias CharLowerW = DWTWINAPI.CharLowerW;
	alias CharUpperA = DWTWINAPI.CharUpperA;
	alias CharUpperW = DWTWINAPI.CharUpperW;
	alias CheckMenuItem = DWTWINAPI.CheckMenuItem;
	alias ChooseColorA = DWTWINAPI.ChooseColorA;
	alias ChooseColorW = DWTWINAPI.ChooseColorW;
	alias ChooseFontA = DWTWINAPI.ChooseFontA;
	alias ChooseFontW = DWTWINAPI.ChooseFontW;
	alias ClientToScreen = DWTWINAPI.ClientToScreen;
	alias CloseHandle = DWTWINAPI.CloseHandle;
	alias CloseClipboard = DWTWINAPI.CloseClipboard;
	alias CloseEnhMetaFile = DWTWINAPI.CloseEnhMetaFile;
	alias CloseMetaFile = DWTWINAPI.CloseMetaFile;
	alias CombineRgn = DWTWINAPI.CombineRgn;
	alias CommDlgExtendedError = DWTWINAPI.CommDlgExtendedError;

	version (WinCE) {
		alias CommandBar_AddAdornments = DWTWINAPI.CommandBar_AddAdornments;
		alias CommandBar_Create = DWTWINAPI.CommandBar_Create;
		alias CommandBar_Destroy = DWTWINAPI.CommandBar_Destroy;
		alias CommandBar_DrawMenuBar = DWTWINAPI.CommandBar_DrawMenuBar;
		alias CommandBar_Height = DWTWINAPI.CommandBar_Height;
		alias CommandBar_InsertMenubarEx = DWTWINAPI.CommandBar_InsertMenubarEx;
		alias CommandBar_Show = DWTWINAPI.CommandBar_Show;
	}

	alias CopyImage = DWTWINAPI.CopyImage;
	alias CreateAcceleratorTableA = DWTWINAPI.CreateAcceleratorTableA;
	alias CreateAcceleratorTableW = DWTWINAPI.CreateAcceleratorTableW;
	alias CreateBitmap = DWTWINAPI.CreateBitmap;
	alias CreateCaret = DWTWINAPI.CreateCaret;
	alias CreateCompatibleBitmap = DWTWINAPI.CreateCompatibleBitmap;
	alias CreateCompatibleDC = DWTWINAPI.CreateCompatibleDC;
	alias CreateCursor = DWTWINAPI.CreateCursor;
	alias CreateDCA = DWTWINAPI.CreateDCA;
	alias CreateDCW = DWTWINAPI.CreateDCW;
	alias CreateDIBSection = DWTWINAPI.CreateDIBSection;
	alias CreateEventA = DWTWINAPI.CreateEventA;
	alias CreateEventW = DWTWINAPI.CreateEventW;
	alias CreateFileA = DWTWINAPI.CreateFileA;
	alias CreateFileW = DWTWINAPI.CreateFileW;
	alias CreateFontIndirectA = DWTWINAPI.CreateFontIndirectA;
	alias CreateFontIndirectW = DWTWINAPI.CreateFontIndirectW;
	alias CreateIconIndirect = DWTWINAPI.CreateIconIndirect;
	alias CreateMenu = DWTWINAPI.CreateMenu;
	alias CreatePalette = DWTWINAPI.CreatePalette;
	alias CreatePatternBrush = DWTWINAPI.CreatePatternBrush;
	alias CreatePen = DWTWINAPI.CreatePen;
	alias CreatePolygonRgn = DWTWINAPI.CreatePolygonRgn;
	alias CreatePopupMenu = DWTWINAPI.CreatePopupMenu;
	alias CreateRectRgn = DWTWINAPI.CreateRectRgn;
	alias CreateSolidBrush = DWTWINAPI.CreateSolidBrush;
	alias CreateWindowExA = DWTWINAPI.CreateWindowExA;
	alias CreateWindowExW = DWTWINAPI.CreateWindowExW;
	alias DefFrameProcA = DWTWINAPI.DefFrameProcA;
	alias DefFrameProcW = DWTWINAPI.DefFrameProcW;
	alias DefMDIChildProcA = DWTWINAPI.DefMDIChildProcA;
	alias DefMDIChildProcW = DWTWINAPI.DefMDIChildProcW;
	alias DefWindowProcA = DWTWINAPI.DefWindowProcA;
	alias DefWindowProcW = DWTWINAPI.DefWindowProcW;
	alias DeferWindowPos = DWTWINAPI.DeferWindowPos;
	alias DeleteDC = DWTWINAPI.DeleteDC;
	alias DeleteEnhMetaFile = DWTWINAPI.DeleteEnhMetaFile;
	alias DeleteMenu = DWTWINAPI.DeleteMenu;
	alias DeleteObject = DWTWINAPI.DeleteObject;
	alias DestroyAcceleratorTable = DWTWINAPI.DestroyAcceleratorTable;
	alias DestroyCaret = DWTWINAPI.DestroyCaret;
	alias DestroyCursor = DWTWINAPI.DestroyCursor;
	alias DestroyIcon = DWTWINAPI.DestroyIcon;
	alias DestroyMenu = DWTWINAPI.DestroyMenu;
	alias DestroyWindow = DWTWINAPI.DestroyWindow;
	alias DispatchMessageA = DWTWINAPI.DispatchMessageA;
	alias DispatchMessageW = DWTWINAPI.DispatchMessageW;
	alias DragDetect = DWTWINAPI.DragDetect;
	alias DragFinish = DWTWINAPI.DragFinish;
	alias DragQueryFileA = DWTWINAPI.DragQueryFileA;
	alias DragQueryFileW = DWTWINAPI.DragQueryFileW;
	alias DrawEdge = DWTWINAPI.DrawEdge;
	alias DrawFocusRect = DWTWINAPI.DrawFocusRect;
	alias DrawFrameControl = DWTWINAPI.DrawFrameControl;
	alias DrawIconEx = DWTWINAPI.DrawIconEx;
	alias DrawMenuBar = DWTWINAPI.DrawMenuBar;
	alias DrawStateA = DWTWINAPI.DrawStateA;
	alias DrawStateW = DWTWINAPI.DrawStateW;
	alias DrawTextA = DWTWINAPI.DrawTextA;
	alias DrawTextW = DWTWINAPI.DrawTextW;
	alias Ellipse = DWTWINAPI.Ellipse;
	alias EnableMenuItem = DWTWINAPI.EnableMenuItem;
	alias EnableScrollBar = DWTWINAPI.EnableScrollBar;
	alias EnableWindow = DWTWINAPI.EnableWindow;
	alias EndDeferWindowPos = DWTWINAPI.EndDeferWindowPos;
	alias EndDoc = DWTWINAPI.EndDoc;
	alias EndPage = DWTWINAPI.EndPage;
	alias EndPaint = DWTWINAPI.EndPaint;
	alias EndPath = DWTWINAPI.EndPath;
	alias EnumDisplayMonitors = DWTWINAPI.EnumDisplayMonitors;
	alias EnumEnhMetaFile = DWTWINAPI.EnumEnhMetaFile;
	alias EnumFontFamiliesA = DWTWINAPI.EnumFontFamiliesA;
	alias EnumFontFamiliesExA = DWTWINAPI.EnumFontFamiliesExA;
	alias EnumFontFamiliesExW = DWTWINAPI.EnumFontFamiliesExW;
	alias EnumFontFamiliesW = DWTWINAPI.EnumFontFamiliesW;
	alias EqualRect = DWTWINAPI.EqualRect;
	alias EqualRgn = DWTWINAPI.EqualRgn;
	alias ExcludeClipRect = DWTWINAPI.ExcludeClipRect;
	alias ExpandEnvironmentStringsA = DWTWINAPI.ExpandEnvironmentStringsA;
	alias ExpandEnvironmentStringsW = DWTWINAPI.ExpandEnvironmentStringsW;
	alias ExtTextOutA = DWTWINAPI.ExtTextOutA;
	alias ExtTextOutW = DWTWINAPI.ExtTextOutW;
	alias ExtractIconExA = DWTWINAPI.ExtractIconExA;
	alias ExtractIconExW = DWTWINAPI.ExtractIconExW;
	alias ExtCreatePen = DWTWINAPI.ExtCreatePen;
	alias ExtCreateRegion = DWTWINAPI.ExtCreateRegion;
	alias FillRect = DWTWINAPI.FillRect;
	alias FindResourceA = DWTWINAPI.FindResourceA;
	alias FindResourceW = DWTWINAPI.FindResourceW;
	alias FindWindowA = DWTWINAPI.FindWindowA;
	alias FindWindowW = DWTWINAPI.FindWindowW;
	alias FormatMessageA = DWTWINAPI.FormatMessageA;
	alias FormatMessageW = DWTWINAPI.FormatMessageW;
	alias FreeLibrary = DWTWINAPI.FreeLibrary;
	alias GdiSetBatchLimit = DWTWINAPI.GdiSetBatchLimit;
	alias GetACP = DWTWINAPI.GetACP;
	alias GetAsyncKeyState = DWTWINAPI.GetAsyncKeyState;
	alias GetActiveWindow = DWTWINAPI.GetActiveWindow;
	alias GetBkColor = DWTWINAPI.GetBkColor;
	alias GetCapture = DWTWINAPI.GetCapture;
	alias GetCaretPos = DWTWINAPI.GetCaretPos;
	alias GetCharABCWidthsA = DWTWINAPI.GetCharABCWidthsA;
	alias GetCharABCWidthsW = DWTWINAPI.GetCharABCWidthsW;
	alias GetCharWidthA = DWTWINAPI.GetCharWidthA;
	alias GetCharWidthW = DWTWINAPI.GetCharWidthW;
	alias GetCharacterPlacementA = DWTWINAPI.GetCharacterPlacementA;
	alias GetCharacterPlacementW = DWTWINAPI.GetCharacterPlacementW;
	alias GetClassInfoA = DWTWINAPI.GetClassInfoA;
	alias GetClassInfoW = DWTWINAPI.GetClassInfoW;
	alias GetClientRect = DWTWINAPI.GetClientRect;
	alias GetClipBox = DWTWINAPI.GetClipBox;
	alias GetClipRgn = DWTWINAPI.GetClipRgn;
	alias GetClipboardData = DWTWINAPI.GetClipboardData;
	alias GetClipboardFormatNameA = DWTWINAPI.GetClipboardFormatNameA;
	alias GetClipboardFormatNameW = DWTWINAPI.GetClipboardFormatNameW;
	alias GetComboBoxInfo = DWTWINAPI.GetComboBoxInfo;
	alias GetCurrentObject = DWTWINAPI.GetCurrentObject;
	alias GetCurrentProcessId = DWTWINAPI.GetCurrentProcessId;
	alias GetCurrentThreadId = DWTWINAPI.GetCurrentThreadId;
	alias GetCursor = DWTWINAPI.GetCursor;
	alias GetCursorPos = DWTWINAPI.GetCursorPos;
	alias GetDC = DWTWINAPI.GetDC;
	alias GetDCEx = DWTWINAPI.GetDCEx;
	alias GetDIBColorTable = DWTWINAPI.GetDIBColorTable;
	alias GetDIBits = DWTWINAPI.GetDIBits;
	alias GetDesktopWindow = DWTWINAPI.GetDesktopWindow;
	alias GetDeviceCaps = DWTWINAPI.GetDeviceCaps;
	alias GetDialogBaseUnits = DWTWINAPI.GetDialogBaseUnits;
	alias GetDlgItem = DWTWINAPI.GetDlgItem;
	alias GetDoubleClickTime = DWTWINAPI.GetDoubleClickTime;
	alias GetFocus = DWTWINAPI.GetFocus;
	alias GetFontLanguageInfo = DWTWINAPI.GetFontLanguageInfo;
	alias GetGUIThreadInfo = DWTWINAPI.GetGUIThreadInfo;
	alias GetIconInfo = DWTWINAPI.GetIconInfo;
	alias GetKeyNameTextA = DWTWINAPI.GetKeyNameTextA;
	alias GetKeyNameTextW = DWTWINAPI.GetKeyNameTextW;
	alias GetKeyState = DWTWINAPI.GetKeyState;
	alias GetKeyboardLayout = DWTWINAPI.GetKeyboardLayout;
	alias GetKeyboardLayoutList = DWTWINAPI.GetKeyboardLayoutList;
	alias GetKeyboardState = DWTWINAPI.GetKeyboardState;
	alias GetLastActivePopup = DWTWINAPI.GetLastActivePopup;
	alias GetLastError = DWTWINAPI.GetLastError;
	alias GetLayout = DWTWINAPI.GetLayout;
	alias GetLocaleInfoA = DWTWINAPI.GetLocaleInfoA;
	alias GetLocaleInfoW = DWTWINAPI.GetLocaleInfoW;
	alias GetMenu = DWTWINAPI.GetMenu;
	alias GetMenuBarInfo = DWTWINAPI.GetMenuBarInfo;
	alias GetMenuDefaultItem = DWTWINAPI.GetMenuDefaultItem;
	alias GetMenuInfo = DWTWINAPI.GetMenuInfo;
	alias GetMenuItemCount = DWTWINAPI.GetMenuItemCount;
	alias GetMenuItemInfoA = DWTWINAPI.GetMenuItemInfoA;
	alias GetMenuItemInfoW = DWTWINAPI.GetMenuItemInfoW;
	alias GetMenuItemRect = DWTWINAPI.GetMenuItemRect;
	alias GetMessageA = DWTWINAPI.GetMessageA;
	alias GetMessagePos = DWTWINAPI.GetMessagePos;
	alias GetMessageTime = DWTWINAPI.GetMessageTime;
	alias GetMetaRgn = DWTWINAPI.GetMetaRgn;
	alias GetMessageW = DWTWINAPI.GetMessageW;
	alias GetModuleFileNameA = DWTWINAPI.GetModuleFileNameA;
	alias GetModuleFileNameW = DWTWINAPI.GetModuleFileNameW;
	alias GetModuleHandleA = DWTWINAPI.GetModuleHandleA;
	alias GetModuleHandleW = DWTWINAPI.GetModuleHandleW;
	alias GetMonitorInfoA = DWTWINAPI.GetMonitorInfoA;
	alias GetMonitorInfoW = DWTWINAPI.GetMonitorInfoW;
	alias GetNearestPaletteIndex = DWTWINAPI.GetNearestPaletteIndex;
	alias GetPath = DWTWINAPI.GetPath;
	alias GetObjectA = DWTWINAPI.GetObjectA;
	alias GetObjectW = DWTWINAPI.GetObjectW;
	alias GetOpenFileNameA = DWTWINAPI.GetOpenFileNameA;
	alias GetOpenFileNameW = DWTWINAPI.GetOpenFileNameW;
	alias GetPaletteEntries = DWTWINAPI.GetPaletteEntries;
	alias GetParent = DWTWINAPI.GetParent;
	alias GetPixel = DWTWINAPI.GetPixel;
	alias GetPolyFillMode = DWTWINAPI.GetPolyFillMode;
	alias GetProcAddress = DWTWINAPI.GetProcAddress;
	alias GetProcessHeap = DWTWINAPI.GetProcessHeap;
	alias GetProfileStringA = DWTWINAPI.GetProfileStringA;
	alias GetProfileStringW = DWTWINAPI.GetProfileStringW;
	alias GetROP2 = DWTWINAPI.GetROP2;
	alias GetRandomRgn = DWTWINAPI.GetRandomRgn;
	alias GetRegionData = DWTWINAPI.GetRegionData;
	alias GetRgnBox = DWTWINAPI.GetRgnBox;
	alias GetSaveFileNameA = DWTWINAPI.GetSaveFileNameA;
	alias GetSaveFileNameW = DWTWINAPI.GetSaveFileNameW;
	alias GetScrollInfo = DWTWINAPI.GetScrollInfo;
	alias GetStockObject = DWTWINAPI.GetStockObject;
	alias GetSysColor = DWTWINAPI.GetSysColor;
	alias GetSysColorBrush = DWTWINAPI.GetSysColorBrush;
	//alias DWTWINAPI.GetSystemDefaultUILanguage GetSystemDefaultUILanguage;
	alias GetSystemMenu = DWTWINAPI.GetSystemMenu;
	alias GetSystemMetrics = DWTWINAPI.GetSystemMetrics;
	alias GetSystemPaletteEntries = DWTWINAPI.GetSystemPaletteEntries;
	alias GetTextCharset = DWTWINAPI.GetTextCharset;
	alias GetTextColor = DWTWINAPI.GetTextColor;
	alias GetTextExtentPoint32A = DWTWINAPI.GetTextExtentPoint32A;
	alias GetTextExtentPoint32W = DWTWINAPI.GetTextExtentPoint32W;
	alias GetTextMetricsA = DWTWINAPI.GetTextMetricsA;
	alias GetTextMetricsW = DWTWINAPI.GetTextMetricsW;
	alias GetTickCount = DWTWINAPI.GetTickCount;
	alias GetUpdateRect = DWTWINAPI.GetUpdateRect;
	alias GetUpdateRgn = DWTWINAPI.GetUpdateRgn;
	alias GetVersion = DWTWINAPI.GetVersion;
	alias GetVersionExA = DWTWINAPI.GetVersionExA;
	alias GetVersionExW = DWTWINAPI.GetVersionExW;
	alias GetWindow = DWTWINAPI.GetWindow;
	alias GetWindowDC = DWTWINAPI.GetWindowDC;
	alias GetWindowOrgEx = DWTWINAPI.GetWindowOrgEx;
	alias GetWindowLongA = DWTWINAPI.GetWindowLongA;
	alias GetWindowLongW = DWTWINAPI.GetWindowLongW;
	alias GetWindowPlacement = DWTWINAPI.GetWindowPlacement;
	alias GetWindowRect = DWTWINAPI.GetWindowRect;
	alias GetWindowRgn = DWTWINAPI.GetWindowRgn;
	alias GetWindowTextA = DWTWINAPI.GetWindowTextA;
	alias GetWindowTextLengthA = DWTWINAPI.GetWindowTextLengthA;
	alias GetWindowTextLengthW = DWTWINAPI.GetWindowTextLengthW;
	alias GetWindowTextW = DWTWINAPI.GetWindowTextW;
	alias GetWindowThreadProcessId = DWTWINAPI.GetWindowThreadProcessId;
	alias GlobalAlloc = DWTWINAPI.GlobalAlloc;
	alias GlobalFree = DWTWINAPI.GlobalFree;
	alias GlobalLock = DWTWINAPI.GlobalLock;
	alias GlobalSize = DWTWINAPI.GlobalSize;
	alias GlobalUnlock = DWTWINAPI.GlobalUnlock;
	alias GradientFill = DWTWINAPI.GradientFill;
	alias HeapAlloc = DWTWINAPI.HeapAlloc;
	alias HeapFree = DWTWINAPI.HeapFree;
	alias HideCaret = DWTWINAPI.HideCaret;
	alias IIDFromString = DWTWINAPI.IIDFromString;
	alias ImageList_Add = DWTWINAPI.ImageList_Add;
	alias ImageList_AddMasked = DWTWINAPI.ImageList_AddMasked;
	alias ImageList_BeginDrag = DWTWINAPI.ImageList_BeginDrag;
	alias ImageList_Create = DWTWINAPI.ImageList_Create;
	alias ImageList_Destroy = DWTWINAPI.ImageList_Destroy;
	alias ImageList_DragEnter = DWTWINAPI.ImageList_DragEnter;
	alias ImageList_DragLeave = DWTWINAPI.ImageList_DragLeave;
	alias ImageList_DragMove = DWTWINAPI.ImageList_DragMove;
	alias ImageList_DragShowNolock = DWTWINAPI.ImageList_DragShowNolock;
	alias ImageList_Draw = DWTWINAPI.ImageList_Draw;
	alias ImageList_EndDrag = DWTWINAPI.ImageList_EndDrag;
	alias ImageList_GetIcon = DWTWINAPI.ImageList_GetIcon;
	alias ImageList_GetIconSize = DWTWINAPI.ImageList_GetIconSize;
	alias ImageList_GetImageCount = DWTWINAPI.ImageList_GetImageCount;
	alias ImageList_Remove = DWTWINAPI.ImageList_Remove;
	alias ImageList_Replace = DWTWINAPI.ImageList_Replace;
	alias ImageList_ReplaceIcon = DWTWINAPI.ImageList_ReplaceIcon;
	alias ImageList_SetIconSize = DWTWINAPI.ImageList_SetIconSize;
	// alias DWTWINAPI.ImmAssociateContext ImmAssociateContext;
	// alias DWTWINAPI.ImmCreateContext ImmCreateContext;
	// alias DWTWINAPI.ImmDestroyContext ImmDestroyContext;
	// alias DWTWINAPI.ImmGetCompositionFontA ImmGetCompositionFontA;
	// alias DWTWINAPI.ImmGetCompositionFontW ImmGetCompositionFontW;
	// alias DWTWINAPI.ImmGetCompositionStringA ImmGetCompositionStringA;
	// alias DWTWINAPI.ImmGetCompositionStringW ImmGetCompositionStringW;
	// alias DWTWINAPI.ImmGetContext ImmGetContext;
	// alias DWTWINAPI.ImmGetConversionStatus ImmGetConversionStatus;
	// alias DWTWINAPI.ImmGetDefaultIMEWnd ImmGetDefaultIMEWnd;
	// alias DWTWINAPI.ImmGetOpenStatus ImmGetOpenStatus;
	// alias DWTWINAPI.ImmReleaseContext ImmReleaseContext;
	// alias DWTWINAPI.ImmSetCompositionFontA ImmSetCompositionFontA;
	// alias DWTWINAPI.ImmSetCompositionFontW ImmSetCompositionFontW;
	// alias DWTWINAPI.ImmSetOpenStatus ImmSetOpenStatus;
	alias InitCommonControls = DWTWINAPI.InitCommonControls;
	alias InitCommonControlsEx = DWTWINAPI.InitCommonControlsEx;
	alias InsertMenuA = DWTWINAPI.InsertMenuA;
	alias InsertMenuItemA = DWTWINAPI.InsertMenuItemA;
	alias InsertMenuItemW = DWTWINAPI.InsertMenuItemW;
	alias InsertMenuW = DWTWINAPI.InsertMenuW;
	alias InterlockedDecrement = DWTWINAPI.InterlockedDecrement;
	alias InterlockedIncrement = DWTWINAPI.InterlockedIncrement;
	alias IntersectClipRect = DWTWINAPI.IntersectClipRect;
	alias IntersectRect = DWTWINAPI.IntersectRect;
	alias InvalidateRect = DWTWINAPI.InvalidateRect;
	alias InvalidateRgn = DWTWINAPI.InvalidateRgn;
	alias IsDBCSLeadByte = DWTWINAPI.IsDBCSLeadByte;
	//alias DWTWINAPI.IsHungAppWindow IsHungAppWindow;
	alias IsIconic = DWTWINAPI.IsIconic;
	alias IsWindow = DWTWINAPI.IsWindow;
	alias IsWindowEnabled = DWTWINAPI.IsWindowEnabled;
	alias IsWindowVisible = DWTWINAPI.IsWindowVisible;
	alias IsZoomed = DWTWINAPI.IsZoomed;
	alias KillTimer = DWTWINAPI.KillTimer;
	alias LineTo = DWTWINAPI.LineTo;
	alias LoadBitmapA = DWTWINAPI.LoadBitmapA;
	alias LoadBitmapW = DWTWINAPI.LoadBitmapW;
	alias LoadCursorA = DWTWINAPI.LoadCursorA;
	alias LoadCursorW = DWTWINAPI.LoadCursorW;
	alias LoadIconA = DWTWINAPI.LoadIconA;
	alias LoadIconW = DWTWINAPI.LoadIconW;
	alias LoadImageA = DWTWINAPI.LoadImageA;
	alias LoadImageW = DWTWINAPI.LoadImageW;
	alias LoadLibraryA = DWTWINAPI.LoadLibraryA;
	alias LoadLibraryW = DWTWINAPI.LoadLibraryW;
	alias LoadResource = DWTWINAPI.LoadResource;
	alias LoadStringA = DWTWINAPI.LoadStringA;
	alias LoadStringW = DWTWINAPI.LoadStringW;
	alias LocalFree = DWTWINAPI.LocalFree;
	alias LockResource = DWTWINAPI.LockResource;
	alias MapVirtualKeyA = DWTWINAPI.MapVirtualKeyA;
	alias MapVirtualKeyW = DWTWINAPI.MapVirtualKeyW;
	alias MapWindowPoints = DWTWINAPI.MapWindowPoints;
	alias MessageBeep = DWTWINAPI.MessageBeep;
	alias MessageBoxA = DWTWINAPI.MessageBoxA;
	alias MessageBoxW = DWTWINAPI.MessageBoxW;
	alias MonitorFromWindow = DWTWINAPI.MonitorFromWindow;
	alias MoveToEx = DWTWINAPI.MoveToEx;
	alias MsgWaitForMultipleObjectsEx = DWTWINAPI.MsgWaitForMultipleObjectsEx;
	alias MultiByteToWideChar = DWTWINAPI.MultiByteToWideChar;
	alias NotifyWinEvent = DWTWINAPI.NotifyWinEvent;
	alias OffsetRect = DWTWINAPI.OffsetRect;
	alias OffsetRgn = DWTWINAPI.OffsetRgn;
	//alias DWTWINAPI.OleInitialize OleInitialize;
	//alias DWTWINAPI.OleUninitialize OleUninitialize;
	alias OpenClipboard = DWTWINAPI.OpenClipboard;
	alias OutputDebugStringA = DWTWINAPI.OutputDebugStringA;
	alias OutputDebugStringW = DWTWINAPI.OutputDebugStringW;
	alias PatBlt = DWTWINAPI.PatBlt;
	alias PeekMessageA = DWTWINAPI.PeekMessageA;
	alias PeekMessageW = DWTWINAPI.PeekMessageW;
	alias Pie = DWTWINAPI.Pie;
	alias Polygon = DWTWINAPI.Polygon;
	alias Polyline = DWTWINAPI.Polyline;
	alias PostMessageA = DWTWINAPI.PostMessageA;
	alias PostMessageW = DWTWINAPI.PostMessageW;
	alias PostThreadMessageA = DWTWINAPI.PostThreadMessageA;
	alias PostThreadMessageW = DWTWINAPI.PostThreadMessageW;
	alias PrintDlgA = DWTWINAPI.PrintDlgA;
	alias PrintDlgW = DWTWINAPI.PrintDlgW;
	alias PtInRect = DWTWINAPI.PtInRect;
	alias PtInRegion = DWTWINAPI.PtInRegion;
	alias RealizePalette = DWTWINAPI.RealizePalette;
	alias Rectangle = DWTWINAPI.Rectangle;
	alias RectInRegion = DWTWINAPI.RectInRegion;
	// <Shawn> Renamed : may conflict with org.eclipse.swt.graphics.rectangle.Rectangle
	alias _Rectangle = DWTWINAPI.Rectangle;
	alias RedrawWindow = DWTWINAPI.RedrawWindow;
	alias RegCloseKey = DWTWINAPI.RegCloseKey;
	alias RegEnumKeyExA = DWTWINAPI.RegEnumKeyExA;
	alias RegEnumKeyExW = DWTWINAPI.RegEnumKeyExW;
	alias RegOpenKeyExA = DWTWINAPI.RegOpenKeyExA;
	alias RegOpenKeyExW = DWTWINAPI.RegOpenKeyExW;
	alias RegQueryInfoKeyA = DWTWINAPI.RegQueryInfoKeyA;
	alias RegQueryInfoKeyW = DWTWINAPI.RegQueryInfoKeyW;
	alias RegQueryValueExA = DWTWINAPI.RegQueryValueExA;
	alias RegQueryValueExW = DWTWINAPI.RegQueryValueExW;
	alias RegisterClassA = DWTWINAPI.RegisterClassA;
	alias RegisterClassW = DWTWINAPI.RegisterClassW;
	alias RegisterClipboardFormatA = DWTWINAPI.RegisterClipboardFormatA;
	alias RegisterClipboardFormatW = DWTWINAPI.RegisterClipboardFormatW;
	alias RegisterWindowMessageA = DWTWINAPI.RegisterWindowMessageA;
	alias RegisterWindowMessageW = DWTWINAPI.RegisterWindowMessageW;
	alias ReleaseCapture = DWTWINAPI.ReleaseCapture;
	alias ReleaseDC = DWTWINAPI.ReleaseDC;
	alias RemoveMenu = DWTWINAPI.RemoveMenu;
	alias RestoreDC = DWTWINAPI.RestoreDC;
	alias RoundRect = DWTWINAPI.RoundRect;
	alias MoveMemory = DWTWINAPI.RtlMoveMemory;
	alias SHBrowseForFolderA = DWTWINAPI.SHBrowseForFolderA;
	alias SHBrowseForFolderW = DWTWINAPI.SHBrowseForFolderW;
	version (WinCE) {
		alias SHCreateMenuBar = DWTWINAPI.SHCreateMenuBar;
	}
	alias SHGetMalloc = DWTWINAPI.SHGetMalloc;
	alias SHGetPathFromIDListA = DWTWINAPI.SHGetPathFromIDListA;
	alias SHGetPathFromIDListW = DWTWINAPI.SHGetPathFromIDListW;
	version (WinCE) {
		alias SHHandleWMSettingChange = DWTWINAPI.SHHandleWMSettingChange;
		alias SHRecognizeGesture = DWTWINAPI.SHRecognizeGesture;
		alias SHSendBackToFocusWindow = DWTWINAPI.SHSendBackToFocusWindow;
		alias SHSetAppKeyWndAssoc = DWTWINAPI.SHSetAppKeyWndAssoc;
		alias SHSipPreference = DWTWINAPI.SHSipPreference;
	}
	alias SaveDC = DWTWINAPI.SaveDC;
	alias ScreenToClient = DWTWINAPI.ScreenToClient;
	alias ScriptApplyDigitSubstitution = DWTWINAPI.ScriptApplyDigitSubstitution;
	alias ScriptBreak = DWTWINAPI.ScriptBreak;
	alias ScriptCPtoX = DWTWINAPI.ScriptCPtoX;
	alias ScriptCacheGetHeight = DWTWINAPI.ScriptCacheGetHeight;
	alias ScriptFreeCache = DWTWINAPI.ScriptFreeCache;
	alias ScriptGetFontProperties = DWTWINAPI.ScriptGetFontProperties;
	alias ScriptGetLogicalWidths = DWTWINAPI.ScriptGetLogicalWidths;
	alias ScriptGetProperties = DWTWINAPI.ScriptGetProperties;
	alias ScriptItemize = DWTWINAPI.ScriptItemize;
	alias ScriptJustify = DWTWINAPI.ScriptJustify;
	alias ScriptLayout = DWTWINAPI.ScriptLayout;
	alias ScriptPlace = DWTWINAPI.ScriptPlace;
	alias ScriptRecordDigitSubstitution = DWTWINAPI.ScriptRecordDigitSubstitution;
	alias ScriptGetCMap = DWTWINAPI.ScriptGetCMap;
	alias ScriptShape = DWTWINAPI.ScriptShape;
	alias ScriptStringAnalyse = DWTWINAPI.ScriptStringAnalyse;
	alias ScriptStringOut = DWTWINAPI.ScriptStringOut;
	alias ScriptStringFree = DWTWINAPI.ScriptStringFree;
	alias ScriptTextOut = DWTWINAPI.ScriptTextOut;
	alias ScriptXtoCP = DWTWINAPI.ScriptXtoCP;
	alias ScrollWindowEx = DWTWINAPI.ScrollWindowEx;
	alias SelectClipRgn = DWTWINAPI.SelectClipRgn;
	alias SelectObject = DWTWINAPI.SelectObject;
	alias SelectPalette = DWTWINAPI.SelectPalette;
	alias SendInput = DWTWINAPI.SendInput;
	alias SendMessageA = DWTWINAPI.SendMessageA;
	alias SendMessageW = DWTWINAPI.SendMessageW;
	alias SetActiveWindow = DWTWINAPI.SetActiveWindow;
	alias SetBkColor = DWTWINAPI.SetBkColor;
	alias SetBkMode = DWTWINAPI.SetBkMode;
	alias SetBrushOrgEx = DWTWINAPI.SetBrushOrgEx;
	alias SetCapture = DWTWINAPI.SetCapture;
	alias SetCaretPos = DWTWINAPI.SetCaretPos;
	alias SetClipboardData = DWTWINAPI.SetClipboardData;
	alias SetCursor = DWTWINAPI.SetCursor;
	alias SetCursorPos = DWTWINAPI.SetCursorPos;
	alias SetDIBColorTable = DWTWINAPI.SetDIBColorTable;
	alias SetErrorMode = DWTWINAPI.SetErrorMode;
	alias SetEvent = DWTWINAPI.SetEvent;
	alias SetFocus = DWTWINAPI.SetFocus;
	alias SetForegroundWindow = DWTWINAPI.SetForegroundWindow;
	alias SetGraphicsMode = DWTWINAPI.SetGraphicsMode;
	alias SetLastError = DWTWINAPI.SetLastError;
	alias SetLayout = DWTWINAPI.SetLayout;
	alias SetMenu = DWTWINAPI.SetMenu;
	alias SetMenuDefaultItem = DWTWINAPI.SetMenuDefaultItem;
	alias SetMenuInfo = DWTWINAPI.SetMenuInfo;
	alias SetMenuItemInfoA = DWTWINAPI.SetMenuItemInfoA;
	alias SetMenuItemInfoW = DWTWINAPI.SetMenuItemInfoW;
	alias SetMetaRgn = DWTWINAPI.SetMetaRgn;
	alias SetPaletteEntries = DWTWINAPI.SetPaletteEntries;
	alias SetParent = DWTWINAPI.SetParent;
	alias SetPixel = DWTWINAPI.SetPixel;
	alias SetPolyFillMode = DWTWINAPI.SetPolyFillMode;
	alias SetROP2 = DWTWINAPI.SetROP2;
	alias SetRect = DWTWINAPI.SetRect;
	alias SetRectRgn = DWTWINAPI.SetRectRgn;
	alias SetScrollInfo = DWTWINAPI.SetScrollInfo;
	alias SetStretchBltMode = DWTWINAPI.SetStretchBltMode;
	alias SetTextAlign = DWTWINAPI.SetTextAlign;
	alias SetTextColor = DWTWINAPI.SetTextColor;
	alias SetTimer = DWTWINAPI.SetTimer;
	alias SetWindowLongA = DWTWINAPI.SetWindowLongA;
	alias SetWindowLongW = DWTWINAPI.SetWindowLongW;
	alias SetWindowOrgEx = DWTWINAPI.SetWindowOrgEx;
	alias SetWindowPlacement = DWTWINAPI.SetWindowPlacement;
	alias SetWindowPos = DWTWINAPI.SetWindowPos;
	alias SetWindowRgn = DWTWINAPI.SetWindowRgn;
	alias SetWorldTransform = DWTWINAPI.SetWorldTransform;
	alias SetWindowTextA = DWTWINAPI.SetWindowTextA;
	alias SetWindowTextW = DWTWINAPI.SetWindowTextW;
	alias SetWindowsHookExA = DWTWINAPI.SetWindowsHookExA;
	alias SetWindowsHookExW = DWTWINAPI.SetWindowsHookExW;
	alias ShellExecuteExA = DWTWINAPI.ShellExecuteExA;
	alias ShellExecuteExW = DWTWINAPI.ShellExecuteExW;
	alias Shell_NotifyIconA = DWTWINAPI.Shell_NotifyIconA;
	alias Shell_NotifyIconW = DWTWINAPI.Shell_NotifyIconW;
	alias SHGetFileInfo = DWTWINAPI.SHGetFileInfo;
	alias ShowCaret = DWTWINAPI.ShowCaret;
	alias ShowOwnedPopups = DWTWINAPI.ShowOwnedPopups;
	alias ShowScrollBar = DWTWINAPI.ShowScrollBar;
	alias ShowWindow = DWTWINAPI.ShowWindow;
	version (WinCE) {
		alias SipGetInfo = DWTWINAPI.SipGetInfo;
	}
	alias SizeofResource = DWTWINAPI.SizeofResource;
	alias Sleep = DWTWINAPI.Sleep;
	alias StartDocA = DWTWINAPI.StartDocA;
	alias StartDocW = DWTWINAPI.StartDocW;
	alias StartPage = DWTWINAPI.StartPage;
	alias StretchBlt = DWTWINAPI.StretchBlt;
	alias SystemParametersInfoA = DWTWINAPI.SystemParametersInfoA;
	alias SystemParametersInfoW = DWTWINAPI.SystemParametersInfoW;
	alias ToAscii = DWTWINAPI.ToAscii;
	alias ToUnicode = DWTWINAPI.ToUnicode;
	alias TrackMouseEvent = DWTWINAPI.TrackMouseEvent;
	alias TrackPopupMenu = DWTWINAPI.TrackPopupMenu;
	alias TranslateAcceleratorA = DWTWINAPI.TranslateAcceleratorA;
	alias TranslateAcceleratorW = DWTWINAPI.TranslateAcceleratorW;
	alias TranslateCharsetInfo = DWTWINAPI.TranslateCharsetInfo;
	alias TranslateMDISysAccel = DWTWINAPI.TranslateMDISysAccel;
	alias TranslateMessage = DWTWINAPI.TranslateMessage;
	alias TransparentBlt = DWTWINAPI.TransparentBlt;
	version (WinCE) {
		alias TransparentImage = DWTWINAPI.TransparentImage;
	}
	alias UnhookWindowsHookEx = DWTWINAPI.UnhookWindowsHookEx;
	alias UnregisterClassA = DWTWINAPI.UnregisterClassA;
	alias UnregisterClassW = DWTWINAPI.UnregisterClassW;
	alias UpdateWindow = DWTWINAPI.UpdateWindow;
	alias ValidateRect = DWTWINAPI.ValidateRect;
	alias VkKeyScanA = DWTWINAPI.VkKeyScanA;
	alias VkKeyScanW = DWTWINAPI.VkKeyScanW;
	alias WaitForMultipleObjects = DWTWINAPI.WaitForMultipleObjects;
	alias WaitForSingleObject = DWTWINAPI.WaitForSingleObject;
	alias WaitMessage = DWTWINAPI.WaitMessage;
	alias WideCharToMultiByte = DWTWINAPI.WideCharToMultiByte;
	alias WindowFromDC = DWTWINAPI.WindowFromDC;
	alias WindowFromPoint = DWTWINAPI.WindowFromPoint;
	alias wcslen = DWTWINAPI.wcslen;

	public static int VERSION(int major, int minor) {
		return major << 16 | minor;
	}

	//static int DrawText(int hDC, String lpString, RECT* lpRect, int uFormat){
	//  return DWTWINAPI.DrawText(hDC, Convert.StringToTCHARz(lpString), lpString.length, lpRect, uFormat);
	//}
	//
	//static int DrawText(int hDC, TCHAR* lpString, int length, RECT* lpRect, int uFormat){
	//  return DWTWINAPI.DrawText(hDC, lpString, length, lpRect, uFormat);
	//}

	static int GetProfileString(String lpAppName, String lpKeyName,
			String lpDefault, out String lpReturnedString, int nSize) {
		TCHAR[] buffer = new TCHAR[nSize];
		int result = _GetProfileString(.StrToTCHARz(lpAppName),
				.StrToTCHARz(lpKeyName), .StrToTCHARz(lpDefault), buffer.ptr, nSize);
		lpReturnedString = .TCHARzToStr(buffer.ptr);
		return result;
	}

	static String GetWindowText(HWND hwnd) {
		assert(hwnd);
		int len = GetWindowTextLength(hwnd);
		if (len > 0) {
			TCHAR[] buffer = new TCHAR[len + 1];
			len = _GetWindowText(hwnd, buffer.ptr, cast(int) /*64bit*/ buffer.length);
			return .TCHARzToStr(buffer.ptr, len);
		}
		return "";
	}

	// Note: nMaxCount including the NULL character
	static int GetWindowText(HWND hWnd, TCHAR* lpString, int nMaxCount) {
		return _GetWindowText(hWnd, lpString, nMaxCount);
	}

	// <Shawn Liu> added this method, copied from ATL : atlwin.h
	static int CenterWindow(HWND m_hWnd, HWND hWndCenter = null) {
		assert(m_hWnd);

		// determine owner window to center against
		uint dwStyle = OS.GetWindowLong(m_hWnd, OS.GWL_STYLE);
		if (hWndCenter is null) {
			if (dwStyle & OS.WS_CHILD)
				hWndCenter = OS.GetParent(m_hWnd);
			else
				hWndCenter = OS.GetWindow(m_hWnd, OS.GW_OWNER);
		}

		// get coordinates of the window relative to its parent
		RECT rcDlg;
		OS.GetWindowRect(m_hWnd, &rcDlg);
		RECT rcArea;
		RECT rcCenter;
		HWND hWndParent;
		if (!(dwStyle & OS.WS_CHILD)) {
			// don't center against invisible or minimized DWTWINAPI
			if (hWndCenter !is null) {
				uint dwStyleCenter = OS.GetWindowLong(hWndCenter, OS.GWL_STYLE);
				if (!(dwStyleCenter & OS.WS_VISIBLE) || (dwStyleCenter & OS.WS_MINIMIZE))
					hWndCenter = null;
			}

			// center within screen coordinates
			OS.SystemParametersInfo(OS.SPI_GETWORKAREA, 0, &rcArea, 0);
			if (hWndCenter is null)
				rcCenter = rcArea;
			else
				OS.GetWindowRect(hWndCenter, &rcCenter);
		}
		else {
			// center within parent client coordinates
			hWndParent = OS.GetParent(m_hWnd);
			assert(OS.IsWindow(hWndParent));

			OS.GetClientRect(hWndParent, &rcArea);
			assert(OS.IsWindow(hWndCenter));
			OS.GetClientRect(hWndCenter, &rcCenter);
			OS.MapWindowPoints(hWndCenter, hWndParent, cast(POINT*)&rcCenter, 2);
		}

		int DlgWidth = rcDlg.right - rcDlg.left;
		int DlgHeight = rcDlg.bottom - rcDlg.top;

		// find dialog's upper left based on rcCenter
		int xLeft = (rcCenter.left + rcCenter.right) / 2 - DlgWidth / 2;
		int yTop = (rcCenter.top + rcCenter.bottom) / 2 - DlgHeight / 2;

		// if the dialog is outside the screen, move it inside
		if (xLeft < rcArea.left)
			xLeft = rcArea.left;
		else if (xLeft + DlgWidth > rcArea.right)
			xLeft = rcArea.right - DlgWidth;

		if (yTop < rcArea.top)
			yTop = rcArea.top;
		else if (yTop + DlgHeight > rcArea.bottom)
			yTop = rcArea.bottom - DlgHeight;

		// map screen coordinates to child coordinates
		return OS.SetWindowPos(m_hWnd, null, xLeft, yTop, -1, -1,
				OS.SWP_NOSIZE | OS.SWP_NOZORDER | OS.SWP_NOACTIVATE);
	}

	alias OleInitialize = DWTWINAPI.OleInitialize;
	alias OleUninitialize = DWTWINAPI.OleUninitialize;
	alias CoCreateInstance = DWTWINAPI.CoCreateInstance;

	/**
 * <Shawn Liu>
 * VtbCall partially kept, use VtbCall instead of automation can promote performace
 * and VtbCall doesn't need prototype of interface declaration
 */

	public static int VtblCall(int fnNumber, void* ppVtbl) {
		Function1 fn = cast(Function1)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0) {
		Function2 fn = cast(Function2)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, void* arg0) {
		Function2P fn = cast(Function2P)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1) {
		Function3 fn = cast(Function3)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1, int arg2) {
		Function4 fn = cast(Function4)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1, int arg2, int arg3) {
		Function5 fn = cast(Function5)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1,
			int arg2, int arg3, int arg4) {
		Function6 fn = cast(Function6)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3, arg4);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1,
			int arg2, int arg3, int arg4, int arg5) {
		Function7 fn = cast(Function7)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3, arg4, arg5);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1,
			int arg2, int arg3, int arg4, int arg5, int arg6) {
		Function8 fn = cast(Function8)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3, arg4, arg5, arg6);
	}

	public static int VtblCall(int fnNumber, void* ppVtbl, int arg0, int arg1,
			int arg2, int arg3, int arg4, int arg5, int arg6, int arg7) {
		Function9 fn = cast(Function9)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}

	/// IMLangFontLink2#GetStrCodePages
	public static HRESULT VtblCall(int fnNumber, void* ppVtbl, const wchar* arg0,
			LONG arg1, DWORD arg2, DWORD* arg3, LONG* arg4) {
		auto fn = cast(IMLangFontLink2_GetStrCodePages)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3, arg4);
	}

	alias IMLangFontLink2_GetStrCodePages = HRESULT function(void*,
			const wchar* arg0, LONG arg1, DWORD arg2, DWORD* arg3, LONG* arg4);

	/// IMLangFontLink2#MapFont
	public static HRESULT VtblCall(int fnNumber, void* ppVtbl, HDC arg0,
			DWORD arg1, WCHAR arg2, HFONT* arg3) {
		auto fn = cast(IMLangFontLink2_MapFont)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3);
	}

	alias IMLangFontLink2_MapFont = HRESULT function(void*, HDC arg0,
			DWORD arg1, WCHAR arg2, HFONT* arg3);

	/// ITfInputProcessorProfiles#GetDefaultLanguageProfile
	public static HRESULT VtblCall(int fnNumber, void* ppVtbl, LANGID arg0,
			byte* arg1, byte* arg2, byte* arg3) {
		auto fn = cast(ITfInputProcessorProfiles_GetDefaultLanguageProfile)(*cast(int**) ppVtbl)[
		fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2, arg3);
	}

	alias ITfInputProcessorProfiles_GetDefaultLanguageProfile = HRESULT function(void*,
			LANGID arg0, byte* arg1, byte* arg2, byte* arg3);

	/// IEnumTfDisplayAttributeInfo#Next
	public static HRESULT VtblCall(int fnNumber, void* ppVtbl, ULONG arg0,
			void** arg1, void* arg2) {
		auto fn = cast(IEnumTfDisplayAttributeInfo_Next)(*cast(int**) ppVtbl)[fnNumber];
		return fn(ppVtbl, arg0, arg1, arg2);
	}

	alias IEnumTfDisplayAttributeInfo_Next = HRESULT function(void*,
			ULONG arg0, void** arg1, void* arg2);

	public static WORD LOWORD(LONG_PTR l) {
		return cast(WORD)(l & 0xFFFF);
	}

	public static WORD HIWORD(LONG_PTR h) {
		return cast(WORD)(h >>> 16);
	}
	//public static bool LPtoDP (HDC hdc, POINT lpPoints, int nCount);
	public static WORD MAKEWORD(int l, int h) {
		return cast(WORD)((h << 16) | (l & 0xFFFF));
	}

	public static LONG MAKELONG(int low, int high) {
		return (low & 0xFFFF) | (high << 16);
	}

	public static WPARAM MAKEWPARAM(int l, int h) {
		return cast(WPARAM) MAKELONG(l, h);
	}

	public static LPARAM MAKELPARAM(int l, int h) {
		return cast(LPARAM) MAKELONG(l, h);
	}

	public static LRESULT MAKELRESULT(int l, int h) {
		return cast(LRESULT) MAKELONG(l, h);
	}

	public static int GET_WHEEL_DELTA_WPARAM(WPARAM wParam) {
		return cast(short) HIWORD(wParam);
	}

	public static int GET_X_LPARAM(LPARAM lp) {
		return cast(short)(lp & 0xFFFF);
	}

	public static int GET_Y_LPARAM(LPARAM lp) {
		return cast(short)(lp >> 16);
	}

	static bool TreeView_GetItemRect(HWND hwnd, HTREEITEM hitem, RECT* prc, bool code) {
		*cast(HTREEITEM*) prc = hitem;
		return cast(bool) SendMessage(hwnd, TVM_GETITEMRECT, code, prc);
	}

	static size_t strlen(PCHAR ptr) {
		version (Tango) {
			return tango.stdc.string.strlen(cast(char*) ptr);
		}
		else { // Phobos
			return core.stdc.string.strlen(cast(char*) ptr);
		}
	}

	static void POINTSTOPOINT(ref POINT pt, INT_PTR pts) {
		pt.x = cast(SHORT) LOWORD(pts);
		pt.y = cast(SHORT) HIWORD(pts);
	}

	alias GetScrollBarInfo = DWTWINAPI.GetScrollBarInfo;
} // END of OS
//-----------------------------------------------------------------------------
// convert UTF-8 to MBCS
alias StrToMBCSs = StrToMBCS;
public CHAR[] StrToMBCS(in char[] sc, uint codepage = 0) {
	CHAR[] ret = cast(CHAR[]) sc;
	try {
		foreach (char c; sc) {
			if (c >= 0x80) {
				CHAR[] result;
				int i;
				auto ws = toWCharArray(sc);
				result.length = OS.WideCharToMultiByte(codepage, 0, ws.ptr,
						cast(int) /*64bit*/ ws.length, null, 0, null, null);
				i = OS.WideCharToMultiByte(codepage, 0, ws.ptr,
						cast(int) /*64bit*/ ws.length, result.ptr,
						cast(int) /*64bit*/ result.length, null, null);
				assert(i == result.length);
				return result;
			}
		}
	}
	catch (Exception e) {
		// do nothing
		ret = null;
	}
	return ret;
}

// convert UTF-8 to MBCSz
public TryConst!(char)* StrToMBCSz(in char[] sc) {
	version (Tango) {
		try {
			if (CodePage.isAscii(sc)) {
				return .toStringz(sc);
			}
			char[] dst;
			dst.length = sc.length;
			return toStringz(tango.sys.win32.CodePage.CodePage.into(sc, dst));
		}
		catch (Exception e) {
			// do nothing
			return "".ptr;
		}

	}
	else { // Phobos
		return std.windows.charset.toMBSz(sc);
	}
}

public String16 StrToWCHARs(uint codepage, in char[] sc, bool terminated = false) {
	return StrToWCHARs(sc, terminated);
}

public String16 StrToWCHARs(in char[] sc, bool terminated = false) {
	String16 ret;
	try {
		ret = toWCharArray(sc);
	}
	catch (Exception e) {
		// do nothing
		ret = "";
	}
	if (terminated) {
		ret ~= "\0";
	}
	return ret;
}

public LPCWSTR StrToWCHARz(uint codepage, in char[] sc, uint* length = null) {
	return StrToWCHARz(sc, length);
}

public LPCWSTR StrToWCHARz(in char[] sc, uint* length = null) {
	return StrToWCHARs(sc, true).ptr;
}

public String MBCSsToStr(in CHAR[] string, uint codepage = 0) {
	return MBCSzToStr(string.ptr, cast(int) /*64bit*/ string.length, codepage);
}

public String MBCSzToStr(in PCHAR pString, int _length = -1, uint codepage = 0) {
	// null terminated string pointer
	if (_length == -1) {
		_length = 0;
		while (*(pString + _length))
			++_length;
	}
	// convert MBCS to UTF-8
	if (_length == 0)
		return null;

	String16 wcs = _mbcszToWs(pString, _length, codepage);

	try {
		return String_valueOf(wcs);
	}
	catch (Throwable) {
		return null;
	}
}

public String WCHARsToStr(in WCHAR[] string) {
	return WCHARzToStr(string.ptr, cast(int) /*64bit*/ string.length);
}

public String WCHARzToStr(in LPCWSTR pString, int _length = -1) {
	if (pString is null) {
		return null;
	}
	// null terminated string pointer
	if (_length == -1) {
		_length = 0;
		while (*(pString + _length))
			++_length;
	}
	if (_length == 0)
		return null;
	// convert wchar* to UTF-8
	auto wcs = pString[0 .. _length];

	try {
		return String_valueOf(wcs);
	}
	catch (Throwable) {
		return null;
	}
}

/**
 * <Shawn> difference between WCHARzToStr(pwstr, -1) :
 * BSTRToStr() internally call WCHARzToStr(pwstr, length) with length set,
 * instead to determine the null ended, this mean BSTRToStr() can get string
 * which has embedded null characters.
 */

version (OLE_COM) {
	// BSTR is aliased to wchar*
	// Note : Free the "bstr" memory if freeTheString is true, default false
	static char[] BSTRToStr( /*BSTR*/ ref wchar* bstr, bool freeTheString = false) {
		if (bstr is null)
			return null;
		int size = (SysStringByteLen(bstr) + 1) / wchar.sizeof;
		char[] result = WCHARzToStr(bstr, size);
		if (freeTheString) {
			// free the string and set ptr to null
			SysFreeString(bstr);
			bstr = null;
		}
		return result;
	}
} // end of OLE_COM

public static String16 _mbcszToWs(in PCHAR pMBCS, int len, uint codepage = 0) {
	wchar[] wbuf;
	// Convert MBCS to unicode
	wbuf.length = OS.MultiByteToWideChar(codepage, 0, pMBCS, len, null, 0);
	int n = OS.MultiByteToWideChar(codepage, 0, pMBCS, len, wbuf.ptr, cast(int) /*64bit*/ wbuf
			.length);
	assert(n == wbuf.length);
	return cast(String16) wbuf;
}

// static methods
public int _tcslen(in TCHAR* pString) {
	int _length = 0;
	while (*(pString + _length))
		++_length;

	return _length;
}

version (ANSI) {
	alias StrToTCHARs = StrToMBCS;
	alias StrToTCHARz = StrToMBCSz;
	alias TCHARzToStr = MBCSzToStr;
	alias TCHARsToStr = MBCSsToStr;
}
else {
	// Unicode
	alias StrToTCHARs = StrToWCHARs;
	alias StrToTCHARz = StrToWCHARz;
	alias TCHARzToStr = WCHARzToStr;
	alias TCHARsToStr = WCHARsToStr;
	alias TCHARzLen = _tcslen;
}

//alias Converter.StrToTCHARs     StrToTCHARs;
//alias Converter.StrToTCHARz     StrToTCHARz;
//alias Converter.TCHARzToStr     TCHARzToStr;
//alias Converter.TCHARsToStr     TCHARsToStr;

TCHAR[] NewTCHARs(uint codepage, size_t len) {
	auto res = new TCHAR[len];
	res[] = '\0';
	return res;
}
