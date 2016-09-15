library(httr)
querySW <- function(level = NULL, location = NULL, time = NULL, api_key){
  sample2 <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/",
                        location, "/time/", time, "?api_key=", api_key))
  return(content(sample2))
}

