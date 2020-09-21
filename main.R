# renv::activate()
# library(reticulate)
# library(tidymodels)
# library(biggr)
# library(ndexssh)
# library(shiny)

system('git clone https://github.com/fdrennan/interface.git')
# print(fs::dir_ls())
# print(.libPaths())
# runApp(appDir = 'interface', port = 3838)
shiny::runApp(
  appDir = 'interface',
  port = 3000,
  launch.browser = FALSE,
  host = '0.0.0.0'
)
# import('paramiko')
