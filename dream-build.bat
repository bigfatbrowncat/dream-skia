@echo off
set OLD_PATH=%cd%
cd %~dp0

set TARGET_PATH=out\%DREAM_TOOLCHAIN%-static-release
gn gen %TARGET_PATH% --args="is_official_build=true"
ninja -C %TARGET_PATH%

setlocal enableextensions
mkdir ..\prefix
mkdir ..\prefix\lib
mkdir ..\prefix\include
mkdir ..\prefix\include\skia
mkdir ..\prefix\include\skia\include
mkdir ..\prefix\include\skia\modules
mkdir ..\prefix\include\skia\modules\particles
mkdir ..\prefix\include\skia\modules\particles\include
mkdir ..\prefix\include\skia\modules\skcms
mkdir ..\prefix\include\skia\modules\skottie
mkdir ..\prefix\include\skia\modules\skottie\include
mkdir ..\prefix\include\skia\modules\skparagraph
mkdir ..\prefix\include\skia\modules\skparagraph\include
mkdir ..\prefix\include\skia\modules\skplaintexteditor
mkdir ..\prefix\include\skia\modules\skplaintexteditor\include
mkdir ..\prefix\include\skia\modules\skresources
mkdir ..\prefix\include\skia\modules\skresources\include
mkdir ..\prefix\include\skia\modules\sksg
mkdir ..\prefix\include\skia\modules\sksg\include
mkdir ..\prefix\include\skia\modules\skshaper
mkdir ..\prefix\include\skia\modules\skshaper\include
mkdir ..\prefix\include\skia\modules\skunicode
mkdir ..\prefix\include\skia\modules\skunicode\include
mkdir ..\prefix\include\skia\modules\svg
mkdir ..\prefix\include\skia\modules\svg\include

mkdir ..\prefix\include\skia\src\core
endlocal

copy %TARGET_PATH%\*.a ..\prefix\lib\

python dream-copy-headers-to-prefix.py . ../prefix/include/skia

cd %OLD_PATH%
