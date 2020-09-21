#!/bin/bash

apt-get install git -y
cat /home/productor/shiny-server.sh
cat /etc/shiny-server/shiny-server.conf
git clone https://github.com/fdrennan/interface.git
mv interface /srv/shiny-server/sample-apps/
bash /home/productor/shiny-server.sh
