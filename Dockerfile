FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN pip install torch cython
RUN apt-get install -y curl git unzip

# for opencv
RUN apt-get update \
  && apt-get install -y libsm6 libxext6 libxrender-dev

RUN pip install opencv-python Pillow easydict scipy matplotlib networkx

COPY . /UPSNET
WORKDIR /UPSNET

RUN sh init.sh
RUN sh download_weights.sh

