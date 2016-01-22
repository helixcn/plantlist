\name{plantlist-package}
\alias{plantlist-package}
\alias{plantlist}
\docType{package}
\title{
Looking up Plant Families based on APGIII Classification System and More
}
\description{
Looking up Higher Plant Families based on APGIII Classification System, and making taxa table for Phylomatic Software for building large phylogenies without DNA sequences. 
}
\details{
\tabular{ll}{
Package: \tab plantlist\cr
Type: \tab Package\cr
Version: \tab 0.2.2\cr
Date: \tab 2016-1-22\cr
License: \tab GLP-2\cr
LazyLoad: \tab yes\cr
}

}
\author{
Jinlong Zhang

Maintainer: Jinlong Zhang <jinlongzhang01@gmail.com>
}

\keyword{ package }
\examples{

TPL("Carex")
TPL("Cherry")
splist <- c( "Ranunculus japonicus", "Hepatica henryi", 
              "Heracleum acuminatum", "Solanum nigrum", 
              "Punica sp.", "Machilus", "Today", "####" ) 
res <- TPL(splist)
taxa.table(res)

}
