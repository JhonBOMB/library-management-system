# 图书管理系统 - Docker部署指南

## 🚀 一键启动项目

### 前提条件

只需要安装 **Docker Desktop**：
- 下载地址：https://www.docker.com/products/docker-desktop
- Windows版本选择：Docker Desktop for Windows
- 安装后重启电脑

### 启动步骤（超简单！）

#### 1. 打开终端

在项目根目录打开PowerShell或命令提示符：
```bash
cd C:\Users\jion\OneDrive\桌面\作业\New\library-management-system
```

#### 2. 一键启动（首次需要15-20分钟）

```bash
docker-compose up -d
```

**就这么简单！** Docker会自动：
- ✅ 下载MySQL镜像
- ✅ 创建数据库并导入数据
- ✅ 编译后端Java代码
- ✅ 构建前端Vue项目
- ✅ 启动所有服务

#### 3. 等待启动完成

查看启动进度：
```bash
docker-compose logs -f
```

看到这些说明启动成功：
```
library-backend  | 若依启动成功
library-frontend | Configuration complete; ready for start up
library-mysql    | ready for connections
```

按 `Ctrl+C` 退出日志查看。

#### 4. 访问系统

打开浏览器访问：**http://localhost**

登录：
- 用户名：admin
- 密码：admin123

**就这样！您的图书管理系统已经运行了！**

---

## 📊 查看运行状态

```bash
# 查看所有容器状态
docker-compose ps

# 应该看到3个容器都是Up状态：
# library-mysql     Up      3306->3306
# library-backend   Up      8080->8080
# library-frontend  Up      80->80
```

---

## 🛠️ 常用命令

### 停止服务
```bash
docker-compose stop
```

### 重新启动
```bash
docker-compose start
```

### 完全关闭并删除容器
```bash
docker-compose down
```

### 查看后端日志
```bash
docker-compose logs -f backend
```

### 查看前端日志
```bash
docker-compose logs -f frontend
```

### 查看MySQL日志
```bash
docker-compose logs -f mysql
```

### 重新构建并启动（代码修改后）
```bash
docker-compose up -d --build
```

---

## 🎯 访问地址

| 服务 | 地址 | 说明 |
|------|------|------|
| 前端系统 | http://localhost | Vue3前端界面 |
| 后端API | http://localhost:8080 | Spring Boot API |
| Swagger文档 | http://localhost:8080/swagger-ui.html | API文档 |
| MySQL | localhost:3306 | 数据库（root/root） |

---

## 📁 Docker配置文件说明

### docker-compose.yml
整合所有服务的配置文件，定义了3个服务：
- **mysql**: MySQL 8.0数据库
- **backend**: Spring Boot后端服务
- **frontend**: Nginx + Vue3前端服务

### ruoyi-backend/Dockerfile
后端构建配置：
- 使用Maven编译Java代码
- 多阶段构建优化镜像大小
- 最终镜像只包含JRE和jar包

### ruoyi-ui/Dockerfile
前端构建配置：
- 使用Node.js构建Vue项目
- 使用Nginx部署静态文件
- 配置API代理

---

## 💡 优势

### vs 传统安装方式

| 传统方式 | Docker方式 |
|---------|-----------|
| 需要安装JDK | ❌ 不需要 |
| 需要安装Maven | ❌ 不需要 |
| 需要安装Node.js | ❌ 不需要 |
| 需要安装MySQL | ❌ 不需要 |
| 需要配置环境变量 | ❌ 不需要 |
| 手动导入数据库 | ✅ 自动导入 |
| 分别启动各服务 | ✅ 一键启动 |
| **总时间：1-2小时** | **总时间：5分钟** |

### 其他优势

- ✅ **环境一致性**: 在任何机器上都能运行
- ✅ **一键启动**: 无需手动配置
- ✅ **自动化**: 数据库自动初始化
- ✅ **隔离性**: 不影响本机环境
- ✅ **易于清理**: 删除容器即可

---

## 🔧 故障排除

### 问题1: 端口被占用

**错误**：`port is already allocated`

**解决**：修改 `docker-compose.yml` 中的端口映射
```yaml
frontend:
  ports:
    - "8080:80"  # 改为其他端口，如8080
```

### 问题2: Docker启动失败

**错误**：`Cannot connect to the Docker daemon`

**解决**：
1. 确保Docker Desktop已启动
2. 右键点击任务栏Docker图标，选择"Switch to Linux containers"

### 问题3: 首次启动慢

**原因**：需要下载镜像和编译代码

**解决**：耐心等待，后续启动会很快（只需10秒）

### 问题4: MySQL初始化失败

**解决**：
```bash
# 删除volume重新初始化
docker-compose down -v
docker-compose up -d
```

---

## 📝 数据持久化

MySQL数据存储在Docker volume中，即使删除容器，数据也不会丢失。

**查看数据卷**：
```bash
docker volume ls
```

**删除数据（重新初始化）**：
```bash
docker-compose down -v
```

---

## 🎨 开发模式

如果需要修改代码并实时查看效果：

### 后端热更新
```bash
# 修改代码后重新构建
docker-compose up -d --build backend
```

### 前端热更新
推荐本地运行前端（修改更快）：
```bash
cd ruoyi-ui
npm install
npm run dev
```
然后访问 http://localhost:5173

---

## 📦 生产部署

### 构建生产镜像
```bash
docker-compose build
```

### 推送到镜像仓库（可选）
```bash
docker tag library-backend:latest your-registry/library-backend:v1.0
docker push your-registry/library-backend:v1.0
```

### 在服务器部署
```bash
# 复制docker-compose.yml和sql文件到服务器
scp docker-compose.yml user@server:/path/
scp -r sql user@server:/path/

# SSH到服务器
ssh user@server

# 启动
cd /path
docker-compose up -d
```

---

## ✅ 验证部署

### 1. 检查容器状态
```bash
docker-compose ps
```
所有容器应该是 `Up` 状态

### 2. 检查后端健康
```bash
curl http://localhost:8080/
```
应该返回 HTML 内容

### 3. 检查前端
打开浏览器访问 http://localhost
应该看到登录页面

### 4. 登录测试
- 用户名：admin
- 密码：admin123

### 5. 测试图书功能
点击"图书管理"→"图书信息"
应该看到5本示例图书

---

## 🎉 总结

使用Docker部署图书管理系统：

**启动步骤**：
1. 安装Docker Desktop（一次性）
2. 运行 `docker-compose up -d`（5分钟）
3. 访问 http://localhost

**就这么简单！**

无需配置Java、Maven、Node.js、MySQL等环境！

---

## 📞 技术支持

遇到问题？
1. 查看日志：`docker-compose logs -f`
2. 重启服务：`docker-compose restart`
3. 重新构建：`docker-compose up -d --build`

**Docker让部署变得如此简单！** 🎊
