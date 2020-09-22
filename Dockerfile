FROM r-base:4.0.2
MAINTAINER Freddy Drennan

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    xtail \
    wget \
    libssl-dev \
    libxml2-dev \
    python3-venv \
    libpq-dev \
    libsodium-dev \
    libudunits2-dev \
    libgdal-dev \
    systemctl \
    git \
    libssh2-1 \
    libssh2-1-dev \
    texlive-full \
    unzip \
    curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

WORKDIR /home/productor

COPY install.R /home/productor/install.R

RUN Rscript /home/productor/install.R

RUN git clone https://github.com/fdrennan/interface.git
