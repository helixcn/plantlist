CTPL <- function(taxa = NULL){

    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        original_locale <- Sys.getlocale()
        Sys.setlocale(category = "LC_ALL",locale = "Chinese")
        #setlocale("LC_ALL", "English_United States.932") 
    }

    options(stringsAsFactors = FALSE)
    taxa <- enc2utf8(taxa)
    taxa <- data.frame(taxa)
    colnames(taxa) <- "TAXA_NAME"

    cnplants = plantlist::cnplants
    res <- merge(x = taxa, y = cnplants, by.x = "TAXA_NAME", by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)
#    if(syst == "Windows"){
#        Sys.setlocale(locale = original_locale)
#    }
    # Encoding(res) <- "GB18030"
    return(res)
}
