querySW <- function(api_key, level = NULL, coordinates, times = NULL){
  
  if (is.null(times)) times <- Sys.Date()
  
  URL <- paste0("https://api.skywatch.co/data/level/", level, "/location/",
                coordinates, "/time/", times, "?")
  
  query <- GET(URL, add_headers('Accept' = 'application/json', 'x-api-key' = api_key)))
  
  return(content(query))
}