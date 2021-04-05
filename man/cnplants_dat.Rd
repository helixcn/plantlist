\name{cnplants_dat}
\alias{cnplants_dat}
\docType{data}
\title{
The Chinese Plants Database
}
\description{
The Chinese Plants Database from Various sources
}
\usage{data("cnplants_dat")}
\format{
  A data frame with 49479 observations on the following 15 variables.
  \describe{
    \item{\code{SPECIES_CN}}{a character vector}
    \item{\code{SPECIES}}{a character vector}
    \item{\code{SPECIES_FULL}}{a character vector}
    \item{\code{GENUS}}{a character vector}
    \item{\code{GENUS_AUTHOR}}{a character vector}
    \item{\code{GENUS_CN}}{a character vector}
    \item{\code{FAMILY}}{a character vector}
    \item{\code{FAMILY_CN}}{a character vector}
    \item{\code{FAMILY_NUMBER}}{a character vector showing the APGIII numbers for Angiosperms, and the Christenhusz Family Number for Gymnosperms and ferns}
    \item{\code{ORDER}}{a character vector}
    \item{\code{GROUP}}{a character vector}
    \item{\code{IUCN_CHINA}}{a character vector}
    \item{\code{ENDEMIC_TO_CHINA}}{a character vector}
    \item{\code{PROVINTIAL_DISTRIBUTION}}{a character vector}
    \item{\code{ALTITUDE}}{a character vector}
  }
}

\source{
Compiled from various sources. See https://github.com/helixcn/plantlist_data
}
\references{
https://github.com/helixcn/plantlist_data
}
\examples{
data(cnplants_dat)
}
\keyword{datasets}
