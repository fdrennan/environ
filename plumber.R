library(plumber)
library(tidyverse)
library(glue)
library(tictoc)
library(jsonlite)
#* @filter cors
cors <- function(req, res) {
  message(glue("Within filter {Sys.time()}"))

  res$setHeader("Access-Control-Allow-Origin", "*")

  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods", "*")
    res$setHeader(
      "Access-Control-Allow-Headers",
      req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS
    )
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }
}


#* @serializer unboxedJSON
#* @get /mtcars
function() {
  message(glue("Within mtcars: {Sys.time()}"))

  # Build the response object (list will be serialized as JSON)
  response <- list(
    statusCode = 200,
    data = "",
    message = "Success!",
    metaData = list(
      args = list(),
      runtime = 0
    )
  )

  response <- tryCatch(
    {
      # Run the algorithm
      tic()
      response$data <- toJSON(mtcars)
      timer <- toc(quiet = T)
      response$metaData$runtime <- as.numeric(timer$toc - timer$tic)

      return(response)
    },
    error = function(err) {
      response$statusCode <- 400
      response$message <- paste(err)

      return(response)
    }
  )

  return(response)
}
