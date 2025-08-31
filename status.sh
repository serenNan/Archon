#!/bin/bash

# Archon 状态检查脚本
echo "📊 Archon 服务状态"
echo "========================================="

# 检查容器状态
echo "🐳 Docker 容器状态:"
docker compose ps

echo ""
echo "🔍 服务健康检查:"

# 检查 API 健康状态
if curl -s http://localhost:8181/health 2>/dev/null | grep -q "healthy"; then
    echo "✅ API 服务: 健康运行中 (http://localhost:8181)"
else
    echo "❌ API 服务: 未运行或不健康"
fi

# 检查前端
if curl -s http://localhost:3737 2>/dev/null | grep -q "Archon"; then
    echo "✅ Web 界面: 正常运行 (http://localhost:3737)"
else
    echo "❌ Web 界面: 未运行"
fi

# 检查 MCP
if curl -s http://localhost:8051 2>/dev/null; then
    echo "✅ MCP 服务: 运行中 (http://localhost:8051)"
else
    echo "❌ MCP 服务: 未运行"
fi

echo "========================================="