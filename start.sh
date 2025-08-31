#!/bin/bash

# Archon 快速启动脚本
echo "🚀 启动 Archon 服务..."

# 检查 Docker 是否运行
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker 未运行，请先启动 Docker Desktop"
    exit 1
fi

# 启动服务
echo "📦 启动 Docker 容器..."
docker compose up -d

# 等待服务就绪
echo "⏳ 等待服务启动..."
sleep 5

# 检查服务健康状态
echo "🔍 检查服务状态..."
if curl -s http://localhost:8181/health | grep -q "healthy"; then
    echo "✅ API 服务正常"
else
    echo "⚠️  API 服务可能需要更多时间启动"
fi

# 显示访问信息
echo ""
echo "========================================="
echo "✨ Archon 已启动！"
echo "========================================="
echo "📌 Web 界面: http://localhost:3737"
echo "📌 API 服务: http://localhost:8181"
echo "📌 MCP 服务: http://localhost:8051"
echo "========================================="
echo ""
echo "💡 提示: 使用 './stop.sh' 停止服务"