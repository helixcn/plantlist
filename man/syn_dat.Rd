\name{syn_dat}
\alias{syn_dat}
\docType{data}
\title{
Synonyms database from The Plant List
}
\description{
This data frame contains the synonyms for the scientific names from the Plant List.  
}
\usage{data("syn_dat")}
\format{
  A data frame with 703949 observations on the following 6 variables.
  \describe{
    \item{\code{ID}}{a character vector representing the ID in the Plant List Database}
    \item{\code{FAMILY}}{a character vector representing the Family of the species}
    \item{\code{SCIENTIFIC_NAME}}{a character vector representing the scientific name}
    \item{\code{AUTHOR}}{a character vector representing the authorship of this scientific name}
    \item{\code{STATUS}}{a character vector representing the validity of this scientific name}
    \item{\code{ACCEPTED_ID}}{a character vector representing the ID of the accepted name for this scientific name}
  }
}
\details{
Please refere to usage section
}
\source{
The embbed database is available at http://pan.baidu.com/s/1hqHrW9I
}
\references{
The Plantlist Website \url{http://www.theplantlist.org/}
}
\examples{
data(syn_dat)
}
\keyword{datasets}
