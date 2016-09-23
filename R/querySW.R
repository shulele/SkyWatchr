querySW <- function(api_key, time_period = NULL, coordinates, instrument_satellite = NULL, data_level = NULL, 
                    max_resolution = NULL, max_cloudcover = NULL, wavelength_band = NULL){
  
  if (is.null(time_period)) time_period <- Sys.Date()
  
  URL <- paste0("https://api.skywatch.co/data", "/time/", time_period, "/location/", coordinates)
  
  if(!is.null(instrument_satellite)) URL <- paste0(URL, "/source/", instrument_satellite)
  if(!is.null(data_level)) URL <- paste0(URL, "/level/", data_level)
  if(!is.null(max_resolution)) URL <- paste0(URL, "/resolution/", max_resolution)
  if(!is.null(max_cloudcover)) URL <- paste0(URL, "/cloudcover/", max_cloudcover)
  if(!is.null(wavelength_band)) URL <- paste0(URL, "/band/", wavelength_band)

  query <- GET(paste0(URL, "?"), add_headers('Accept' = 'application/json', 'x-api-key' = api_key))
  
  return(content(query))
}