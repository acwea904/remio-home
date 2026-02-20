#!/bin/bash
set -e

echo "🚀 启动哪吒 Agent..."
# 直接用参数启动，关闭自动更新，后台运行并将日志记录到 /tmp/nezha.log
nohup /opt/nezha/nezha-agent -s agn.xinxi.pp.ua:443 -p 1FyZCXk9XGSarBQrCVE8WjyzXTfJFqH4 --tls --disable-auto-update --disable-command-execute > /tmp/nezha.log 2>&1 &

echo "🌐 启动 remio-home..."
exec npm run start
