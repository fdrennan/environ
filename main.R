renv::activate()
library(reticulate)
library(tidymodels)
library(biggr)
library(ndexssh)

system('git clone https://github.com/fdrennan/interface.git')
print(fs::dir_ls())
# shiny::runApp(appDir = 'interface', port = 80)
