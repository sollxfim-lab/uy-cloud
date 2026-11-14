FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system utilities, Python, Node.js/npm, tmux, and ttyd as root
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    tmux \
    ttyd \
    && rm -rf /var/lib/apt/lists/*

ENV PORT=10000
EXPOSE 10000

# Start ttyd as root with custom credentials
CMD ["sh", "-c", "ttyd -p ${PORT} -c myusername:SuperSecretPassword123 bash"]
