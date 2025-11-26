FROM ubuntu:22.04

# タイムゾーンや対話を無効化
ENV DEBIAN_FRONTEND=noninteractive

# 必要なものだけ入れる
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# python3 → python へリンク
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app

# 依存が必要ならここに
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["python", "main.py"]
