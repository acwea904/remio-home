#!/bin/bash
set -e

echo "📝 初始化哪吒 Agent v2 配置文件..."
# 动态生成 v2 版本的 config.yml
cat <<EOF > /opt/nezha/config.yml
server: agn.xinxi.pp.ua:443
client_secret: 1FyZCXk9XGSarBQrCVE8WjyzXTfJFqH4
tls: true
disable_auto_update: true
disable_command_execute: true
uuid: ab0af6bb-b88f-4629-b761-b4a21d203d9e
EOF

echo "🚀 启动哪吒 Agent v2..."
# 使用配置文件后台启动
nohup /opt/nezha/nezha-agent -c /opt/nezha/config.yml > /tmp/nezha.log 2>&1 &

echo "🌐 启动 remio-home..."
exec npm run start
