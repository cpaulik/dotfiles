FROM ubuntu:15.04

MAINTAINER Christoph Paulik <cpaulik@gmail.com>

# Install packages: wget, git, and emacs
RUN apt-get update && \
    apt-get install -y wget git emacs build-essential && \
    apt-get clean

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
&&  wget --quiet https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh \
&&  /bin/bash /miniconda.sh -b -p /opt/conda \
&&  rm miniconda.sh \
&&  /opt/conda/bin/conda update -q conda

# create workspace directory
RUN mkdir -p /workspace
# container user
RUN groupadd -f -g 100 dummy && \
    useradd -s /bin/bash -u 1000 -g users dummy && \
    mkdir -p /home/dummy && \
    chown -R dummy:dummy /home/dummy

# clone emacs conf
RUN git clone --recursive https://github.com/cpaulik/dotfiles.git /home/dummy/dotfiles \
&&  cd /home/dummy/dotfiles \
&&  export HOME=/home/dummy \
&&  /bin/bash install_script

RUN cd /home/dummy/.emacs.d \
&&  git checkout -b develop origin/develop \
&&  export HOME=/home/dummy \
&&  emacs --daemon

RUN apt-get install -y unzip \
&& wget https://github.com/chrissimpkins/Hack/releases/download/v2.018/Hack-v2_018-ttf.zip -O hack.zip \
&&  unzip hack.zip \
&&  mv *.ttf /usr/share/fonts/truetype/ \
&&  fc-cache -f -v \
&&  rm hack.zip

RUN  cd /home/dummy/dotfiles \
&&  git pull origin

RUN  chown -R dummy:dummy /home/dummy

USER dummy

ENV PATH /opt/conda/bin:/home/dummy/bin:$PATH
ENV SHELL /bin/bash
ENV HOME /home/dummy
ENV TERM xterm-256color
ENV LANG en_GB.UTF-8
ENV LC_COLLATE en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8


CMD ["/bin/bash"]
