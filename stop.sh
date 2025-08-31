#!/bin/bash

# Archon 停止脚本
echo "🛑 停止 Archon 服务..."

# 停止并移除容器
docker compose down

echo "✅ Archon 服务已停止"