\name{CTPL}
\alias{CTPL}
\title{
Search Families Based on Scientific or Chinese Names of Plants
}
\description{
This function prepare checklist of plants with scientific name, Kew Family and APGIII family based on Chinese Names specified in an text file.
}
\usage{
CTPL(taxa = NULL, print_as_list = TRUE)
}
\arguments{
  \item{taxa}{
  Character vector of the species names (Chinese Characters).
}
  \item{print_as_list}{
  Logical, implying how the results should be printed, if TRUE, use the function print.listof() to print.
  }
}
\details{
A vector of character strings containing the Chinese Names to look up. 
}
\value{
A data frame containing the following columns:

\item{TAXA_NAME}{Chinese Name of the taxa}

\item{SPECIES}{Scientific name without authorship}

\item{SPECIES_FULL}{Scientific name}

\item{GENUS}{Genus}

\item{GENUS_CN}{Genus in Chinese}

\item{FAMILY_APGIII}{The family in APGIII classification systems}

\item{FAMILY_CN}{The family name in Chinese}

\item{GROUP}{The group of vascular plants}

\item{IUCN_CHINA}{The IUCN status published in 2014.}

\item{ENDEMIC_TO_CHINA}{Logical, Is the taxa endemic to China}

\item{PROVINTIAL_DISTRIBUTION}{Provinces in which the taxa is naturally occurred}

\item{ALTITUDE}{Altitudinal range in meters}

}
\references{
The Plant List Website. 
}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}
\examples{
# Do not Run
# see the vignettes
}
