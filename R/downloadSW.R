downloadSW <- function(x, subset, file_name = "download_path", api_key = NULL){
  
  if (is.null(api_key)) {
    api_key <- getOption("SkyWatchr.apikey")
    
    if(is.null(api_key)) {
      message("You need to set an API key via options(SkyWatchr.apikey = 'your_api_key')")
    }
  }
  
  if(missing(subset)){
    r <- rep_len(TRUE, nrow(x))
  } else {
    e <- substitute(subset)
    r <- eval(e, x, parent.frame())
  }
  x <- x[r,]
  
  for(i in 1:nrow(x)){
    cat(paste0("Downloading ", i, "/", nrow(x), " ...", "\n"))
    urli <- x[i, "download_path"]
    # file_name <- paste0(x[i, "source"], "_", strsplit(urli, "/")[[1]][5], "_", x[i, "band"],  "_", strsplit(urli, "/")[[1]][4], ".", 
    #                     x[i, "type"])
    if(file_name == 'download_path') filename <- paste0(gsub(":", "_", gsub("\\.", "_", gsub("/", "_", dirname(urli)))), "_", basename(urli))
    if(file_name == 'basename') filename <- basename(urli) # WARNING: this will throw error if a file with the same basename already exists
    
    GET(x[i, "download_path"], add_headers('x-api-key' = api_key), write_disk(filename))
  }
  cat(paste0("\n", "All requested files have been downloaded to: ", getwd()))
}