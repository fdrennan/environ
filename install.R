ENVIRONMENT_NAME <- 'r-reticulate'
PREFIX = '/home/miniconda'
RETICULATE_PYTHON =  paste0(
  PREFIX, '/envs/', ENVIRONMENT_NAME,'/bin/python3.6'
)

install.packages('renv')
options(renv.consent = TRUE)
renv::activate()
install.packages(
  c(
    'devtools',
    'reticulate',
    'renv',
    'tidyverse',
    'tidymodels',
    'DBI',
    'dbplyr',
    'RPostgres',
    'glue',
    'fs',
    'jsonlite',
    'tictoc',
    'openxlsx',
    'dlstats',
    'dbx',
    'gridExtra',
    'ggrepel',
    'ggplot2',
    'dplyr',
    'ggridges',
    'viridis',
    'hrbrthemes',
    'usethis',
    'sysfonts',
    'shiny',
    'shinydashboard',
    'httr',
    'shinycssloaders'
  )
)

renv::install('UrbanInstitute/urbnmapr')
renv::install('fdrennan/ndexutils')
renv::install('fdrennan/ndexssh')
renv::install('fdrennan/biggr')
renv::install('fdrennan/ndexpg')
renv::install('fdrennan/ndexie')
renv::install('fdrennan/ndexrstrator')


library(reticulate)
install_miniconda(path = PREFIX)
Sys.setenv(RETICULATE_PYTHON=RETICULATE_PYTHON)
system(paste0('echo RETICULATE_PYTHON=', RETICULATE_PYTHON, ' >> ~/.Renviron'))
py_install(packages = c('paramiko', 'boto3', 'scikit-learn', 'scipy', 'pandas', 'matplotlib'))

# glue::glue('biggr::configure_aws(aws_access_key_id = "{Sys.getenv("AWS_ACCESS")}",
#                            default.region = "{Sys.getenv("AWS_REGION")}",
#                            aws_secret_access_key = "{Sys.getenv("AWS_SECRET")}")')
