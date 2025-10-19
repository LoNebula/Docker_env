# PyTorch & Ollama GPU Development Environment with Docker

This is a template for building a PyTorch and Ollama development environment that utilizes NVIDIA GPUs with Docker Compose.

The goal is to create an isolated and reproducible environment for machine learning projects, providing a persistent Ollama server for LLM inference alongside a complete PyTorch development setup.

-----

## 🎯 Features

  - **Reproducible**: The `Dockerfile` ensures that the same environment can be built every time.
  - **Portable**: This environment can be reproduced on any machine that runs Docker.
  - **GPU Enabled**: Ready for model training (PyTorch) and inference (Ollama) using NVIDIA GPUs.
  - **Persistent Server**: Starts an Ollama server automatically, with model data saved in a persistent Docker volume.
  - **Efficient**: Start and stop the entire environment with simple Docker Compose commands.

-----

## 🔧 Environment

  - Ubuntu 22.04
  - NVIDIA CUDA Toolkit 12.1
  - **Python 3.11**
  - PyTorch (with CUDA support)
  - **Ollama Server**

-----

## ✅ Prerequisites

Before you begin, ensure you have the following installed and configured on your host machine:

  - An NVIDIA GPU
  - An up-to-date [NVIDIA Driver](https://www.nvidia.com/Download/index.aspx)
  - [Docker](https://www.docker.com/products/docker-desktop/)
  - A Docker environment configured for GPU access:
      - (For Windows) WSL 2 integration enabled in Docker Desktop
      - (For Linux) NVIDIA Container Toolkit

-----

## 🚀 Getting Started

### 1\. Clone or Create the Files

Ensure your `Dockerfile`, `docker-compose.yml`, and this `README.md` are in the same directory.

### 2\. Build and Run the Container

Run the following command. This will build the image from the `Dockerfile` and start the container in the background. The `CMD` in the `Dockerfile` ensures the **Ollama server starts automatically**.

```bash
docker compose up --build -d
```

### 3\. Verify the Ollama Server (from Host)

The server is now running and accessible from your host machine (the PC running Docker) at `http://localhost:11434`.

You can test this by opening a new terminal (not inside the container) and running:

```bash
curl http://localhost:11434/
```

If it's working, you should see `"Ollama is running"`.

### 4\. Enter the Container for Development

The server is running in the background. To get an interactive shell inside the *same* running container for development (e.g., to run Python scripts or download models), execute:

```bash
docker compose exec app /bin/bash
```

### 5\. Using Ollama (Inside Container)

Once you are inside the container (after running the `exec` command), you can use the Ollama CLI:

```bash
# List currently downloaded models
ollama list

# Pull a model (e.g., Llama 3)
ollama pull llama3

# Run a model
ollama run llama3 "Why is the sky blue?"
```

### 6\. Verify GPU Access for PyTorch (Inside Container)

While still inside the container, start Python and run the following code to check if PyTorch is correctly recognizing the GPU.

```bash
# Start python
python3.11
```

```python
# Inside the Python interpreter
import torch
print(f"PyTorch version: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"GPU Name: {torch.cuda.get_device_name(0)}")
```

### 7\. Stopping the Environment

To stop the Ollama server and the container, run:

```bash
docker compose down
```

(Your downloaded models will be saved in the `ollama_data` volume and will be available next time you run `docker compose up -d`).