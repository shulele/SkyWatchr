querySW <- function(level = "", coordinates = "", times = "", api_key = api_key){
  
  if (times == "") times <- Sys.Date()
  
  query <- GET(paste0("https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data/level/", level, "/location/",
                       coordinates, "/time/", times, "?api_key=", api_key))
  
  return(content(query))
}

# 
# querySW2 <- function(level = NULL, coordinates = NULL, times = NULL, api_key){
#   
#   base_url <- "https://cqh77pglf1.execute-api.us-west-2.amazonaws.com/prod/data"
#   
#   if (!is.null(level)){
#     base_url <- paste0(base_url, "/level/", level)
#     }
#   if (!is.null(coordinates)){
#     base_url <- paste0(base_url, "/location/", coordinates)
#     }
#   if (!is.null(times)){
#     base_url <- paste0(base_url, "/time/", times)
#     }
#                        
#   sample <- GET(paste0(base_url, "?api_key=", api_key))
# 
# 
#   return(content(sample))
# }


