library(httr)
querySW <- function(level = NULL, location = NULL, time = NULL, api_key){
  #https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/3/location/36.281389,-80.060278/time/2015
  
  sample2 <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/", 
location, "/time/", time, "?api_key=", api_key))
  content(sample2)
}

querySW(level = 3, location = "36.281389,-80.060278", time = 2015, api_key = "pmgtZPDc1pWw4Y4IKN9XalAhC46yxSo5xgktg8e2")

level = 3; location = "36.281389,-80.060278"; time = 2015; api_key = "pmgtZPDc1pWw4Y4IKN9XalAhC46yxSo5xgktg8e2"
