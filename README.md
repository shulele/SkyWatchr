
# SkyWatchr

R wrapper for the [SkyWatch API][SkyWatch API] (currently version 0.8.2) developed by [SkyWatch].

The SkyWatch API aims to provide a singular point to discover and access the world’s remote sensing datasets. It allows users to search satellite imagery and climate/atmospheric datasets by wavelength (band), cloud cover, resolution, location, date, etc. Available datasets include ACOS, AIRS, CAI, FTS-SWIR, Landsat-8, MOPITT, OCO2, Sentinel-2 and TES. 

An API key for free access to the SkyWatch API can be requested [in this link].

A video tutorial explaining how to install and use the SkyWatchr package can be found in [this post in my blog].

## Installation

The stable version (recommended) of the SkyWatchr package can be installed from [CRAN] by executing the following command line in an R console:


```r
install.packages('SkyWatchr')
```

Alternatively, the development version can be installed from this GitHub repository. You'll need to install first the `devtools` package:


```r
install.packages('devtools')
```

Then install the `SkyWatchr` package from this repository:


```r
devtools::install_github('amsantac/SkyWatchr')
```

## Usage

First load the SkyWatchr package:


```r
library(SkyWatchr)
```

Store in an object [your API key]:


```r
api_key <- "your_personal_alphanumeric_api_key"
```

For convenience, users can set the global option `SkyWatchr.apikey` (recommended) once per session via: 


```r
options(SkyWatchr.apikey = api_key)
```

Then try some queries with the `querySW` function:


```r
# One of the world largest landfills "Olusosun Dump" in Nigeria
querySW(time_period = "2015-8", longitude_latitude = "6.566358,3.367358,6.586358,3.387358")
```

If the `SkyWatchr.apikey` option is not set, then provide the API key:


```r
# One of the world largest landfills "Olusosun Dump" in Nigeria
querySW(api_key, time_period = "2015-8", longitude_latitude = "6.566358,3.367358,6.586358,3.387358")
```

See below additional sample queries:


```r
# An Imperial Oil refinery in Canada
res <- querySW(time_period = 2015, longitude_latitude = "36.281389,-80.060278", data_level = 3)
View(res)

# The smoggiest city on Earth Ahvaz, Iran
querySW(time_period = "2015-06", longitude_latitude = "31.321119,48.676074", data_level = 3)

# Ahvaz, Iran in September, 2015
querySW(time_period = "2015-9", longitude_latitude = "31.321119,48.676074", data_level = 1, 
        wavelength_band = "red,green,blue")

# Other examples
querySW(time_period = "2009-12-25", longitude_latitude = "-71.1043443253471,-42.3150676015829", 
        data_level = 2)
querySW(time_period = "2009-12-25", longitude_latitude = "-71.1043443253471,-42.3150676015829")

querySW(time_period = "2016-07-11,2016-07-12", 
        longitude_latitude = "-71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,-71.1043443253471,-42.3150676015829",
        instrument_satellite = "Landsat-8", data_level = 1, max_resolution = 30, 
        max_cloudcover = 100, wavelength_band = "Blue")

# Queries can also be performed using objects of class Spatial (as defined by the sp package) 
# projected in geographic coordinates
ex1 <- data.frame(x = -71.1043443253, y = -42.3150676016, data = "point")
coordinates(ex1) <- ~ x + y
class(ex1)
querySW(time_period = "2015-8", longitude_latitude = ex1)
```

Call examples above retrieve objects of class `data.frame`. Output can also be printed as html by setting the `output` argument as `html` (see an html output example [HERE]):


```r
# Get output as html
querySW(time_period = "2015-8", longitude_latitude = "6.566358,3.367358,6.586358,3.387358", 
        output = "html")
querySW(time_period = "2016-07-11,2016-07-12", 
        longitude_latitude = "-71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,-71.1043443253471,-42.3150676015829",
        instrument_satellite = "Landsat-8", data_level = 1, max_resolution = 30, 
        max_cloudcover = 100, wavelength_band = "Blue", output = "html")
```

Files can be downloaded using the `downloadSW` function (or clicking the links in the html output as shown above):


```r
res <- querySW(time_period = "2015-06", longitude_latitude = "31.321119,48.676074", 
               data_level = 3)
View(res)

# Download all files
downloadSW(res)

# Download a subset
downloadSW(res[c(1,3), ])

# Use an expresion to subset files to be downloaded
downloadSW(res, source == "MOPITT" & size_kb < 2400)
```

Download links expire 1 hour after being generated.

If needed, the boundary box enclosing the extent of a given dataset retrieved in the results data.frame can be generated using the `getPolygon` function:


```r
res <- querySW(time_period = "2015-8", longitude_latitude = "-71.1043443253471,-42.3150676015829")
sppolygon <- getPolygon(res, index = 55)   # index refers to corresponding row in the data.frame

# To visualize it use spplot or packages such as mapview
library(mapview)
mapView(sppolygon)
```

For help on the functions implemented in the SkyWatchr package see the [reference manual](/SkyWatchr-manual.pdf) or run the following command lines in the R console:


```r
?SkyWatchr
?'SkyWatchr-package'
```

[CRAN]: https://cran.r-project.org/package=SkyWatchr
[SkyWatch]: http://www.skywatch.co/
[SkyWatch API]: https://github.com/skywatchspaceapps/api/blob/master/README.md
[in this link]: http://www.skywatch.co/request-access
[R]: https://cran.r-project.org/
[RStudio IDE]: https://www.rstudio.com/products/rstudio/download/
[your API key]: http://www.skywatch.co/request-access
[HERE]: https://amsantac.github.io/SkyWatchr/examples/html_output_example.html
[this post in my blog]: http://amsantac.co/blog/en/2016/12/11/skywatch-r.html
