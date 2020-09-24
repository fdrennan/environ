library(reticulate)
ENVIRONMENT_NAME <- 'r-reticulate'
BASE_DIRECTORY = '/home/miniconda'
RETICULATE_PYTHON =  file.path(
  BASE_DIRECTORY, 'envs', ENVIRONMENT_NAME,'bin/python3.6'
)
install_miniconda(path = BASE_DIRECTORY)
Sys.setenv(RETICULATE_PYTHON=RETICULATE_PYTHON)
system(paste0('echo RETICULATE_PYTHON=', RETICULATE_PYTHON, ' >> ~/.Renviron'))
py_install(packages = c('paramiko', 'boto3', 'scikit-learn', 'scipy', 'pandas', 'matplotlib'))

