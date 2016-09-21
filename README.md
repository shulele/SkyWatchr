# SkyWatchr

## Instalation

devtools::install_github('amsantac/SkyWatchr')

## Usage
library(SkyWatchr)
api_key <- "your_personal_alphanumeric_api_key"
querySW(level = 3, coordinates = "36.281389,-80.060278", times = 2015, api_key)
