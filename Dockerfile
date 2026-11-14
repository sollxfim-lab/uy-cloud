FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Pasang alatan asas dan ttyd sebagai root
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    ttyd \
    && rm -rf /var/lib/apt/lists/*

# Render menyediakan port secara dinamik
ENV PORT=10000
EXPOSE 10000

# Jalankan ttyd sebagai root supaya anda boleh pasang apa sahaja pakej
CMD ["sh", "-c", "ttyd -p ${PORT} -c myusername:SuperSecretPassword123 bash"]
