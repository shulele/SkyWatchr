querySW <- function(level = "", coordinates = "", times = "", api_key = api_key){
  
  if (times == "") times <- Sys.Date()
  
  query <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/",
                       coordinates, "/time/", times, "?api_key=", api_key))
  
  return(content(query))
}