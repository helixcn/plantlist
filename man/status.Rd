\name{status}
\alias{status}
\title{
Looking for the taxonomic status of species
}
\description{
Looking for the taxonomic status of a scientific name for a plant based on the database from The Plant List Website. 
}
\usage{
status(species = NA, exact = TRUE, spell_error_max = NULL, detail = FALSE)
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
  \item{detail}{
Logical, implicate whether detailed version of the results will be displayed, including ID for the names being searched. 
}
}
\details{
The scientific names will be formatted before being processed, including: The first letter of the scientific name will be changed to upper case while the rest will be in lower case; multiple whitespaces will be replaced by one, and the whitespace at the beginning or the end will be removed. The scientific name will then be parsed to GENUS, SPECIES, AUTHOR_OF_SPECIES, INFRASPECIFIC_RANK, INFRASPECIFIC_EPITHET, AUTHOR_OF_INFRASPECIFIC_RANK, respectively. However, only GENUS, SPECIES, INFRASPECIFIC_RANK, INFRASPECIFIC_EPITHET will be used for searching against the embedded TPL database. Please note the authorship will not be used in searching, therefore the same scientific name with different authorship should result in multiple entries. 

Since 'f.' is also used in the authorship,please do not provide the author name for the species when it is a form.Eg. the name "Hypoxishirsuta (L.) Coville f. vollosissima Fernald". should be provided as "Hypoxis hirsuta f. vollosissima Fernald" or "Hypoxis hirsuta f. vollosissima".

if exact = TRUE, the function only show the species that perfectly matching the "keywords". If exact = FALSE, the function use the general expression(function grep()) and will return all the species containting the "keywords". 

The function also allows Approximate String Matching (Fuzzy Matching) using agrep(), when exact = FALSE and spell_error_max > 0. But it will be much more slower. 

}
\value{
The function will reture a data frame containing the following columns
\item{SCIENTIFIC_NAME }{The scientifc name matched}
\item{AUTHOR }{the authorship for SCIENTIFIC_NAME}
\item{STATUS }{status of this matched scientific name}
\item{FAMILY }{The family provided by the plantlist website}
\item{ACCEPTED_ID }{the accepted ID for the matched scientific name}
\item{ACCEPTED_SPECIES }{The accepted species}
\item{ACCEPTED_AUTHOR }{The authorship for the accepted species}
}
\references{

The Plantlist Website \url{http://www.theplantlist.org/}

The embedded database is available at http://pan.baidu.com/s/1hqHrW9I

}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}

\seealso{
See Also \code{\link{TPL}} for family of each genus
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
status(sp, detail = TRUE)
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
