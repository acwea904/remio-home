#!/bin/bash
set -e

echo "🚀 启动哪吒 Agent..."
/opt/nezha/agent/nezha-agent &

echo "🌐 启动 remio-home..."
exec npm run start
