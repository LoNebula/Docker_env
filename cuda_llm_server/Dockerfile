# 1. ベースイメージの選択 (変更なし)
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

# 2. タイムゾーンなどの設定（変更なし）
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 3. 必要なパッケージのインストール (Python 3.11 に更新)
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
    python3.11 \
    python3.11-pip \
    git \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 4. Pythonライブラリのインストール (pip3.11 を使用)
# PyTorchをCUDA 12.1対応版でインストールします
RUN pip3.11 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# 5. Ollamaのインストール (変更なし)
RUN curl -fsSL https://ollama.com/install.sh | sh

# 6. 作業ディレクトリの指定 (変更なし)
WORKDIR /workspace

# 7. Ollamaが使用するポートを開放 (変更なし)
EXPOSE 11434

# 8. コンテナ起動時のデフォルトコマンド (変更なし)
CMD ["ollama", "serve"]
