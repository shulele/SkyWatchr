
# SkyWatchr

R wrapper for the [SkyWatch API] (currently version 0.3) developed by [SkyWatch].

## Installation

If not installed yet, first install the `devtools` package:


```r
install.packages('devtools')
```

Then install the `SkyWatchr` package from this GitHub repository:


```r
devtools::install_github('amsantac/SkyWatchr')
```

## Usage

First load the SkyWatchr package:


```r
library(SkyWatchr)
```
Then store in an object your API key and try some queries with the `querySW` function:


```r
api_key <- "your_personal_alphanumeric_api_key"

# One of the world largest landfills "Olusosun Dump" in Nigeria
querySW(api_key, time_period = "2015-8", coordinates = "6.566358,3.367358,6.586358,3.387358")

# An Imperial Oil refinery in Canada
querySW(api_key, time_period = 2015, coordinates = "36.281389,-80.060278", data_level = 3)

# The smoggiest city on Earth Ahvaz, Iran
querySW(api_key, time_period = "2015-06", coordinates = "31.321119,48.676074", data_level = 3)

# Ahvaz, Iran in September, 2015
querySW(api_key, time_period = "2015-9", coordinates = "31.321119,48.676074", data_level = 1, 
        wavelength_band = "red,green,blue")

# Other examples
querySW(api_key, time_period = "2009-12-25", coordinates = "-71.1043443253471,-42.3150676015829", 
        data_level = 2)
querySW(api_key, time_period = "2009-12-25", coordinates = "-71.1043443253471,-42.3150676015829")

querySW(api_key, time_period = "2016-07-11,2016-07-12", 
        coordinates = "-71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,-71.1043443253471,-42.3150676015829",
        instrument_satellite = "Landsat-8", data_level = 1, max_resolution = 30, max_cloudcover = 100, 
        wavelength_band = "Blue")
```

[SkyWatch]: http://www.skywatch.co/
[SkyWatch API]: https://github.com/skywatchspaceapps/api/blob/master/README.md
