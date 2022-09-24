# FROM nvidia/cuda:11.4.0-runtime-ubuntu20.04

FROM rapidsai/rapidsai:22.08-cuda11.4-runtime-ubuntu18.04-py3.9

RUN apt-get update -y
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo #CONTAINER_TIME > /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive

# RUN consta install libgcc

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

COPY ./ ./

CMD ["jupyter-lab --allow-root --no-browser --ip=0.0.0.0 --port=8888 --NotebookApp.token='' --NotebookApp.password=''"]
