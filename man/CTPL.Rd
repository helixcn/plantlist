\name{CTPL}
\alias{CTPL}
\title{
Search Families Based on Scientific or Chinese Names of Plants
}
\description{
This function prepare checklist of plants with scientific name, Kew Family and APGIII family based on Chinese Names specified in an text file.
}
\usage{
CTPL(taxa = NULL, taxafile = NULL, outfile = "CTPL_results.csv")
}
\arguments{
  \item{taxa}{
  Character vector of the species names.
}
  \item{taxafile}{
  Character string of the text file containing the species names to search.
}
  \item{outfile}{
  Name of the CSV file containing the results
}
}
\details{
The file containing Chinese Names must be in plain text, and encoded in ANSII (Windows) or UTF-8 (Linux or MacOS), one row for one species. 
}
\value{
A data frame of the species with family. 
A file "CTPL_results.csv" will be generated in the working directory.
}
\references{
The Plant List Website. 
}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}
\examples{
# Do not Run
# path <- system.file("extdata", "CTPL_test.txt", package = "plantlist")
# CTPL(file = path)
}
