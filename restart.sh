#!/bin/bash

# Archon 重启脚本
echo "🔄 重启 Archon 服务..."

# 停止服务
docker compose down

# 等待一下
sleep 2

# 启动服务
docker compose up -d

# 等待服务就绪
echo "⏳ 等待服务启动..."
sleep 5

# 检查服务健康状态
if curl -s http://localhost:8181/health | grep -q "healthy"; then
    echo "✅ 服务重启成功"
else
    echo "⚠️  服务可能需要更多时间启动"
fi

echo ""
echo "📌 Web 界面: http://localhost:3737"