\name{acc_dat}
\alias{acc_dat}
\docType{data}
\title{
The accepted plant names from the Plant List
}
\description{
The data frame contain the columns of the status of a scientific name from the Plant List.
}
\usage{data("acc_dat")}
\format{
  A data frame with 594102 observations on the following 5 variables.
  \describe{
    \item{\code{ID}}{a character vector representing the ID of the name from the plant list database}
    \item{\code{FAMILY}}{a character vector representing the family of this scientific name}
    \item{\code{SCIENTIFIC_NAME}}{a character vector representing the scientific name}
    \item{\code{AUTHOR}}{a character vector representing the author of the scientific name}
    \item{\code{STATUS}}{a character vector representing the status of the scientitic name}
  }
}
\details{
Please refer to the format section.
}
\source{
The embbed database is available at http://pan.baidu.com/s/1hqHrW9I
}
\references{
The Plantlist Website \url{http://www.theplantlist.org/}
}
\examples{
data(acc_dat)
}
\keyword{datasets}
