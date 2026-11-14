FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential utilities, development tools, and ttyd (web terminal)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    sudo \
    ttyd \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user with sudo privileges
RUN useradd -ms /bin/bash vpsuser && \
    echo "vpsuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER vpsuser
WORKDIR /home/vpsuser

# Render dynamically passes the PORT environment variable
ENV PORT=10000
EXPOSE 10000

# Start ttyd sharing a bash shell
# SECURITY WARNING: Change the username:password (-c user:pass) below before deploying!
CMD ["sh", "-c", "ttyd -p ${PORT} -c myusername:SuperSecretPassword123 bash"]
