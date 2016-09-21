\name{querySW}
\alias{querySW}
\title{Query SkyWatch API}
\description{
Query SkyWatch API
}
\usage{
querySW(level = "", coordinates = "", times = "", api_key = api_key)
}
\arguments{
  \item{level}{
string; data processing levels for Earth observation data. See details
}
  \item{coordinates}{
string; longitude, latitude coordinate pairs. See details
}
  \item{times}{
string; one or two UTC timestamps in ISO format (yyyy-mm-ddThh:mm:ss.sssss+|-zzzz). See details
}
  \item{api_key}{
string; personal alphanumeric api key
}
}
\details{
\code{api_key} is a personal alphanumeric api key provided by SkyWatch admin to users upon request.

\code{level} corresponds to the data processing levels for Earth observation data. Level 1, 2, and 3 (L1, L2, L3) datasets are available. If no data level is specified, datasets of all levels will be returned.

\code{coordinates} corresponds to a list of longitude, latitude coordinate pairs as a flat, comma-separated list. A list of two numbers represents a point, four numbers is a square area where the coordinates are the corners, or if there are more than four numbers the coordinates represent a closed polygon, where the first point equals the last point in the list. Because this list represents a number of points, there always has to be an even number of numbers in the list. Examples:

Point: -71.1043443253,-42.3150676016

Square: -71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829

Polygon: -71.1043443253471,-42.3150676015829,71.1043443253471,-42.3150676015829,71.1043443253471,42.3150676015829,-71.1043443253471,42.3150676015829,-71.1043443253471,-42.3150676015829

\code{times} corresponds to one or two UTC timestamps in ISO format (yyyy-mm-ddThh:mm:ss.sssss+|-zzzz). Partial dates can also be specified: 2009, 2009-12, 2009-12-25, 2009-12-25T13:25:00.0000+0000. If no time is specified, midnight UTC on the day in question is assumed. If only one timestamp is passed in, a one day range is assumed. For example, if 2009-12-25 is specified, the search takes place as if 2009-12-25,2009-12-26 was specified.
}
\value{
data.frame containing query output
}
\examples{
api_key <- "your_personal_alphanumeric_api_key"

# An oil refinery in Canada
querySW(level = 3, coordinates = "36.281389,-80.060278", times = 2015, api_key = api_key)

# One of the words largest landfills "Olusosun Dump" in Nigeria
querySW(coordinates = "6.566358,3.367358,6.586358,3.387358", times = "2015", api_key = api_key)

# The smoggiest city on Earth Ahvaz, Iran
querySW(level = 3, coordinates = "31.321119,48.676074", times = "2015-06", api_key = api_key)

# From GitHub repository examples
querySW(level = 2, coordinates = "-71.1043443253471,-42.3150676015829", times = "2009-12-25", api_key = api_key)
querySW(coordinates = "-71.1043443253471,-42.3150676015829", times = "2009-12-25", api_key = api_key)
}
