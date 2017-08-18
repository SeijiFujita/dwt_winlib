rem used cvtres.exe
path=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64;%path%

dmd --version

dmd -ofdwt32_normal.exe   src\dwt_base02.d src\debuglog.d @dwtlib_normal.txt
@if ERRORLEVEL 1 goto :eof

dmd -ofdwt32_debug.exe    src\dwt_base02.d src\debuglog.d @dwtlib_debug.txt
@if ERRORLEVEL 1 goto :eof

dmd -ofdwt32_optimize.exe src\dwt_base02.d src\debuglog.d @dwtlib_optimize.txt
@if ERRORLEVEL 1 goto :eof

dmd -ofdwt64_normal.exe   src\dwt_base02.d src\debuglog.d @dwtlib64_normal.txt
@if ERRORLEVEL 1 goto :eof

dmd -ofdwt64_debug.exe    src\dwt_base02.d src\debuglog.d @dwtlib64_debug.txt
@if ERRORLEVEL 1 goto :eof

dmd -ofdwt64_optimize.exe src\dwt_base02.d src\debuglog.d @dwtlib64_optimize.txt
@if ERRORLEVEL 1 goto :eof



@if ERRORLEVEL 1 goto :eof
del *.obj
del *.exp
del *.lib
del *.ilk
del *.pdb

echo done...
goto :eof
-----------------------------------
