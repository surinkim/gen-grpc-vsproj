@echo off

pushd "%~dp0"

IF "%1" == "" (
    echo "Input Error! - Please, input tag version. For example,""
    echo ".\AllInOne.bat <tag_version>"

    GOTO END    
)

set TAG_VERSION=%1

set /P AREYOUSURE=Tag:[%TAG_VERSION%] Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo [ 01_clone.bat ]
call .\01_clone.bat %TAG_VERSION%

echo [ 02_build.bat ]
call .\02_build.bat

echo [ 03_copy.bat ]
call .\03_copy.bat

:END
popd
@echo on

