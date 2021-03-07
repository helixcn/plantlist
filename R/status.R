status <-
    function (species = NA,
              exact = TRUE,
              spell_error_max = NULL,
              detail = FALSE) {
        status_each <-
            function(species = NA,
                     exact = TRUE,
                     spell_error_max = NULL) {
                acc_dat <- plantlist::acc_dat
                syn_dat <- plantlist::syn_dat
                if (is.na(species) | species == "" | species == " ") {
                    stop("Species must be specify")
                }
                if (!exact) {
                    if (!is.null(spell_error_max)) {
                        res_accepted <-
                            acc_dat[agrep(
                                species,
                                acc_dat$SCIENTIFIC_NAME,
                                max.distance = spell_error_max,
                                ignore.case = TRUE
                            ), ]
                        res_syn <-
                            syn_dat[agrep(
                                species,
                                syn_dat$SCIENTIFIC_NAME,
                                max.distance = spell_error_max,
                                ignore.case = TRUE
                            ), ]
                    } else {
                        res_accepted <-
                            acc_dat[grep(species,
                                         acc_dat$SCIENTIFIC_NAME,
                                         ignore.case = TRUE), ]
                        res_syn <-
                            syn_dat[grep(species,
                                         syn_dat$SCIENTIFIC_NAME,
                                         ignore.case = TRUE), ]
                    }
                } else{
                    res_accepted <- acc_dat[acc_dat$SCIENTIFIC_NAME %in% species, ]
                    res_syn <-
                        syn_dat[syn_dat$SCIENTIFIC_NAME %in% species, ]
                }
                
                res_accepted <-
                    cbind(
                        res_accepted,
                        res_accepted$ID,
                        res_accepted$SCIENTIFIC_NAME,
                        res_accepted$AUTHOR
                    )
                colnames(res_accepted) <-
                    c(
                        "ID",
                        "FAMILY",
                        "SCIENTIFIC_NAME",
                        "AUTHOR",
                        "STATUS",
                        "ACCEPTED_ID",
                        "ACCEPTED_SPECIES",
                        "ACCEPTED_AUTHOR"
                    )
                res_syn_ordered <- res_syn[order(res_syn$ACCEPTED_ID),]
                
                ### select the accepted names based on the ACCEPTED_ID of the synonyms
                res_syn_temp <-
                    acc_dat[acc_dat$ID %in% res_syn_ordered$ACCEPTED_ID,]
                res_syn_temp_ordered <-
                    res_syn_temp[order(res_syn_temp$ID), ]
                
                ### repeat ACCEPTED_SP according to the accepted ID in res_syn_ordered
                ACCEPTED_SPECIES <-
                    rep(
                        as.character(res_syn_temp_ordered$SCIENTIFIC_NAME),
                        table(as.character(res_syn_ordered$ACCEPTED_ID))
                    )
                ### repeat ACCEPTED_AUTHOR
                ACCEPTED_AUTHOR <-
                    rep(as.character(res_syn_temp_ordered$AUTHOR),
                        table(as.character(res_syn_ordered$ACCEPTED_ID)))
                ### repear ACCEPTED_IDDDD:::: This is to test if there the result is correct or not.
                ### ACCEPTED_IDDDD <- rep(as.character(res_syn_temp_ordered$ID), table(as.character(res_syn_ordered$ACCEPTED_ID)))
                syn <-
                    cbind(res_syn_ordered, ACCEPTED_SPECIES, ACCEPTED_AUTHOR)
                res_final <- rbind(res_accepted, syn)
                colnames_res <- colnames(res_final)
                if (nrow(res_final) == 0) {
                    ### Ensure the species not found are kept.
                    res_final <- t(data.frame(rep(NA, ncol(
                        res_final
                    ))))
                    colnames(res_final) <- colnames_res
                    rownames(res_final) <- NULL
                }
                SEARCH = rep(species, nrow(res_final))
                return(data.frame(SEARCH, res_final))
            }
        
        #### Parse Taxa so the species with names could be processed.
        res_parse <- parse_taxa(species)
        species <-
            paste(
                res_parse$GENUS_PARSED,
                res_parse$SPECIES_PARSED ,
                res_parse$INFRASPECIFIC_RANK_PARSED,
                res_parse$INFRASPECIFIC_EPITHET_PARSED
            )
        
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
        
        for (i in 1:length(species)) {
            res_seed <-
                rbind(
                    res_seed,
                    status_each(
                        species[i],
                        exact = exact,
                        spell_error_max = spell_error_max
                    )
                )
            
            if (length(species) > 5) {
                ### Imply the progress of printing
                if (i %in% temp_count) {
                    print(paste("Checking the status for species: ", i, species[i]))
                }
            }
        }
        res_seed$AUTHOR <-
            iconv(res_seed$AUTHOR, from = "UTF-8", to = "utf8")
        res_seed$ACCEPTED_AUTHOR <-
            iconv(res_seed$ACCEPTED_AUTHOR, from = "UTF-8", to = "utf8")
        
        #### res_seed$AUTHOR <- res_seed$AUTHOR
        #### res_seed$ACCEPTED_AUTHOR <- res_seed$ACCEPTED_AUTHOR
        
        if (detail) {
            return(res_seed[-1, ])
        }
        results <-
            res_seed[-1, c("SEARCH",
                           "AUTHOR",
                           "STATUS",
                           "FAMILY",
                           "ACCEPTED_SPECIES",
                           "ACCEPTED_AUTHOR")]
        colnames(results) <-
            c(
                "SCIENTIFIC_NAME",
                "AUTHOR",
                "STATUS",
                "FAMILY",
                "ACCEPTED_SPECIES",
                "ACCEPTED_AUTHOR"
            )
        row.names(results) <- NULL
        return(results)
    }
