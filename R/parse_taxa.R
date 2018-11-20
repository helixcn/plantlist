parse_taxa <-
function(taxa){
    parse_taxon <- function(taxon){
        replace_space <- function(x) {
            gsub("[[:space:]]+", " ", gsub("^[[:space:]]+|[[:space:]]+$", "", x))
        }
        
        if(length(taxon) > 1){
            stop("Only one taxon allowed")
        }
        
        GENUS                         <- ""
        SPECIES                       <- ""
        AUTHOR_OF_SPECIES             <- ""
        INFRASPECIFIC_RANK            <- ""
        INFRASPECIFIC_EPITHET         <- ""
        AUTHOR_OF_INFRASPECIFIC_RANK  <- ""
        
        taxon <- gsub(" +", " ", replace_space(taxon))
        ### Parse Genus
        gap1 <- regexpr(pattern = " ", text = taxon)
        GENUS <- replace_space(substr(taxon, start = 1, stop = (gap1-1)))
        ### The rest part
        part1 <- replace_space(substr(taxon, start = gap1 + 1, stop = nchar(taxon)))
        gap2 <- regexpr(pattern = " ", text = part1)
        
        ### Parse Species
        if(gap2 < 0){
            SPECIES <- replace_space(substr(part1, start = gap2 + 1, stop = nchar(part1)))
            author_temp <- ""
        } else {
            SPECIES <- replace_space(substr(part1, start = 1, stop = (gap2 - 1)))
            author_temp <- replace_space(substr(part1, start = gap2 + 1, stop = nchar(part1)))
        }
        AUTHOR_OF_SPECIES <- author_temp
        
        gap3 <- regexpr(pattern = " ", text = author_temp)
        if(grepl("var\\. ", taxon)|grepl("subsp\\. ", taxon)|grepl(" f\\. ", taxon)){
            if(grepl("var\\. ", taxon)){
                INFRASPECIFIC_RANK            <- "var."
                gap_var <- regexpr(pattern = "var\\. ", text = author_temp) + nchar("var.")
                AUTHOR_OF_SPECIES <- replace_space(substr(author_temp, start = 1, stop = gap_var - nchar("var.") -1))
                part_INFRASP_EP_AUTHOR_OF_INFRASP <- replace_space(substr(author_temp, start = gap_var + 1, stop = nchar(author_temp)))
            } else {
                if(grepl("subsp\\. ", taxon)){
                    INFRASPECIFIC_RANK            <- "subsp."
                    gap_subsp <- regexpr(pattern = "subsp\\. ", text = author_temp) + nchar("subsp.")
                    AUTHOR_OF_SPECIES <- replace_space(substr(author_temp, start = 1, stop = gap_subsp - nchar("subsp.") -1))
                    part_INFRASP_EP_AUTHOR_OF_INFRASP <- replace_space(substr(author_temp, start = gap_subsp + 1, stop = nchar(author_temp)))
                } else {
                    if(substr(author_temp, start = 1, stop = nchar("f.")) == "f."){
                        INFRASPECIFIC_RANK            <- "f."
                        gap_f <- regexpr(pattern = "f\\. ", text = author_temp) + nchar("f.")
                        position_f <- regexpr(pattern = "f\\.", text = taxon)[[1]][1] ### the first f. is the forma
                        position_white_space <- regexpr(pattern = "", text = taxon)[[1]]
                        location_species_end <- position_white_space[2]
                        AUTHOR_OF_SPECIES_temp <- replace_space(substr(taxon, start = location_species_end, stop = position_f - 1))
                        AUTHOR_OF_SPECIES <- ifelse(is.na(AUTHOR_OF_SPECIES_temp), "", AUTHOR_OF_SPECIES_temp)
                        part_INFRASP_EP_AUTHOR_OF_INFRASP <- replace_space(substr(author_temp, start = gap_f + 1, stop = nchar(author_temp)))
                    } else {
                        INFRASPECIFIC_RANK            <- ""
                        part_INFRASP_EP_AUTHOR_OF_INFRASP <- ""
                        AUTHOR_OF_SPECIES <- replace_space(substr(author_temp, start = 1, stop = nchar(author_temp)))
                    }
                }
            }
        } else {
            part_INFRASP_EP_AUTHOR_OF_INFRASP <- ""
        }
        
        ##part_INFRASP_EP_AUTHOR_OF_INFRASP <- replace_space(substr(author_temp, start = gap_var_or_subsp + 1, stop = nchar(author_temp)))
        gap4 <- regexpr(pattern = " ", text = part_INFRASP_EP_AUTHOR_OF_INFRASP)
        if(gap4 > 0){
            INFRASPECIFIC_EPITHET         <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = 1, stop = gap4 - 1 ))
            AUTHOR_OF_INFRASPECIFIC_RANK  <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = gap4 + 1, stop = nchar(part_INFRASP_EP_AUTHOR_OF_INFRASP)))
        } else {
            INFRASPECIFIC_EPITHET         <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = 1, stop = nchar(part_INFRASP_EP_AUTHOR_OF_INFRASP)))
            if(INFRASPECIFIC_EPITHET %in% strsplit(AUTHOR_OF_SPECIES, " ")[[1]]){
                INFRASPECIFIC_EPITHET <- ""
            }
        }
        
        if(!grepl(" ", taxon)){
            GENUS = taxon
            SPECIES                       <- ""
            AUTHOR_OF_SPECIES             <- ""
            INFRASPECIFIC_RANK            <- ""
            INFRASPECIFIC_EPITHET         <- ""
            AUTHOR_OF_INFRASPECIFIC_RANK  <- ""
        }
        
        res <- c(taxon                        ,
                 GENUS                        ,
                 SPECIES                      ,
                 AUTHOR_OF_SPECIES            ,
                 INFRASPECIFIC_RANK           ,
                 INFRASPECIFIC_EPITHET        ,
                 AUTHOR_OF_INFRASPECIFIC_RANK )
        names(res) <- c("TAXON_PARSED"                        ,
                        "GENUS_PARSED"                        ,
                        "SPECIES_PARSED"                      ,
                        "AUTHOR_OF_SPECIES_PARSED"            ,
                        "INFRASPECIFIC_RANK_PARSED"           ,
                        "INFRASPECIFIC_EPITHET_PARSED"        ,
                        "AUTHOR_OF_INFRASPECIFIC_RANK_PARSED" )
        return(res)
    }
    
    res <- data.frame(t(sapply(taxa, parse_taxon, USE.NAMES = FALSE)), stringsAsFactors = FALSE)
    return(res)
}
