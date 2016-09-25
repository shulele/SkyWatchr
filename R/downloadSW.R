downloadSW <- function(x, indexes = NULL){
  
  if(!is.null(indexes)) x <- x[indexes, ]
  
  for(i in 1:nrow(x)){
    urli <- x[i, "download_path"]
    elems <- unlist(strsplit(urli, "/", fixed = TRUE))
    file_name <- strsplit(elems[length(elems)], "?", fixed = TRUE)[[1]][1]
    cat(paste0("Downloading ", file_name, "... (", i, " of ", nrow(x), ")", "\n"))
    curl_download(urli, file_name)
  }
  
  cat(paste0("\n", "All requested files have been downloaded to: ", getwd()))
}