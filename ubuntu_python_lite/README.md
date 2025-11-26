# Python Runtime Environment on Ubuntu (Docker)

This repository provides a lightweight Python runtime environment built on top of Ubuntu 22.04 using Docker.  
It installs the standard full Python3 package (not the minimal version) and is suitable for running typical Python applications with no additional setup.

---

## 1. Overview

The included Dockerfile performs the following:

- Uses `ubuntu:22.04` as the base image  
- Installs Python3, pip, and venv  
- Creates a symlink so `python` points to `python3`  
- Installs only essential packages using `--no-install-recommends`  
- Cleans apt cache to keep the image small  
- Copies your application code into `/app` and runs `main.py`

---

## 2. Requirements

Before using this environment, ensure Docker is installed:

https://docs.docker.com/get-docker/

---

## 3. Build the Image

Build the Docker image from the project root:

```bash
docker build -t my-python-app .
```

You may replace `my-python-app` with any image name you prefer.

---

## 4. Run the Container

To start the container and automatically run `main.py`:

```bash
docker run --rm -it my-python-app bash


```

Because the Dockerfile specifies:

```dockerfile
CMD ["python", "main.py"]
```

your application will start immediately.

---

## 5. Development Mode (Mount Local Files)

If you want to edit your code locally and have the container use the updated files:

```bash
docker run --rm -it \
  -v $(pwd):/app \
  my-python-app
```

This mounts your current directory into the container at `/app`.

---

## 6. Interactive Shell / Python REPL

To enter the container and use Python manually:

```bash
docker run --rm -it my-python-app bash
```

Once inside, simply run:

```bash
python
```

---

## 7. Using `requirements.txt`

If your project includes Python dependencies, enable these lines in the Dockerfile:

```dockerfile
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
```

This installs dependencies during the image build.
