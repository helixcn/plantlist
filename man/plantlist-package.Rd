\name{plantlist-package}
\alias{plantlist-package}
\alias{plantlist}
\docType{package}
\title{
Looking Up the Status of Plant Scientific Names based on The Plant List Database
}
\description{
Looking up the status of scientific names based on the Plant List Database and search the Families for genus. 
}
\details{
\packageDESCRIPTION{plantlist}
\packageIndices{plantlist}
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
