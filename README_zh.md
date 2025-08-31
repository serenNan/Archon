<p align="center">
  <img src="./archon-ui-main/public/archon-main-graphic.png" alt="Archon 主要图形" width="853" height="422">
</p>

<p align="center">
  <em>通过自定义知识库和任务管理，为您的AI编程助手提供强大的MCP服务器支持</em>
</p>

<p align="center">
  <a href="#快速开始">快速开始</a> •
  <a href="#升级指南">升级指南</a> •
  <a href="#功能特性">功能特性</a> •
  <a href="#架构说明">架构说明</a> •
  <a href="#故障排除">故障排除</a>
</p>

---

## 🎯 Archon 是什么？

> Archon 目前处于测试阶段！可能会遇到一些问题，欢迎分享反馈并贡献修复/新功能！感谢大家对 Archon 的热情支持，以及提供的错误报告、PR 和讨论。虽然我们的小团队需要处理很多事情，但我们致力于解决所有问题，将 Archon 打造成最好的工具！

Archon 是 AI 编程助手的**指挥中心**。对您而言，它是一个优雅的界面，用于管理项目的知识、上下文和任务。对 AI 编程助手而言，它是一个**模型上下文协议（MCP）服务器**，可以协作并利用相同的知识、上下文和任务。连接 Claude Code、Kiro、Cursor、Windsurf 等，为您的 AI 助手提供：

- **您的文档资料**（网站爬取、上传的 PDF/文档）
- **智能搜索能力**（使用先进的 RAG 策略）
- **任务管理**（与知识库集成）
- **实时更新**（添加新内容并与编程助手协作任务时）
- **更多功能**即将到来，将 Archon 构建成所有上下文工程的集成环境

这个新版本的 Archon 替代了旧版本（agenteer）。Archon 曾经是构建其他智能体的 AI 智能体，现在您可以使用 Archon 做这些以及更多事情。

> 无论您在构建什么，无论是新的还是现有的代码库 - Archon 的知识和任务管理能力都会提升**任何** AI 驱动编程的输出质量。

## 🔗 重要链接

- **[GitHub 讨论区](https://github.com/coleam00/Archon/discussions)** - 加入对话，分享关于 Archon 的想法
- **[贡献指南](CONTRIBUTING.md)** - 如何参与并为 Archon 做贡献
- **[介绍视频](https://youtu.be/8pRc_s2VQIo)** - 入门指南和 Archon 愿景
- **[Archon 看板](https://github.com/users/coleam00/projects/1)** - 维护者管理问题/功能的地方
- **[Dynamous AI 精通](https://dynamous.ai)** - Archon 的诞生地 - 加入充满活力的早期 AI 采用者社区，互相帮助转型职业和业务！

## 快速开始

### 前置要求

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Node.js 18+](https://nodejs.org/) （用于混合开发模式）
- [Supabase](https://supabase.com/) 账户（免费层或本地 Supabase 都可以）
- [OpenAI API 密钥](https://platform.openai.com/api-keys) （也支持 Gemini 和 Ollama！）
- （可选）[Make](https://www.gnu.org/software/make/) （见下方[安装 Make](#安装-make)）

### 安装说明

1. **克隆仓库**：
   ```bash
   git clone https://github.com/coleam00/archon.git
   ```
   ```bash
   cd archon
   ```
2. **环境配置**：

   ```bash
   cp .env.example .env
   # 编辑 .env 并添加您的 Supabase 凭证：
   # SUPABASE_URL=https://your-project.supabase.co
   # SUPABASE_SERVICE_KEY=your-service-key-here
   ```

   **重要注意事项**：
   - 对于云端 Supabase：他们最近引入了新类型的服务角色密钥，但请使用传统密钥（较长的那个）。
   - 对于本地 Supabase：将 SUPABASE_URL 设置为 http://host.docker.internal:8000 （除非您设置了 IP 地址）。

3. **数据库设置**：在您的 [Supabase 项目](https://supabase.com/dashboard) SQL 编辑器中，复制、粘贴并执行 `migration/complete_setup.sql` 的内容

4. **启动服务**（选择其一）：

   **完整 Docker 模式（推荐用于正常的 Archon 使用）**

   ```bash
   docker compose up --build -d
   ```

   这将在 Docker 中启动所有核心微服务：
   - **Server**：核心 API 和业务逻辑（端口：8181）
   - **MCP Server**：AI 客户端的协议接口（端口：8051）
   - **UI**：Web 界面（端口：3737）

   端口也可以在您的 .env 中配置！

5. **配置 API 密钥**：
   - 打开 http://localhost:3737
   - 您将自动进入引导流程来设置 API 密钥（默认是 OpenAI）

## ⚡ 快速测试

一切运行后：

1. **测试网站爬取**：访问 http://localhost:3737 → 知识库 → "爬取网站" → 输入文档 URL（如 https://ai.pydantic.dev/llms-full.txt）
2. **测试文档上传**：知识库 → 上传 PDF
3. **测试项目**：项目 → 创建新项目并添加任务
4. **与您的 AI 编程助手集成**：MCP 仪表板 → 为您的 AI 编程助手复制连接配置

## 安装 Make

<details>
<summary><strong>🛠️ Make 安装（可选 - 用于开发工作流）</strong></summary>

### Windows

```bash
# 选项 1：使用 Chocolatey
choco install make

# 选项 2：使用 Scoop
scoop install make

# 选项 3：使用 WSL2
wsl --install
# 然后在 WSL 中：sudo apt-get install make
```

### macOS

```bash
# Make 在 macOS 上预装
# 如需要：brew install make
```

### Linux

```bash
# Debian/Ubuntu
sudo apt-get install make

# RHEL/CentOS/Fedora
sudo yum install make
```

</details>

<details>
<summary><strong>🚀 Make 快速命令参考</strong></summary>
<br/>

| 命令              | 描述                                    |
| ----------------- | -------------------------------------- |
| `make dev`        | 启动混合开发（后端 Docker，前端本地）⭐ |
| `make dev-docker` | 全部在 Docker 中                        |
| `make stop`       | 停止所有服务                            |
| `make test`       | 运行所有测试                            |
| `make lint`       | 运行代码检查                            |
| `make install`    | 安装依赖                               |
| `make check`      | 检查环境设置                            |
| `make clean`      | 删除容器和卷（需确认）                   |

</details>

## 🔄 数据库重置（如需重新开始）

如果您需要完全重置数据库并重新开始：

<details>
<summary>⚠️ <strong>重置数据库 - 这将删除 Archon 的所有数据！</strong></summary>

1. **运行重置脚本**：在您的 Supabase SQL 编辑器中，运行 `migration/RESET_DB.sql` 的内容

   ⚠️ 警告：这将删除所有 Archon 特定的表和数据！但不会触及数据库中的其他内容。

2. **重建数据库**：重置后，运行 `migration/complete_setup.sql` 重新创建所有表。

3. **重启服务**：

   ```bash
   docker compose --profile full up -d
   ```

4. **重新配置**：
   - 重新选择您的 LLM/嵌入提供商并设置 API 密钥
   - 重新上传任何文档或重新爬取网站

重置脚本会安全地删除所有表、函数、触发器和策略，并正确处理依赖关系。

</details>

## 📚 文档说明

### 核心服务

| 服务               | 容器名称      | 默认 URL                  | 用途                      |
| ------------------ | ------------- | ------------------------- | ------------------------- |
| **Web 界面**       | archon-ui     | http://localhost:3737     | 主要仪表板和控制          |
| **API 服务**       | archon-server | http://localhost:8181     | 网站爬取、文档处理        |
| **MCP 服务器**     | archon-mcp    | http://localhost:8051     | 模型上下文协议接口        |
| **智能体服务**     | archon-agents | http://localhost:8052     | AI/ML 操作、重排序        |

## 升级指南

将 Archon 升级到最新版本：

1. **拉取最新更改**：
   ```bash
   git pull
   ```

2. **检查迁移**：查看 `migration/` 文件夹中是否有比您上次更新更新的 SQL 文件。检查文件创建日期来确定是否需要运行它们。您可以像首次设置 Archon 时一样在 SQL 编辑器中运行这些文件。我们也在努力让这些迁移处理变得自动化！

3. **重新构建并重启**：
   ```bash
   docker compose up -d --build
   ```

这与初始设置使用的命令相同 - 它会用最新代码重新构建容器并重启服务。

## 功能特性

### 🧠 知识管理

- **智能网站爬取**：自动检测并爬取整个文档站点、站点地图和单个页面
- **文档处理**：上传和处理 PDF、Word 文档、markdown 文件和文本文档，具有智能分块功能
- **代码示例提取**：自动识别并索引文档中的代码示例以增强搜索
- **向量搜索**：使用上下文嵌入进行高级语义搜索，实现精确的知识检索
- **源管理**：按来源、类型和标签组织知识，便于过滤

### 🤖 AI 集成

- **模型上下文协议（MCP）**：连接任何 MCP 兼容客户端（Claude Code、Cursor，甚至非 AI 编程助手如 Claude Desktop）
- **MCP 工具**：用于 RAG 查询、任务管理和项目操作的全面而简单的工具集
- **多 LLM 支持**：支持 OpenAI、Ollama 和 Google Gemini 模型
- **RAG 策略**：混合搜索、上下文嵌入和结果重排序，提供最佳的 AI 响应
- **实时流式传输**：AI 智能体的实时响应和进度跟踪

### 📋 项目和任务管理

- **分层项目**：在结构化工作流中通过项目、功能和任务组织工作
- **AI 辅助创建**：使用集成的 AI 智能体生成项目需求和任务
- **文档管理**：具有协作编辑功能的版本控制文档
- **进度跟踪**：所有项目活动的实时更新和状态管理

### 🔄 实时协作

- **WebSocket 更新**：爬取、处理和 AI 操作的实时进度跟踪
- **多用户支持**：协作式知识构建和项目管理
- **后台处理**：不阻塞用户界面的异步操作
- **健康监控**：内置服务健康检查和自动重连

## 架构说明

### 微服务架构

Archon 使用真正的微服务架构，职责分离清晰：

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   前端 UI       │    │  服务器 (API)   │    │   MCP 服务器    │    │  智能体服务     │
│                 │    │                 │    │                 │    │                 │
│  React + Vite   │◄──►│    FastAPI +    │◄──►│    轻量级       │◄──►│   PydanticAI    │
│  端口 3737      │    │    SocketIO     │    │    HTTP 包装器  │    │   端口 8052     │
│                 │    │    端口 8181    │    │    端口 8051    │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘
         │                        │                        │                        │
         └────────────────────────┼────────────────────────┼────────────────────────┘
                                  │                        │
                         ┌─────────────────┐               │
                         │    数据库       │               │
                         │                 │               │
                         │    Supabase     │◄──────────────┘
                         │    PostgreSQL   │
                         │    PGVector     │
                         └─────────────────┘
```

### 服务职责

| 服务           | 位置                 | 用途                        | 主要功能                                          |
| -------------- | -------------------- | --------------------------- | ------------------------------------------------- |
| **前端**       | `archon-ui-main/`    | Web 界面和仪表板            | React、TypeScript、TailwindCSS、Socket.IO 客户端 |
| **服务器**     | `python/src/server/` | 核心业务逻辑和 API          | FastAPI、服务层、Socket.IO 广播、所有 ML/AI 操作 |
| **MCP 服务器** | `python/src/mcp/`    | MCP 协议接口                | 轻量级 HTTP 包装器、MCP 工具、会话管理            |
| **智能体**     | `python/src/agents/` | PydanticAI 智能体托管       | 文档和 RAG 智能体、流式响应                       |

### 通信模式

- **基于 HTTP**：所有服务间通信使用 HTTP API
- **Socket.IO**：从服务器到前端的实时更新
- **MCP 协议**：AI 客户端通过 SSE 或 stdio 连接到 MCP 服务器
- **无直接导入**：服务真正独立，无共享代码依赖

### 关键架构优势

- **轻量级容器**：每个服务仅包含必需的依赖项
- **独立扩展**：服务可根据负载独立扩展
- **开发灵活性**：团队可在不同服务上工作而不冲突
- **技术多样性**：每个服务使用最适合其特定用途的工具

## 🔧 配置自定义端口和主机名

默认情况下，Archon 服务运行在以下端口：

- **archon-ui**：3737
- **archon-server**：8181
- **archon-mcp**：8051
- **archon-agents**：8052
- **archon-docs**：3838（可选）

### 更改端口

要使用自定义端口，请将这些变量添加到您的 `.env` 文件中：

```bash
# 服务端口配置
ARCHON_UI_PORT=3737
ARCHON_SERVER_PORT=8181
ARCHON_MCP_PORT=8051
ARCHON_AGENTS_PORT=8052
ARCHON_DOCS_PORT=3838
```

示例：在不同端口上运行：

```bash
ARCHON_SERVER_PORT=8282
ARCHON_MCP_PORT=8151
```

### 配置主机名

默认情况下，Archon 使用 `localhost` 作为主机名。您可以通过在 `.env` 文件中设置 `HOST` 变量来配置自定义主机名或 IP 地址：

```bash
# 主机名配置
HOST=localhost  # 默认

# 自定义主机名示例：
HOST=192.168.1.100     # 使用特定 IP 地址
HOST=archon.local      # 使用自定义域名
HOST=myserver.com      # 使用公共域名
```

这在以下情况下很有用：

- 在不同机器上运行 Archon 并远程访问
- 为您的安装使用自定义域名
- 在无法访问 `localhost` 的网络环境中部署

更改主机名或端口后：

1. 重启 Docker 容器：`docker compose down && docker compose --profile full up -d`
2. 访问 UI：`http://${HOST}:${ARCHON_UI_PORT}`
3. 使用新的主机名和 MCP 端口更新您的 AI 客户端配置

## 🔧 开发

### 快速开始

```bash
# 安装依赖
make install

# 启动开发（推荐）
make dev        # 后端在 Docker，前端本地带热重载

# 替代方案：全部在 Docker
make dev-docker # 所有服务在 Docker

# 停止所有（本地前端需要手动停止）
make stop
```

### 开发模式

#### 混合模式（推荐）- `make dev`

最适合活跃开发的即时前端更新：

- 后端服务在 Docker 中运行（隔离、一致）
- 前端在本地运行，具有热模块替换
- 无需 Docker 重新构建即可即时更新 UI

#### 完整 Docker 模式 - `make dev-docker`

所有服务都在 Docker 环境中：

- 所有服务在 Docker 容器中运行
- 更适合集成测试
- 前端更新较慢

### 测试和代码质量

```bash
# 运行测试
make test       # 运行所有测试
make test-fe    # 运行前端测试
make test-be    # 运行后端测试

# 运行代码检查
make lint       # 检查所有代码
make lint-fe    # 检查前端代码
make lint-be    # 检查后端代码

# 检查环境
make check      # 验证环境设置

# 清理
make clean      # 删除容器和卷（需要确认）
```

### 查看日志

```bash
# 使用 Docker Compose 直接查看日志
docker compose logs -f              # 所有服务
docker compose logs -f archon-server # API 服务器
docker compose logs -f archon-mcp    # MCP 服务器
docker compose logs -f archon-ui     # 前端
```

**注意**：后端服务在其 uvicorn 命令中配置了 `--reload` 标志，并将源代码挂载为卷，以便在您进行更改时自动热重载。

## 故障排除

### 常见问题和解决方案

#### 端口冲突

如果您看到"端口已被使用"错误：

```bash
# 检查什么在使用端口（例如 3737）
lsof -i :3737

# 停止所有容器和本地服务
make stop

# 在 .env 中更改端口
```

#### Docker 权限问题（Linux）

如果您遇到 Docker 权限错误：

```bash
# 将您的用户添加到 docker 组
sudo usermod -aG docker $USER

# 登出并重新登录，或运行
newgrp docker
```

#### Windows 特定问题

- **未找到 Make**：通过 Chocolatey、Scoop 或 WSL2 安装 Make（见[安装 Make](#安装-make)）
- **行结尾问题**：配置 Git 使用 LF 结尾：
  ```bash
  git config --global core.autocrlf false
  ```

#### 前端无法连接到后端

- 检查后端是否运行：`curl http://localhost:8181/health`
- 验证 `.env` 中的端口配置
- 对于自定义端口，确保同时设置了 `ARCHON_SERVER_PORT` 和 `VITE_ARCHON_SERVER_PORT`

#### Docker Compose 挂起

如果 `docker compose` 命令挂起：

```bash
# 重置 Docker Compose
docker compose down --remove-orphans
docker system prune -f

# 重启 Docker Desktop（如果适用）
```

#### 热重载不工作

- **前端**：确保您在混合模式（`make dev`）中运行，以获得最佳的 HMR 体验
- **后端**：检查卷在 `docker-compose.yml` 中是否正确挂载
- **文件权限**：在某些系统上，挂载的卷可能存在权限问题

## 📈 项目进展

<p align="center">
  <a href="https://star-history.com/#coleam00/Archon&Date">
    <img src="https://api.star-history.com/svg?repos=coleam00/Archon&type=Date" width="500" alt="Star 历史图表">
  </a>
</p>

## 📄 许可证

Archon 社区许可证（ACL）v1.2 - 详见 [LICENSE](LICENSE) 文件。

**简而言之**：Archon 是免费、开放和可修改的。运行它、分叉它、分享它 - 只是不要未经许可将其作为服务销售。