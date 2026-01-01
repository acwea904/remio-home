#!/bin/bash
set -e

echo "启动哪吒 Agent..."
/opt/nezha/agent/nezha-agent &

echo "启动 remio-home..."

# 👇 这里换成 remio-home 实际启动命令
# 示例（按你项目实际情况改）：
# node server.js
# ./remio-home
# python app.py

exec "$@"
