@echo off

pushd "%~dp0"

IF "%1" == "" (
    echo "Input Error! - Please, input tag version. For example,""
    echo ".\01_clone.bat <tag_version>"

    GOTO END
)

set TAG_VERSION=%1

echo -- grpc clone
call git clone https://github.com/grpc/grpc.git grpc_origin

cd grpc_origin
call git submodule update --init

echo -- git checkout specific tag - %TAG_VERSION%
call git checkout tags/%TAG_VERSION% -b %TAG_VERSION% 

echo %TAG_VERSION% > grpc_version.txt

echo -- grpc clone done!

popd
@echo on

