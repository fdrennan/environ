# ENVIRONMENT_NAME <- 'r-reticulate'
# PREFIX = '/home/miniconda'
# RETICULATE_PYTHON =  paste0(
#   PREFIX, '/envs/', ENVIRONMENT_NAME,'/bin/python3.6'
# )
# Sys.setenv(RETICULATE_PYTHON=RETICULATE_PYTHON)
renv::activate()
library(reticulate)
library(tidymodels)
# py_config()

print(import('paramiko'))
# list.files()
# library(reticulate)
# py_config()
# p <- import('paramiko')
# print(p)
# renv::snapshot()
# options(renv.consent = TRUE)
# renv::restore()
# Sys.sleep(3000)