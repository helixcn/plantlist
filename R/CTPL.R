CTPL <- function(taxa = NULL, print_as_list = TRUE){
    options(stringsAsFactors = FALSE)

    if(any(taxa == ""|is.null(taxa))){
        stop("taxa is empty, please provide a Chinese Name")
    }
    

    if(is.null(taxa)){
        stop("At least more than one taxa should be provided.")
    }
    
    taxa_count <- table(taxa)
    
    # Remove duplicates
    if(any(taxa_count > 1)){
        taxa_names <- names(taxa_count)
        taxa_dup <- taxa_names[taxa_count > 1]
        cat("Duplicated taxa names have been removed:\n", taxa_dup,"\n")
    }
    taxa <- unique(taxa)
    
    # Ensure only the species found within the embedded database can be used for searching.
    if(!all(taxa %in% plantlist::cnplants_dat$SPECIES_CN)){
        warning("Taxa: ", paste(taxa[!taxa %in% plantlist::cnplants_dat$SPECIES_CN], collapse = ", "),
                "\n could not be recognized.")
        taxa <- taxa[taxa %in% plantlist::cnplants_dat$SPECIES_CN]
    } else {
        taxa = taxa
    }

    taxa <- enc2utf8(taxa)
    taxa <- data.frame(taxa)
    colnames(taxa) <- "TAXA_NAME"

    cnplants_dat = plantlist::cnplants_dat
    res <- merge(x = taxa, y = cnplants_dat, by.x = "TAXA_NAME", by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)

    if(print_as_list){
        if(nrow(res) > 6){
            cat("Note: too many rows to show, only the first few rows were printed")
        }
        print.listof(head(res)) # Only the first few species will be printed
        return(invisible(res))
    } else {
        return(res)
    }
}
