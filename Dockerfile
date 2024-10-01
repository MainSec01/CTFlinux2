FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    rsync \
    curl \
    libc6 \
    vim \
    git \
    htop \
    net-tools \
    tar \
    openssl \
    man-db \
    build-essential \
    software-properties-common \
    wget \
    unzip \
    lsb-release \
    ca-certificates \
    gcc \
    sudo \  
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER root

# Create home directories for users
RUN mkdir -p /home/barbarian3

# Copy files from the host (build context) to the container
COPY ./linux-basics-2.2/ /home/barbarian3/

# Compile the C program
RUN gcc /home/barbarian3/3_1_1_6.c -o /home/barbarian3/3_1_1_6

RUN /home/barbarian3/3_1_1_6

RUN gcc /home/barbarian3/3_1_1_7.c -o /home/barbarian3/3_1_1_7

RUN /home/barbarian3/3_1_1_7

RUN gcc /home/barbarian3/3_1_1_8.c -o /home/barbarian3/3_1_1_8

RUN /home/barbarian3/3_1_1_8

RUN gcc /home/barbarian3/3_1_1_8.c -o /home/barbarian3/3_1_1_8

RUN /home/barbarian3/3_1_1_8


RUN sudo -i

RUN usermod -aG sudo jane

RUN gcc /home/barbarian3/3_1_1_9.c -o /home/barbarian3/3_1_1_9

RUN /home/barbarian3/3_1_1_9

RUN gcc /home/barbarian3/3_1_1_10.c -o /home/barbarian3/3_1_1_10

RUN /home/barbarian3/3_1_1_10

RUN gcc /home/barbarian3/3_1_1_11.c -o /home/barbarian3/3_1_1_11

RUN /home/barbarian3/3_1_1_11

COPY ./linux-basics-2.2/check_zelda.c /root

RUN gcc /root/check_zelda.c -o /root/chek

RUN rm -rf /home/barbarian3/

RUN rm -rf /root/check_zelda.c 

RUN sudo usermod -c "Jane Carson" jane

# Create the 'barbarian3' user and add to sudo group
RUN useradd -m -d /home/barbarian3 -s /bin/bash barbarian3 \
    && echo "barbarian3:barbarian03" | chpasswd \
    && usermod -aG sudo barbarian3

# Allow passwordless sudo (optional)
RUN echo "barbarian3 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Change ownership of the files in /home/barbarian3
RUN chown -R barbarian3:barbarian3 /home/barbarian3

# Set password for root user (change as needed)
RUN echo "root:hack123" | chpasswd

# Clean up any potential extra directories
RUN rm -rf /home/barbarian3/barbarian3 || true

# Set 'barbarian3' as the default user and set the working directory
USER barbarian3
WORKDIR /home/barbarian3

# Start bash
CMD ["bash"]
