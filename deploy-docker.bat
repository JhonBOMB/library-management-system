@echo off
chcp 65001 >nul
echo ================================================
echo 图书管理系统 - Docker一键部署
echo ================================================
echo.

cd /d "%~dp0"

echo [1/3] 检查Docker服务...
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ✗ Docker未运行！请先启动Docker Desktop
    pause
    exit /b 1
)
echo ✓ Docker服务正常

echo.

echo [2/3] 停止并删除旧容器...

echo.
echo [2/3] 停止并删除旧容器...
docker-compose down
echo ✓ 清理完成

echo.
echo [3/3] 启动所有服务...
docker-compose up -d --build
if %errorlevel% neq 0 (
    echo ✗ 启动失败
    pause
    exit /b 1
)

echo.
echo ================================================
echo 部署成功！正在启动服务...
echo ================================================
echo.
echo 请等待约30秒让所有服务完全启动
echo 然后访问: http://localhost
echo 登录账号: admin / admin123456
echo.
echo 查看日志: docker-compose logs -f backend
echo 停止服务: docker-compose down
echo.
pause
