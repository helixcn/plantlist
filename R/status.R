### if(getRversion() >= "2.15.1")  utils::globalVariables(c("acc_dat", "syn_dat"))
##assign("acc_dat", acc_dat, envir = .GlobalEnv)
##assign("syn_dat", syn_dat, envir = .GlobalEnv)

status <- function (species = NA, exact = TRUE, spell_error_max = NULL){
    parse_taxa <- function(taxa){
        parse_taxon <- function(taxon){
            replace_space <- function(x) {
                gsub("^[[:space:]]+|[[:space:]]+$", "", x)
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
            
            ### Parse Author
            if(!grepl("var.|subsp.", author_temp)){
                AUTHOR_OF_SPECIES <- author_temp
            } else {
                gap3 <- regexpr(pattern = " ", text = author_temp)
                
                if(grepl("var.", author_temp)){
                    INFRASPECIFIC_RANK            <- "var."
                    gap_var_or_subsp <- regexpr(pattern = "var.", text = author_temp) + nchar("var.")
                    AUTHOR_OF_SPECIES <- replace_space(substr(author_temp, start = 1, stop = gap_var_or_subsp - nchar("var.") -1))
                } else {
                    if(grepl("subsp.", author_temp)){
                          INFRASPECIFIC_RANK            <- "subsp."
                          gap_var_or_subsp <- regexpr(pattern = "subsp.", text = author_temp) + nchar("subsp.")
                          AUTHOR_OF_SPECIES <- replace_space(substr(author_temp, start = 1, stop = gap_var_or_subsp - nchar("subsp.") -1))
                        }
                }
                
                part_INFRASP_EP_AUTHOR_OF_INFRASP <- replace_space(substr(author_temp, start = gap_var_or_subsp + 1, stop = nchar(author_temp)))
                gap4 <- regexpr(pattern = " ", text = part_INFRASP_EP_AUTHOR_OF_INFRASP)
                if(gap4 > 0){
                    INFRASPECIFIC_EPITHET         <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = 1, stop = gap4 - 1 ))
                    AUTHOR_OF_INFRASPECIFIC_RANK  <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = gap4 + 1, stop = nchar(part_INFRASP_EP_AUTHOR_OF_INFRASP)))
                } else {
                    INFRASPECIFIC_EPITHET         <- replace_space(substr(part_INFRASP_EP_AUTHOR_OF_INFRASP, start = 1, stop = nchar(part_INFRASP_EP_AUTHOR_OF_INFRASP)))
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


    status_each <- function(species = NA, exact = TRUE, spell_error_max = NULL){
        acc_dat <- plantlist::acc_dat
        syn_dat <- plantlist::syn_dat
        if(is.na(species) | species=="" | species == " "){
            stop("Species must be specify")    
        }
        if(!exact){
            if(!is.null(spell_error_max)){
                res_accepted <- acc_dat[agrep(species, acc_dat$SCIENTIFIC_NAME, max.distance = spell_error_max, ignore.case = TRUE),]
                res_syn <- syn_dat[agrep(species, syn_dat$SCIENTIFIC_NAME, max.distance = spell_error_max, ignore.case = TRUE),]
            } else {
                res_accepted <- acc_dat[grep(species, acc_dat$SCIENTIFIC_NAME, ignore.case = TRUE),]
                res_syn <- syn_dat[grep(species, syn_dat$SCIENTIFIC_NAME, ignore.case = TRUE),]
            }
        }else{
                res_accepted <- acc_dat[acc_dat$SCIENTIFIC_NAME %in% species,]
                res_syn <- syn_dat[syn_dat$SCIENTIFIC_NAME %in% species,]
        }
        
        res_accepted <- cbind(res_accepted, res_accepted$ID,res_accepted$SCIENTIFIC_NAME,res_accepted$AUTHOR)
        colnames(res_accepted) <- c("ID", "FAMILY", "SCIENTIFIC_NAME", "AUTHOR", "STATUS", "ACCEPTED_ID", "ACCEPTED_SPECIES", "ACCEPTED_AUTHOR")
        res_syn_ordered <- res_syn[order(res_syn$ACCEPTED_ID), ] 
        
        ### select the accepted names based on the ACCEPTED_ID of the synonyms
        res_syn_temp <- acc_dat[acc_dat$ID %in% res_syn_ordered$ACCEPTED_ID, ]
        res_syn_temp_ordered <- res_syn_temp[order(res_syn_temp$ID),]
        
        ### repeat ACCEPTED_SP according to the accepted ID in res_syn_ordered
        ACCEPTED_SPECIES <- rep(as.character(res_syn_temp_ordered$SCIENTIFIC_NAME), table(as.character(res_syn_ordered$ACCEPTED_ID)))
        ### repeat ACCEPTED_AUTHOR
        ACCEPTED_AUTHOR <- rep(as.character(res_syn_temp_ordered$AUTHOR), table(as.character(res_syn_ordered$ACCEPTED_ID)))
        ### repear ACCEPTED_IDDDD:::: This is to test if there the result is correct or not. 
        ### ACCEPTED_IDDDD <- rep(as.character(res_syn_temp_ordered$ID), table(as.character(res_syn_ordered$ACCEPTED_ID)))
        syn <- cbind(res_syn_ordered, ACCEPTED_SPECIES, ACCEPTED_AUTHOR)
        res_final <- rbind(res_accepted, syn)
        colnames_res <- colnames(res_final)
        if(nrow(res_final) == 0){ ### Ensure the species not found are kept. 
            res_final <- t(data.frame(rep(NA, ncol(res_final))))
            colnames(res_final) <- colnames_res
            rownames(res_final) <- NULL
        } 
        SEARCH = rep(species, nrow(res_final))
        return(data.frame(SEARCH, res_final))
    }
    
    #### Parse Taxa so the species with names could be processed. 
    res_parse <- parse_taxa(species)
    species <- paste(res_parse$GENUS_PARSED, res_parse$SPECIES_PARSED ,                    
                     res_parse$INFRASPECIFIC_RANK_PARSED, res_parse$INFRASPECIFIC_EPITHET_PARSED )
                     
    Cap <- function(x) {
        paste(toupper(substring(x, 1, 1)), tolower(substring(x, 
            2)), sep = "")
    }
    if (is.data.frame(species)) {
        species <- as.vector(species)
    }
    species <- gsub("^[[:space:]]+|[[:space:]]+$", "", species)
    species <- Cap(species)
    res_seed <- status_each("nothing to search")
    temp_count <- seq(0, length(species), by = 5)  ### Counter
    temp_count[1] <- 1
    print(paste(length(species), "name(s) to process."))
    
    for(i in 1:length(species)){
        res_seed <- rbind(res_seed, status_each(species[i], exact = exact, spell_error_max = spell_error_max))
        
        if(length(species) > 5){  ### Imply the progress of printing
            if(i %in% temp_count){
                print(paste("Checking the status for species: ", i, species[i]))
            }
        }
    }
    res_seed$AUTHOR <- iconv(res_seed$AUTHOR, from = "UTF-8", to = "utf8")
    res_seed$ACCEPTED_AUTHOR <- iconv(res_seed$ACCEPTED_AUTHOR, from = "UTF-8", to = "utf8")
    return(res_seed[-1,])
}
