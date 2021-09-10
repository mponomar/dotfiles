FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV http_proxy=http://host.docker.internal:3142/

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
    bc \
    bison \
    build-essential \
    clang \
    cmake \
    curl \
    flex \
    gawk \
    gdb \
    git \
    htop \
    iputils-ping \
    jq \
    libevent-dev \
    liblz4-dev \
    liblz4-tool \
    libprotobuf-c-dev \
    libprotobuf-c1 \
    libreadline-dev \
    libsqlite3-0 \
    libsqlite3-dev \
    libssl-dev \
    libunwind-dev \
    libuuid1 \
    libz-dev \
    libz1 \
    libz1 \
    make \
    ncurses-dev \
    net-tools \
    netcat-openbsd \
    ninja-build \
    openssh-server \
    pip \
    protobuf-c-compiler \
    psmisc \
    rsync \
    socat \
    strace \
    sudo \
    tcl \
    tcl \
    tcl-dev \
    time \
    tzdata \
    uuid-dev \
    uuid-dev \
    valgrind \
    vim

RUN apt-get install sudo

RUN useradd -s /bin/bash -m mike && yes password | passwd mike && \
    mkdir /run/sshd && \
    ssh-keygen -A && \
    echo "mike   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    sudo -u mike mkdir /home/mike/.ssh && chmod 700 /home/mike/.ssh && \
    pip install supervisor 

COPY key /home/mike/.ssh/authorized_keys

RUN chown mike:mike /home/mike/.ssh/authorized_keys &&  \
    chmod 600 /home/mike/.ssh/authorized_keys && \
    sudo -u mike sh -c "cd /home/mike && git clone https://github.com/mponomar/comdb2 && cd comdb2 && mkdir build && cd build && cmake -G Ninja .. && ninja" && \
    echo 'export PATH=$PATH:/opt/bb/bin' | sudo -u mike tee -a /home/mike/.bashrc && \
    ninja -C /home/mike/comdb2/build install && \
    mkdir -p /opt/bb/var/cdb2 && \
    chmod 777 /opt/bb/var/cdb2 && \
    mkdir -p /opt/bb/var/log/cdb2 && \
    chmod 777 /opt/bb/var/log/cdb2 && \
    sudo -u mike /opt/bb/bin/comdb2 mikedb --create

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 22

CMD [ "/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf" ]
