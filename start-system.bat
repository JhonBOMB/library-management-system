@echo off
chcp 65001 >nul
echo ================================================
echo 图书管理系统 - 一键启动脚本
echo ================================================
echo.

cd /d "%~dp0"

echo [步骤 1/5] 检查Docker服务...
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ✗ Docker未运行！请先启动Docker Desktop
    pause
    exit /b 1
)
echo ✓ Docker服务正常

echo.
echo [步骤 2/5] 启动MySQL容器...
docker-compose up -d mysql
if %errorlevel% neq 0 (
    echo ✗ MySQL容器启动失败
    pause
    exit /b 1
)
echo ✓ MySQL容器已启动

echo.
echo [步骤 3/5] 等待MySQL就绪...
timeout /t 10 /nobreak >nul
echo ✓ MySQL应该已经就绪

echo.
echo [步骤 4/5] 启动前端容器...
docker-compose up -d frontend
echo ✓ 前端容器启动中...

echo.
echo [步骤 5/5] 启动后端（本地IDEA）...
echo.
echo ================================================
echo 系统启动配置完成！
echo ================================================
echo.
echo 下一步操作：
echo 1. 在IntelliJ IDEA中运行 RuoYiApplication
echo 2. 等待应用启动完成（看到"若依启动成功"）
echo 3. 访问 http://localhost
echo 4. 使用 admin / admin123456 登录
echo.
echo ================================================
pause
