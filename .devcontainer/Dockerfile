FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Base tools
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    ca-certificates \
    python3 \
    python3-pip \
    gtkwave \
    iverilog \
    verilator \
    jq \
    && rm -rf /var/lib/apt/lists/*

# ---- Verible ----
# Install prebuilt Verible binaries
RUN VERIBLE_VERSION=v0.0-3712-g9a8bb37 && \
    wget https://github.com/chipsalliance/verible/releases/download/${VERIBLE_VERSION}/verible-${VERIBLE_VERSION}-linux-static-x86_64.tar.gz && \
    tar -xzf verible-${VERIBLE_VERSION}-linux-static-x86_64.tar.gz && \
    cp verible-${VERIBLE_VERSION}/bin/* /usr/local/bin/ && \
    rm -rf verible*

# Create a non-root user (nice-to-have)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME

USER $USERNAME
WORKDIR /workspace
