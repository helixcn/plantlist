\name{orders_dat}
\alias{orders_dat}
\docType{data}
\title{
Order-Family Database for Angiosperms
}
\description{
Order-Family Database for Angiosperms
}
\usage{data("orders_dat")}
\format{
  A data frame with 1649 observations on the following 4 variables.
  \describe{
    \item{\code{FAMILY}}{a character vector}
    \item{\code{ORDER}}{a character vector}
    \item{\code{FAMILY_NUMBER}}{a character vector, showing the Christenhusz number for the APGIII system}
    \item{\code{GROUP}}{a character vector showing the group of the family belongs to}
  }
}

\source{
\url{http://www.mobot.org/MOBOT/research/APweb/top/synonymyfamilies.html}
}
\references{
Mark W. Chase, Mark W. Chase and James L. Reveal. 2009. A Phylogenetic Classification of the Land Plants to Accompany APG III. Botanical Journal of the Linnean Society 161(2):122-127.
}
\examples{
data(orders_dat)
}
\keyword{datasets}
