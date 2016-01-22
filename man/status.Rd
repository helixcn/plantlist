\name{status}
\alias{status}
\title{
Looking for the taxonomic status of species
}
\description{
Looking for the taxonomic status of a scientific name for a plant based on the database from The Plant List Website. 
}
\usage{
status(species = NA, exact = TRUE, spell_error_max = NULL)
}

\arguments{
  \item{species}{
A vector of character strings representing the scientific names of species
}
  \item{exact}{
Logical, Wheter the exactly matching search will be applied.  
}
  \item{spell_error_max}{
Integer, represents the number of spelling errors. Only effective when exact = FALSE. 
}
}
\details{
The scientific names will be formatted slightly at the beginning, eg. Change the case of letters; Remove the whitespace at the begining or ending or the string. The scientific name will then be parsed to GENUS, SPECIES, INFRASPECIFIC_RANK, INFRASPECIFIC_EPITHET. Only the these fields will be used for search against the TPL database. Therefore the authorship will not affect the results. INFRASPECIFIC_RANK only kept "var." and "subsp.", and have excluded "f." as "f." is often used in authorships. Please refer to the Plantlist Website for the validity for any "form" of a species. 

if exact = TRUE, the function only show the species that perfectly match the "keywords". If exact = FALSE, the function use the general expression(function grep()) and will return all the species containting the "keywords". 

The function also allows Approximate String Matching (Fuzzy Matching) using agrep(), when exact = FALSE and spell_error_max > 0. But the functions will be much more slower. 


}
\value{
A data frame containing the following columns
\item{SEARCH}{taxa parsed, used as the keyword of searching}
\item{ID }{ID from the TPL database}
\item{FAMILY }{The family provided by the plantlist website}
\item{SCIENTIFIC_NAME }{The scientifc name matched}
\item{AUTHOR }{the authorship for SCIENTIFIC_NAME}
\item{STATUS }{status of this matched scientific name}
\item{ACCEPTED_ID }{the accepted ID for the matched scientific name}
\item{ACCEPTED_SPECIES }{The accepted species}
\item{ACCEPTED_AUTHOR }{The authorship for the accepted species}
}
\references{

The Plantlist Website \url{http://www.theplantlist.org/}

The embbed database is available at \url{http://pan.baidu.com/s/1hqHrW9I}

}
\author{
Jinlong Zhang
}

\seealso{
See Also as \code{\link{TPL}} for family of each genus
}
\examples{

sp <- c( "Elaeocarpus decipiens",
"Syzygium buxifolium",
"Daphniphyllum oldhamii",
"Loropetalum chinense",
"Rhododendron latoucheae",
"Rhododendron ovatum",
"Vaccinium carlesii",
"Schima superba")

status(sp)
status("Myrica rubra")
status(c("Myrica rubra", "Adinandra millettii", 
         "Machilus thunbergii", "Ranunculus japonicus", 
         "Cyclobalanopsis neglecta" ))
status("Adinandra millettii")
status("cyclobalanopsis neglecta")
status("Lirianthe henryi")

}

\keyword{ name }
\keyword{ status }
