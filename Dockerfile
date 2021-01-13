FROM cupy/cupy

ARG DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN apt-get update -y && apt-get upgrade -y && \
        apt-get install -y wget git libpython3-dev build-essential python3-opencv python3-pip python3-dev python3-wheel python3-setuptools unzip && \
        apt-get autoremove -y && apt-get clean -y && apt-get autoclean -y

# Install python3 modules
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade --no-cache-dir numpy Pillow opencv-contrib-python torch torchvision matplotlib tensorboard scipy

WORKDIR /opt/raft
