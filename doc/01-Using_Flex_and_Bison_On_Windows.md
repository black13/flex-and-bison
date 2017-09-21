# Using Flex and Bison on Windows

## Prerequisites

1. Install MSVC compiler, for example Visual Studio Community 2015.
2. Install CMake, a crossplatform build system.
3. Download Flex and Bison for Windows from [Win flex-bison](http://sourceforge.net/projects/winflexbison/) project. Note that old versions of flex and bison from [GNUWin32](http://sourceforge.net/projects/gnuwin32/) are not compatible.
4. Add unistd.h to Windows include path, for example C:\Program Files\Microsoft Visual Studio 14.0\VC\include.

## Building Examples

Before building examples, set envrioment variables by running:
```
vcvars32.bat
```

Use cmake to generate nmake makefiles, then nmake:
```
mkdir build
cd build
cmake .. -G "NMake Makefiles"
nmake
```

## References

[Using flex and bison in MSVC++](http://www.di-mgt.com.au/flex_and_bison_in_msvc.html)
