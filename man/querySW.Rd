\name{querySW}
\alias{querySW}
\title{Query SkyWatch API}
\description{
Query SkyWatch API
}
\usage{
querySW(api_key, time_period = NULL, coordinates, instrument_satellite = NULL, data_level = NULL, 
        max_resolution = NULL, max_cloudcover = NULL, wavelength_band = NULL)
}
\arguments{
  \item{api_key}{
string; personal alphanumeric api key
}
  \item{time_period}{
string; one or two UTC time_periodtamps in ISO format (yyyy-mm-ddThh:mm:ss.sssss+|-zzzz). See details
}
  \item{coordinates}{
string; longitude, latitude coordinate pairs. See details
}
  \item{instrument_satellite}{
numeric; data processing levels for Earth observation data. See details
}
  \item{data_level}{
numeric; data processing levels for Earth observation data. See details
}
  \item{max_resolution}{
numeric; data processing levels for Earth observation data. See details
}
  \item{max_cloudcover}{
numeric; data processing levels for Earth observation data. See details
}
  \item{wavelength_band}{
numeric; data processing levels for Earth observation data. See details
}
}
\details{
\code{api_key} is a personal alphanumeric api key provided by SkyWatch admin to users upon request.

\code{time_period} corresponds to one or two UTC time_periodtamps in ISO format (yyyy-mm-ddThh:mm:ss.sssss+|-zzzz). Partial dates can also be specified: 2009, 2009-12, 2009-12-25, 2009-12-25T13:25:00.0000+0000. If no time is specified, midnight UTC on the day in question is assumed. If only one time_periodtamp is passed in, a one day range is assumed. For example, if 2009-12-25 is specified, the search takes place as if 2009-12-25,2009-12-26 was specified.

\code{coordinates} corresponds to a list of longitude, latitude coordinate pairs as a flat, comma-separated list. A list of two numbers represents a point, four numbers is a square area where the coordinates are the corners, or if there are more than four numbers the coordinates represent a closed polygon, where the first point equals the last point in the list. Because this list represents a number of points, there always has to be an even number of numbers in the list. Examples:

Point: -71.1043443253,-42.3150676016

Square: -71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829

Polygon: -71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,

71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,

-71.1043443253471,-42.3150676015829

\code{level} corresponds to the data processing levels for Earth observation data. Level 1, 2, and 3 (L1, L2, L3) datasets are available. If no data level is specified, datasets of all levels will be returned.
}
\value{
data.frame containing query output
}
\examples{
\dontrun{
api_key <- "your_personal_alphanumeric_api_key"

# One of the words largest landfills "Olusosun Dump" in Nigeria
querySW(api_key, time_period = 2015-8, coordinates = "6.566358,3.367358,6.586358,3.387358")

# An Imperial Oil refinery in Canada
querySW(api_key, time_period = 2015, coordinates = "36.281389,-80.060278", level = 3)

# The smoggiest city on Earth Ahvaz, Iran
querySW(api_key, time_period = "2015-06", coordinates = "31.321119,48.676074", level = 3)

# Ahvaz, Iran in September, 2015
querySW(api_key, time_period = "2015-9", coordinates = "31.321119,48.676074", level = 1, wavelength_band = "red,green,blue")

# Other examples
querySW(api_key, time_period = "2009-12-25", coordinates = "-71.1043443253471,-42.3150676015829", 
        level = 2)
querySW(api_key, time_period = "2009-12-25", coordinates = "-71.1043443253471,-42.3150676015829")

querySW(api_key, time_period = "2016-07-11,2016-07-12", 
        coordinates = "-71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,
        71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,
        -71.1043443253471,-42.3150676015829",
        instrument_satellite = "Landsat-8", level = 1, max_resolution = 30, max_cloudcover = 100, 
        wavelength_band = "blue")
}
}
\keyword{ spatial }% use one of  RShowDoc("KEYWORDS")