FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install all required packages here during build time (as root)
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
    ttyd \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -ms /bin/bash vpsuser

USER vpsuser
WORKDIR /home/vpsuser

ENV PORT=10000
EXPOSE 10000

CMD ["sh", "-c", "ttyd -p ${PORT} -c myusername:SuperSecretPassword123 bash"]
