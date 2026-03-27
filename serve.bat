@echo off
echo ============================================
echo   Anime Pitch Review - Local Server
echo ============================================
echo.
echo --- PC ---
echo   http://localhost:8000
echo.
echo --- Smartphone (same WiFi) ---

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
)
set IP=%IP: =%
echo   http://%IP%:8000
echo.
echo Press Ctrl+C to stop.
echo ============================================
echo.

cd /d "%~dp0"
node -e "const h=require('http'),f=require('fs'),p=require('path'),m={'html':'text/html','js':'application/javascript','json':'application/json','svg':'image/svg+xml'};h.createServer((q,r)=>{let u=q.url==='/'?'/index.html':q.url;let fp=p.join(__dirname,u);f.readFile(fp,(e,d)=>{if(e){r.writeHead(404);r.end('Not found');}else{let ext=p.extname(fp).slice(1);r.writeHead(200,{'Content-Type':(m[ext]||'text/plain')+';charset=utf-8'});r.end(d);}});}).listen(8000,()=>console.log('Server running on port 8000'));"
pause
