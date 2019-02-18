@echo off
pushd "%~dp0"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::[STEP 01] copy grpc_include
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo -- [STEP 01] copy grpc_include

set SOURCE_INCLUDE=.\grpc_origin\include
set SOURCE_INCLUDE_PROTOBUF=.\grpc_origin\third_party\protobuf\src

set DEST_INCLUDE=.\dest\grpc\include
set DEST_INCLUDE_PROTOBUF=.\dest\grpc\include\third_party\protobuf\src

mkdir %DEST_INCLUDE% & mkdir %DEST_INCLUDE_PROTOBUF%

robocopy %SOURCE_INCLUDE% %DEST_INCLUDE% /x /njh /np /XO /tee /DCOPY:T /S /XD ".git" ".vscode" ".github"
robocopy %SOURCE_INCLUDE_PROTOBUF% %DEST_INCLUDE_PROTOBUF% /x /njh /np /XO /tee /DCOPY:T /S /XD ".git" ".vscode" ".github"

echo -- [STEP 01] done

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::[STEP 02] copy grpc_lib
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo -- [STEP 02] copy grpc_lib

::::::::::::::::::::::::::::
::::copy grpc_version.txt 
::::::::::::::::::::::::::::
set SOURCE_VERSION_TXT=.\grpc_origin\grpc_version.txt
set DEST_PATH=.\dest\

xcopy /y %SOURCE_VERSION_TXT% %DEST_PATH% 


::::::::::::::::::::::::::::
::::copy binary
::::::::::::::::::::::::::::
set SOURCE_LIB=.\grpc_origin\vsprojects
set DEST_LIB=.\dest\grpc\lib

::debug
set SOURCE_LIB_WIN32_DEBUG=%SOURCE_LIB%\Debug
set DEST_LIB_WIN32_DEBUG=%DEST_LIB%\Win32\Debug


mkdir %DEST_LIB_WIN32_DEBUG%

xcopy /y %SOURCE_LIB_WIN32_DEBUG%\address_sorting.lib %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\gpr.lib %DEST_LIB_WIN32_DEBUG%
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\gpr.pdb %DEST_LIB_WIN32_DEBUG%  
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\grpc.lib %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\grpc.pdb %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\grpc++.lib %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_WIN32_DEBUG%\grpc++.pdb %DEST_LIB_WIN32_DEBUG% 


set SOURCE_LIB_THIRDPARTY=%SOURCE_LIB%\third_party

xcopy /y %SOURCE_LIB_THIRDPARTY%\protobuf\debug\libprotobufd.lib %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_THIRDPARTY%\zlib\debug\zlibstaticd.lib %DEST_LIB_WIN32_DEBUG% 
xcopy /y %SOURCE_LIB_THIRDPARTY%\cares\cares\lib\debug\cares.lib %DEST_LIB_WIN32_DEBUG% 


::release
set SOURCE_LIB_WIN32_RELEASE=%SOURCE_LIB%\Release
set DEST_LIB_WIN32_RELEASE=%DEST_LIB%\Win32\Release


mkdir %DEST_LIB_WIN32_RELEASE%

xcopy /y %SOURCE_LIB_WIN32_RELEASE%\address_sorting.lib %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\gpr.lib %DEST_LIB_WIN32_RELEASE%
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\gpr.pdb %DEST_LIB_WIN32_RELEASE%  
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\grpc.lib %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\grpc.pdb %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\grpc++.lib %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_WIN32_RELEASE%\grpc++.pdb %DEST_LIB_WIN32_RELEASE% 


set SOURCE_LIB_THIRDPARTY=%SOURCE_LIB%\third_party

xcopy /y %SOURCE_LIB_THIRDPARTY%\protobuf\release\libprotobuf.lib %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_THIRDPARTY%\zlib\release\zlibstatic.lib %DEST_LIB_WIN32_RELEASE% 
xcopy /y %SOURCE_LIB_THIRDPARTY%\cares\cares\lib\release\cares.lib %DEST_LIB_WIN32_RELEASE% 

echo -- [STEP 02] done

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::[STEP 03] copy grpc_util
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo -- [STEP 03] copy grpc_util

set SOURCE_UTIL=.\grpc_origin\vsprojects
set DEST_UTIL=.\dest\grpc_util

mkdir %DEST_UTIL%

xcopy /y %SOURCE_UTIL%\Release\grpc_cpp_plugin.exe %DEST_UTIL% 
xcopy /y %SOURCE_UTIL%\third_party\protobuf\Release\protoc.exe %DEST_UTIL% 

echo -- [STEP 03] done

popd
@echo on

