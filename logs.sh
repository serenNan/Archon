#!/bin/bash

# Archon 日志查看脚本
echo "📋 查看 Archon 日志"
echo "========================================="
echo "提示: 按 Ctrl+C 退出日志查看"
echo "========================================="
echo ""

# 默认查看所有服务日志
if [ -z "$1" ]; then
    docker compose logs -f --tail=50
else
    # 查看特定服务日志
    case $1 in
        api|server)
            echo "查看 API 服务日志..."
            docker compose logs -f archon-server --tail=50
            ;;
        ui|frontend)
            echo "查看前端日志..."
            docker compose logs -f archon-frontend --tail=50
            ;;
        mcp)
            echo "查看 MCP 服务日志..."
            docker compose logs -f archon-mcp --tail=50
            ;;
        *)
            echo "用法: ./logs.sh [api|ui|mcp]"
            echo "  api - 查看 API 服务日志"
            echo "  ui  - 查看前端日志"
            echo "  mcp - 查看 MCP 服务日志"
            echo "  留空 - 查看所有服务日志"
            ;;
    esac
fi