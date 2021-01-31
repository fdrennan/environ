FROM ubuntu:focal
MAINTAINER Freddy Drennan

ENV DEBIAN_FRONTEND=noninteractive


WORKDIR /home/

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    gnupg \
    ca-certificates

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" >> /etc/apt/sources.list
RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    r-base \
    r-base-dev \
    git

RUN R -e "print('hello')"

# RUN R -e "install.packages('tidyverse')"
# RUN R -e "install.packages('devtools')"
# RUN R -e "install.packages('roxygen2')"
# RUN R -e "install.packages('usethis')"

# COPY install.R /home/productor/install.R

# RUN Rscript /home/productor/install.R

# RUN git clone https://github.com/fdrennan/interface.git
