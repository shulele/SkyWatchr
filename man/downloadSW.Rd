\name{downloadSW}
\alias{downloadSW}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Downloads satellite imagery from SkyWatch API
}
\description{
Downloads satellite imagery from SkyWatch API using a query output object from the querySW function.
}
\usage{
downloadSW(x, indexes = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
data.frame returned by the querySW function
}
  \item{indexes}{
NULL or a numeric vector of row indexes for the x object. See details
}
}
\details{
\code{x} must be a data.frame returned by the querySW function.

If \code{indexes} is NULL, all files in the \emph{download_path} column in \code{x} are downloaded. A numeric vector indicating rows of \code{x} can be provided to \code{indexes} to download only selected files in the \emph{download_path} column of \code{x}.
}
\value{
Returns nothing
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
\dontrun{
api_key <- "your_personal_alphanumeric_api_key"

res <- querySW(api_key, time_period = "2015-06", coordinates = "31.321119,48.676074", 
               instrument_satellite = "MOPITT", data_level = 3)
View(res)

# Download all files
downloadSW(res)

# Download a seleted subset
downloadSW(res, c(1,3))

res <- querySW(api_key, time_period = "2015-06", coordinates = "31.321119,48.676074", 
               data_level = 3)
View(res)
downloadSW(res, which(res[, "source"] == "MOPITT"))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ spatial }% use one of  RShowDoc("KEYWORDS")

