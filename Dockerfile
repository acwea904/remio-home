FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# ======================
# 安装基础依赖
# ======================
RUN apt update && apt install -y \
    curl \
    ca-certificates \
    tzdata \
    bash \
    && rm -rf /var/lib/apt/lists/*

# ======================
# 安装哪吒 Agent
# ======================
WORKDIR /opt/nezha

RUN curl -L https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.sh -o agent.sh \
    && chmod +x agent.sh

# 仅安装，不启动
RUN env NZ_SERVER=143.14.221.174:8008 \
    NZ_TLS=false \
    NZ_CLIENT_SECRET=1FyZCXk9XGSarBQrCVE8WjyzXTfJFqH4 \
    ./agent.sh install

# ======================
# remio-home
# ======================
WORKDIR /app

# 如果 remio-home 有编译步骤，放这里
# COPY . .
# RUN npm install / go build / python install ...

# ======================
# 启动脚本
# ======================
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
