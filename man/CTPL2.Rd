\name{CTPL2}
\alias{CTPL2}
\title{
Adding taxonomic and conservation information based on Chinese Names
}
\description{
This function adds the following columnes SPECIES, SPECIES_FULL, GENUS, GENUS_CN, FAMILY_APGIII, FAMILY_CN, GROUP, IUCN_CHINA, ENDEMIC_TO_CHINA, PROVINTIAL_DISTRIBUTION, ALTITUDE to the supplied dataframe based on the Chinese Name of plants in the first column.
}
\usage{
CTPL2(infile = NULL, outfile = "result_CTPL2.xlsx")
}
\arguments{
  \item{infile}{
  Name of the xlsx file containing the Chinese names of plants. It must use the first row as column names and the Chinese Names must be in the First Column.
}
  \item{outfile}{
  Name of the xlsx file.
}
}
\details{

\code{SPECIES}: scientific name without authors

\code{SPECIES_FULL}:scientific name with authors

\code{GENUS}:genus

\code{GENUS_CN}: genus in Chinese

\code{FAMILY_APGIII}: genus in APGIII

\code{FAMILY_CN}: Chinese name for the family

\code{GROUP}: major group of plants

\code{IUCN_CHINA}: the IUCN conservation status of this species

\code{ENDEMIC_TO_CHINA}: if the species is endemic to China

\code{PROVINTIAL_DISTRIBUTION}: the provincial distribution

\code{ALTITUDE}: altitudinal range

}
\value{
A dataframe with taxonomic information for each species added.
}
\references{
Various sources. Detailed information for the master file is available at \url{https://github.com/helixcn/plantlist_data}
}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}
\examples{
# Not run
# see the vignettes
}
