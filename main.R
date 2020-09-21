library(glue)
library(stringr)

glue_system <- function(string) {
  string <- glue(string)
  message(string)
  system(string)
}

APPLICATION='SHINY' # 'SHINY', 'PLUMBER', 'SCRIPT'
HOST = '0.0.0.0'
PORT = 3000
SWAGGER_UI = TRUE # PLUMBER ONLY

if (APPLICATION=='SHINY') {
  DEFAULT_GIT_BRANCH <- 'https://github.com/fdrennan/interface.git'
  glue_system('git clone {DEFAULT_GIT_BRANCH} app')
  shiny::runApp(
    appDir = 'app',
    port = PORT,
    launch.browser = FALSE,
    host = HOST
  )
} else if (APPLICATION=='PLUMBER') {
  pr <- plumber::plumb('plumber.R');
  pr$run(
    host=HOST,
    port=PORT,
    swagger = SWAGGER_UI
  )
} else if (APPLICATION=='SCRIPT') {
  print(reticulate::import('paramiko'))
}

