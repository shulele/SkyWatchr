querySW <- function(level = NULL, coordinates = NULL, times = NULL, api_key){
  sample <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/",
                        coordinates, "/time/", times, "?api_key=", api_key))
  return(content(sample))
}