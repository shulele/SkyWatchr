
# SkyWatchr

R wrapper for the [SkyWatch API] developed by [SkyWatch].

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

# An oil refinery in Canada
querySW(level = 3, coordinates = "36.281389,-80.060278", times = 2015, api_key = api_key)

# One of the words largest landfills "Olusosun Dump" in Nigeria
querySW(coordinates = "6.566358,3.367358,6.586358,3.387358", times = "2015", api_key = api_key)

# The smoggiest city on Earth Ahvaz, Iran
querySW(level = 3, coordinates = "31.321119,48.676074", times = "2015-06", api_key = api_key)

# From SkyWatch GitHub repository examples
querySW(level = 2, coordinates = "-71.1043443253471,-42.3150676015829", times = "2009-12-25", api_key = api_key)
querySW(coordinates = "-71.1043443253471,-42.3150676015829", times = "2009-12-25", api_key = api_key)
```

[SkyWatch]: http://www.skywatch.co/
[SkyWatch API]: https://github.com/skywatchspaceapps/api/blob/master/README.md
