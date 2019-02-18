@echo off
pushd "%~dp0"

echo -- extract sln, vcxproj for VC

cd grpc_origin

mkdir vsprojects & cd vsprojects
cmake -G "Visual Studio 14 2015"  ..

cmake --build . --config Debug
cmake --build . --config Release

echo -- extract done!

popd
@echo on

