@echo off
@rem set path=C:\Dev\D\dmd.2.072.2\windows\bin;%path%
@rem set path=C:\Dev\D\dmd.2.073.0\windows\bin;%path%
@rem set path=C:\Dev\D\dmd.2.074.0\windows\bin;%path%
set path=C:\Dev\D\dmd.2.075.1\windows\bin;%path%
@echo on

rdmd build.d

@if ERRORLEVEL 1 goto :eof
del *.obj

ls -l lib

goto :eof


C:\Dev\D\Work\dwt_winlib>dmd -v 
DMD32 D Compiler v2.073.2
Copyright (c) 1999-2016 by Digital Mars written by Walter Bright

Documentation: http://dlang.org/
Config file: C:\Dev\D\dmd.2.073.2\windows\bin\sc.ini
Usage:
  dmd [<option>...] <file>...
  dmd [<option>...] -run <file> [<arg>...]

Where:
  <file>           D source file
  <arg>            Argument to pass when running the resulting program

<option>:
  @<cmdfile>       read arguments from cmdfile
  -allinst         generate code for all template instantiations
  -betterC         omit generating some runtime information and helper functions
  -boundscheck=[on|safeonly|off]   bounds checks on, in @safe only, or off
  -c               do not link
  -color           turn colored console output on
  -color=[on|off]  force colored console output on or off
  -conf=<filename> use config file at filename
  -cov             do code coverage analysis
  -cov=<nnn>       require at least nnn% code coverage
  -D               generate documentation
  -Dd<directory>   write documentation file to directory
  -Df<filename>    write documentation file to filename
  -d               silently allow deprecated features
  -dw              show use of deprecated features as warnings (default)
  -de              show use of deprecated features as errors (halt compilation)
  -debug           compile in debug code
  -debug=<level>   compile in debug code <= level
  -debug=<ident>   compile in debug code identified by ident
  -debuglib=<name> set symbolic debug library to name
  -defaultlib=<name>
                   set default library to name
  -deps            print module dependencies (imports/file/version/debug/lib)
  -deps=<filename> write module dependencies to filename (only imports)
  -dip25           implement http://wiki.dlang.org/DIP25 (experimental)
  -dip1000         implement http://wiki.dlang.org/DIP1000 (experimental)
  -g               add symbolic debug info
  -gc              add symbolic debug info, optimize for non D debuggers
  -gs              always emit stack frame
  -gx              add stack stomp code
  -H               generate 'header' file
  -Hd=<directory>  write 'header' file to directory
  -Hf=<filename>   write 'header' file to filename
  --help           print help and exit
  -I=<directory>   look for imports also in directory
  -ignore          ignore unsupported pragmas
  -inline          do function inlining
  -J=<directory>   look for string imports also in directory
  -L=<linkerflag>  pass linkerflag to link
  -lib             generate library rather than object files
  -m32             generate 32 bit code
  -m32mscoff       generate 32 bit code and write MS-COFF object files
  -m64             generate 64 bit code
  -main            add default main() (e.g. for unittesting)
  -man             open web browser on manual page
  -map             generate linker .map file
  -mcpu=<id>       generate instructions for architecture identified by 'id'
  -mcpu=?          list all architecture options 
  -mscrtlib=<name> MS C runtime library to reference from main/WinMain/DllMain
  -mv=<package.module>=<filespec>  use <filespec> as source file for <package.module>
  -noboundscheck   no array bounds checking (deprecated, use -boundscheck=off)
  -O               optimize
  -o-              do not write object file
  -od=<directory>  write object & library files to directory
  -of=<filename>   name output file to filename
  -op              preserve source path for output files
  -profile         profile runtime performance of generated code
  -profile=gc      profile runtime allocations
  -release         compile release version
  -shared          generate shared library (DLL)
  -transition=<id> help with language change identified by 'id'
  -transition=?    list all language changes
  -unittest        compile in unit tests
  -v               verbose
  -vcolumns        print character (column) numbers in diagnostics
  -verrors=<num>   limit the number of error messages (0 means unlimited)
  -verrors=spec    show errors from speculative compiles such as __traits(compiles,...)
  -vgc             list all gc allocations including hidden ones
  -vtls            list all variables going into thread local storage
  --version        print compiler version and exit
  -version=<level> compile in version code >= level
  -version=<ident> compile in version code identified by ident
  -w               warnings as errors (compilation will halt)
  -wi              warnings as messages (compilation will continue)
  -X               generate JSON file
  -Xf=<filename>   write JSON file to filename

