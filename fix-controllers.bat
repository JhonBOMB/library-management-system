@echo off
chcp 65001 >nul
echo ================================================
echo 图书管理系统 - Controller编译修复脚本
echo ================================================
echo.

cd /d "%~dp0"
cd ruoyi-backend\ruoyi-library

echo [1/3] 清理旧的编译文件...
if exist target\classes\com\ruoyi\library\controller (
    del /f /q target\classes\com\ruoyi\library\controller\*.class 2>nul
)

echo [2/3] 手动编译Controller文件...
javac -encoding UTF-8 ^
  -cp "..\..\ruoyi-admin\target\classes;%USERPROFILE%\.m2\repository\org\springframework\boot\spring-boot-starter-web\*\*.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-web\*\*.jar;%USERPROFILE%\.m2\repository\org\springframework\spring-context\*\*.jar" ^
  -d target\classes ^
  src\main\java\com\ruoyi\library\controller\LibCategoryController.java ^
  src\main\java\com\ruoyi\library\controller\LibReaderController.java

if %errorlevel% neq 0 (
    echo.
    echo [错误] 编译失败！
    echo 请在IntelliJ IDEA中执行：
    echo 1. 右键点击 ruoyi-library 模块
    echo 2. 选择 "Rebuild Module 'ruoyi-library'"
    echo 3. 等待编译完成后重启应用
    pause
    exit /b 1
)

echo [3/3] 验证编译结果...
if exist target\classes\com\ruoyi\library\controller\LibCategoryController.class (
    echo ✓ LibCategoryController.class 已生成
) else (
    echo ✗ LibCategoryController.class 未找到
)

if exist target\classes\com\ruoyi\library\controller\LibReaderController.class (
    echo ✓ LibReaderController.class 已生成
) else (
    echo ✗ LibReaderController.class 未找到
)

echo.
echo ================================================
echo 修复完成！请执行以下步骤：
echo ================================================
echo 1. 在IntelliJ IDEA中停止运行的应用
echo 2. 重新运行 RuoYiApplication
echo 3. 等待启动完成
echo 4. 刷新浏览器 (Ctrl+F5)
echo 5. 重新登录并测试
echo ================================================
pause
