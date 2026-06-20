@echo off
rem ===== Driving in the USA : ローカル起動用 (Windows) =====
rem このファイルを index.html と同じフォルダに置いてダブルクリック。
rem Python か Node.js のどちらかが入っていれば動きます。

cd /d "%~dp0"
set PORT=8000

echo.
echo  http://localhost:%PORT%/  でローカルサーバを起動します...
echo  終了するにはこのウィンドウを閉じてください。
echo.

rem --- Python (python) ---
where python >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:%PORT%/
  python -m http.server %PORT%
  goto :eof
)

rem --- Python (py ランチャー) ---
where py >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:%PORT%/
  py -m http.server %PORT%
  goto :eof
)

rem --- Node.js ---
where node >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:%PORT%/
  npx --yes http-server -p %PORT% -c-1
  goto :eof
)

echo.
echo  [エラー] Python も Node.js も見つかりませんでした。
echo  どちらかをインストールしてください:
echo    - Python : https://www.python.org/downloads/  (インストール時 "Add to PATH" にチェック)
echo    - Node.js: https://nodejs.org/
echo.
pause
