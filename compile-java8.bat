@echo off
chcp 65001 >nul
echo ================================================
echo 图书管理系统 - Maven编译脚本（强制Java 8）
echo ================================================
echo.

cd /d "%~dp0ruoyi-backend"

echo [1/3] 清理旧的编译文件...
call mvn clean -q
if %errorlevel% neq 0 (
    echo ✗ 清理失败
    pause
    exit /b 1
)
echo ✓ 清理完成

echo.
echo [2/3] 编译项目（强制Java 8）...
call mvn compile -DskipTests -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8 -Dmaven.compiler.release=8
if %errorlevel% neq 0 (
    echo ✗ 编译失败！请查看上面的错误信息
    pause
    exit /b 1
)
echo ✓ 编译成功

echo.
echo [3/3] 打包项目...
call mvn package -DskipTests -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8
if %errorlevel% neq 0 (
    echo ✗ 打包失败
    pause
    exit /b 1
)
echo ✓ 打包成功

echo.
echo ================================================
echo 编译完成！
echo ================================================
echo.
echo 下一步：
echo 1. 在IntelliJ IDEA中停止当前运行的应用
echo 2. 重新运行 RuoYiApplication
echo 3. 等待启动完成
echo 4. 刷新浏览器测试
echo.
pause
