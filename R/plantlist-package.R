

#' The accepted plant names from the Plant List
#' 
#' The data frame contains the columns of the status of a scientific name from
#' the Plant List.
#' 
#' Please refer to the format section.
#' 
#' @name acc_dat
#' @docType data
#' @format A data frame with 594102 observations on the following 5 variables.
#' \describe{ 
#' \item{list("ID")}{a character vector representing the ID of the
#' name from the plant list database} 
#' \item{list("FAMILY")}{a character vector
#' representing the family of this scientific name}
#' \item{list("SCIENTIFIC_NAME")}{a character vector representing the
#' scientific name} 
#' \item{list("AUTHOR")}{a character vector representing the
#' author of the scientific name} 
#' \item{list("STATUS")}{a character vector
#' representing the status of the scientific name} }
#' 
#' @references The Plantlist Website \url{http://www.theplantlist.org/}
#' @source The embed database is available at http://pan.baidu.com/s/1hqHrW9I
#' @keywords datasets
#' @examples
#' 
#' data(acc_dat)
#' 
NULL





#' The Chinese Plants Database
#' 
#' The Chinese Plants Database from Various sources
#' 
#' 
#' @name cnplants_dat
#' @docType data
#' @format A data frame with 49479 observations on the following 15 variables.
#' \describe{ \item{list("SPECIES_CN")}{a character vector}
#' \item{list("SPECIES")}{a character vector} \item{list("SPECIES_FULL")}{a
#' character vector} \item{list("GENUS")}{a character vector}
#' \item{list("GENUS_AUTHOR")}{a character vector} \item{list("GENUS_CN")}{a
#' character vector} \item{list("FAMILY")}{a character vector}
#' \item{list("FAMILY_CN")}{a character vector} \item{list("FAMILY_NUMBER")}{a
#' character vector showing the APGIII numbers for Angiosperms, and the
#' Christenhusz Family Number for Gymnosperms and ferns} \item{list("ORDER")}{a
#' character vector} \item{list("GROUP")}{a character vector}
#' \item{list("IUCN_CHINA")}{a character vector}
#' \item{list("ENDEMIC_TO_CHINA")}{a character vector}
#' \item{list("PROVINTIAL_DISTRIBUTION")}{a character vector}
#' \item{list("ALTITUDE")}{a character vector} }
#' @references https://github.com/helixcn/plantlist_data
#' @source Compiled from various sources. See
#' https://github.com/helixcn/plantlist_data
#' @keywords datasets
#' @examples
#' 
#' data(cnplants_dat)
#' 
NULL





#' The genera-family database for vascular plants
#' 
#' A curated genera-family database for vascular plants mainly based on the
#' Plant List Website http://www.theplantlist.org/1.1/browse/-/-/
#' 
#' 
#' @name genera_dat
#' @docType data
#' @format A data frame with 24814 observations on the following 2 variables.
#' \describe{ \item{list("GENUS")}{a character vector} \item{list("FAMILY")}{a
#' character vector} }
#' @source the Plant List Website http://www.theplantlist.org/1.1/browse/-/-/,
#' with modifications.
#' @keywords datasets
#' @examples
#' 
#' data(genera_dat)
#' 
NULL





#' Order-Family Database for higher plants
#' 
#' Order-Family Database for higher plants, including bryophytes, ferns and
#' lycophytes, gymnosperms and angiosperms
#' 
#' 
#' @name orders_dat
#' @docType data
#' @format A data frame with 1879 observations on the following 4 variables.
#' \describe{ \item{list("FAMILY")}{a character vector} \item{list("ORDER")}{a
#' character vector} \item{list("FAMILY_NUMBER")}{a character vector}
#' \item{list("GROUP")}{a character vector} }
#' @references
#' 
#' Mark W. Chase, Mark W. Chase and James L. Reveal. 2009. A Phylogenetic
#' Classification of the Land Plants to Accompany APG III. Botanical Journal of
#' the Linnean Society 161(2):122-127.
#' @source
#' 
#' http://www.mobot.org/MOBOT/research/APweb/top/synonymyfamilies.html
#' 
#' For bryophytes
#' http://duocet.ibiodiversity.net/index.php?title=%E5%A4%9A%E8%AF%86%E8%8B%94%E8%97%93%E7%B3%BB%E7%BB%9F
#' @keywords datasets
#' @examples
#' 
#' data(orders_dat)
#' 
#' 
NULL





#' Looking Up the Status of Plant Scientific Names based on The Plant List
#' Database
#' 
#' Looking up the status of scientific names based on the Plant List Database
#' and search the Families for genus.
#' 
#' c("\\Sexpr[results=rd,stage=build]{tools:::Rd_package_DESCRIPTION(\"#1\")}",
#' "plantlist")\Sexpr{tools:::Rd_package_DESCRIPTION("plantlist")}
#' c("\\Sexpr[results=rd,stage=build]{tools:::Rd_package_indices(\"#1\")}",
#' "plantlist")\Sexpr{tools:::Rd_package_indices("plantlist")}
#' 
#' @name plantlist-package
#' @aliases plantlist-package plantlist
#' @docType package
#' @author Jinlong Zhang
#' 
#' Maintainer: Jinlong Zhang <jinlongzhang01@@gmail.com>
#' @keywords package
#' @examples
#' 
#' 
#' TPL("Carex")
#' TPL("Cherry")
#' splist <- c("Ranunculus japonicus", "Hepatica henryi",
#'             "Heracleum acuminatum", "Solanum nigrum",
#'             "Punica sp.", "Machilus", "Today", "####" )
#' res <- TPL(splist)
#' taxa.table(res)
#' 
#' 
NULL





#' Synonyms database from The Plant List
#' 
#' This data frame contains the synonyms for the scientific names from the
#' Plant List.
#' 
#' Please refere to usage section
#' 
#' @name syn_dat
#' @docType data
#' @format A data frame with 703949 observations on the following 6 variables.
#' \describe{ \item{list("ID")}{a character vector representing the ID in the
#' Plant List Database} \item{list("FAMILY")}{a character vector representing
#' the Family of the species} \item{list("SCIENTIFIC_NAME")}{a character vector
#' representing the scientific name} \item{list("AUTHOR")}{a character vector
#' representing the authorship of this scientific name} \item{list("STATUS")}{a
#' character vector representing the validity of this scientific name}
#' \item{list("ACCEPTED_ID")}{a character vector representing the ID of the
#' accepted name for this scientific name} }
#' @references The Plantlist Website \url{http://www.theplantlist.org/}
#' @source The embbed database is available at http://pan.baidu.com/s/1hqHrW9I
#' @keywords datasets
#' @examples
#' 
#' data(syn_dat)
#' 
NULL



