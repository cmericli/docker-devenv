FROM ubuntu:16.04
LABEL maintainer "Cetin Mericli <cetin.mericli@gmail.com>"

# nvidia-docker uses this label to find which docker volume to mount 
# for exposing the host NVidia drivers
# not necessary if inheriting from nvidia/cuda images

LABEL com.nvidia.volumes.needed="nvidia_driver"
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64


