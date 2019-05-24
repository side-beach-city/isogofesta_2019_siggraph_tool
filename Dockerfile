FROM ubuntu
# add basic tools.
RUN apt-get update && \
  apt-get install -y \
    vim \
    git \
    wget \
    sudo \
    python \
    supervisor \
    lua5.3 \
    software-properties-common

# torch install
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN sed -i s/python-software-properties/software-properties-common/ ~/torch/install-deps
RUN bash ~/torch/install-deps
RUN cd ~/torch && ./install.sh

# siggraph2016 install
RUN git clone https://github.com/satoshiiizuka/siggraph2016_colorization.git ~/siggraph2016
RUN cd ~/siggraph2016 && ./download_model.sh

# add config & shell
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# run
CMD "/run.sh"