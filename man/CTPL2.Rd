\name{CTPL2}
\alias{CTPL2}
\title{
Search taxonomic and conservation information Based on Chinese Names of Plants
}
\description{
This function prepare checklist of plants with scientific name, Kew Family and APGIII family based on Chinese Names specified in an text file.
}
\usage{
CTPL2(infile = NULL, outfile = "result_cnplants.xlsx")
}
\arguments{
  \item{infile}{
  Name of the xlsx file containing the species names to search.
}
  \item{outfile}{
  Name of the xlsx file containing the results.
}
}
\details{
This function reads xlsx file using the openxlsx package. 
}
\value{
A dataframe of the species with detailed information for the taxa searched. 
}
\references{
Various sources. Detailed information for the master file could be find at \url{https://github.com/helixcn}
}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}
\examples{
path <- system.file("extdata", "test_checklist.xlsx", package = "plantlist")
CTPL2(infile = path)
}
