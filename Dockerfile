FROM r-base:4.0.2
MAINTAINER Freddy Drennan
WORKDIR /home/productor
ENV PRODUCTOR_VERSION 0.1.0

# INSTALL BINARIES REQUIRED TO RUN R CODE AND HANDLE MISC THINGS IN THE CONTAINER
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
    texlive \
    unzip \
    curl

# INSTALL AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install


# COPY IN REQUIRED FILES
COPY renv.lock renv.lock

COPY install_R_packages.R install_R_packages.R
RUN Rscript install_R_packages.R

COPY install_conda.R install_conda.R
RUN Rscript /home/productor/install_conda.R
