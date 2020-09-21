FROM r-base:4.0.2
MAINTAINER Freddy Drennan

USER productor
WORKDIR /home/productor

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
    systemctl

COPY install.R /home/productor/install.R

RUN Rscript /home/productor/install.R

# Install Shiny Server
RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.14.948-amd64.deb
RUN yes | gdebi shiny-server-1.5.14.948-amd64.deb


RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('rmarkdown')"


#COPY shiny-server.sh /home/productor/shiny-server.sh
#COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
#3RUN chown shiny:shiny /var/lib/shiny-server
#RUN chown shiny:shiny /srv/shiny-server
#RUN chown shiny:shiny /home/productor/renv
