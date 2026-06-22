@echo on

mkdir builddir

%PYTHON% -m build --wheel ^
         --no-isolation --skip-dependency-check -Cbuilddir=builddir -Ccompile-args=-v
if %ERRORLEVEL% NEQ 0 (type builddir\meson-logs\meson-log.txt && exit 1)

%PYTHON% -m pip install --find-links dist uarray
if %ERRORLEVEL% NEQ 0 exit 1
