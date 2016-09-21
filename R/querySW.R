querySW <- function(level = NULL, coordinates, times = NULL, api_key){
  
  if (is.null(times)) times <- Sys.Date()
  
  query <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/",
                       coordinates, "/time/", times, "?api_key=", api_key))
  
  return(content(query))
}