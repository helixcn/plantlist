make_checklist <-
    function(checklist_dat = NULL,
             outfile = "output_make_checklist.md",
             theme = c("complex", "simple", "minimal")) {
        if (any(is.na(checklist_dat$SPECIES_FULL))) {
            warning(paste(
                "Taxa",
                paste(
                    checklist_dat$YOUR_SEARCH[is.na(checklist_dat$SPECIES_FULL)],
                    collapse = ", ",
                    sep = ""
                )
            ),
            " does not have full scientific name, ignored\n",
            sep = "")
            checklist_dat <-
                checklist_dat[!is.na(checklist_dat$SPECIES_FULL),]
        }
        # checklist_dat <- na.omit(checklist_dat)
        theme <- match.arg(theme)
        # Give each group a number
        checklist_dat$GROUP <-
            ifelse(
                checklist_dat$GROUP == "Ferns and lycophytes",
                paste("2", checklist_dat$GROUP),
                checklist_dat$GROUP
            )
        checklist_dat$GROUP <- ifelse(is.na(checklist_dat$GROUP),
                                      "",                              checklist_dat$GROUP)
        checklist_dat$GROUP <-
            ifelse(
                checklist_dat$GROUP == "Gymnosperms",
                paste("3", checklist_dat$GROUP),
                checklist_dat$GROUP
            )
        checklist_dat$GROUP <-
            ifelse(
                checklist_dat$GROUP == "Angiosperms",
                paste("4", checklist_dat$GROUP),
                checklist_dat$GROUP
            )
        
        checklist_dat$FAMILY_NUMBER <-
            gsub("[^0-9]", "", checklist_dat$FAMILY_NUMBER)
        
        # parse_taxa
        parsed_taxa_df <-
            unique(parse_taxa(na.omit(checklist_dat$SPECIES_FULL)))
        checklist_dat2 <- merge(checklist_dat,
                                parsed_taxa_df,
                                by.x = "SPECIES_FULL",
                                by.y = "TAXON_PARSED")
        
        # reordering
        checklist_dat3 <- checklist_dat2[order(
            checklist_dat2$GROUP,
            checklist_dat2$FAMILY_NUMBER,
            checklist_dat2$SPECIES_FULL
        ),]
        checklist_dat3[is.na(checklist_dat3)] <- ""
        
        main_text <- character()
        
        group_list  <- unique(checklist_dat3$GROUP)
        
        for (m in 1:length(group_list)) {
            main_text <- c(main_text, paste("# ", group_list[m], sep = ""))
            temp_group_dat <-
                subset(checklist_dat3, checklist_dat3$GROUP == group_list[m])
            
            family_list <- unique(temp_group_dat$FAMILY)
            if (theme == "complex") {
                for (i in 1:length(family_list)) {
                    temp_family_dat <-
                        subset(temp_group_dat,
                               temp_group_dat$FAMILY == family_list[i])
                    # Family Title
                    main_text <-
                        c(main_text, "", paste(unique(
                            paste(
                                "## ",
                                paste(
                                    as.numeric(temp_family_dat$FAMILY_NUMBER),
                                    temp_family_dat$FAMILY_CN,
                                    temp_family_dat$FAMILY
                                ),
                                sep = ""
                            )
                        ), collapse = ""))
                    temp_genera_list <-
                        sort(unique(temp_family_dat$GENUS))
                    for (j in 1:length(temp_genera_list)) {
                        temp_genera_dat <-
                            subset(temp_family_dat,
                                   temp_family_dat$GENUS == temp_genera_list[j])
                        # Genus Title
                        main_text <-
                            c(main_text,
                              "",
                              paste(unique(
                                  paste(
                                      "###",
                                      temp_genera_dat$GENUS,
                                      temp_genera_dat$GENUS_AUTHOR,
                                      temp_genera_dat$GENUS_CN
                                  )
                              ), collapse = ""))
                        
                        temp_species_list <-
                            sort(unique(temp_genera_dat$SPECIES_FULL))
                        for (k in 1:length(temp_species_list)) {
                            temp_species_dat <-
                                subset(
                                    temp_genera_dat,
                                    temp_genera_dat$SPECIES_FULL == temp_species_list[k]
                                )
                            main_text <- c(
                                main_text,
                                "",
                                c(
                                    # Species Chinese Name
                                    paste(
                                        "**",
                                        unique(temp_species_dat$SPECIES_CN),
                                        "**",
                                        sep = "",
                                        collapse = ""
                                    ),
                                    "",
                                    
                                    # Scientific Name
                                    #if(temp_species_dat$SPECIES_FULL == ""){
                                    #    paste("Error: Scientific Name Not Found")
                                    #} else {
                                    paste(unique(
                                        paste(
                                            "**",
                                            temp_species_dat$GENUS_PARSED,
                                            "**",
                                            " **",
                                            temp_species_dat$SPECIES_PARSED,
                                            "** ",
                                            temp_species_dat$AUTHOR_OF_SPECIES_PARSED,
                                            temp_species_dat$INFRASPECIFIC_RANK_PARSED,
                                            ifelse(
                                                temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                "",
                                                "**"
                                            ),
                                            temp_species_dat$INFRASPECIFIC_EPITHET_PARSED,
                                            ifelse(
                                                temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                "",
                                                "**"
                                            ),
                                            temp_species_dat$AUTHOR_OF_INFRASPECIFIC_RANK_PARSED,
                                            sep = ""
                                        )
                                    ), collapse = " "),
                                    #},
                                    "",
                                    paste(
                                        "**Specimens:**",
                                        ifelse(
                                            unique(temp_species_dat$SPECIMENS) == "",
                                            "",
                                            paste(unique(
                                                temp_species_dat$SPECIMENS
                                            ))
                                        ),
                                        collapse = ""
                                    ),
                                    "",
                                    paste(
                                        "**IUCN status:**",
                                        ifelse(
                                            unique(temp_species_dat$IUCN_CHINA) == "",
                                            "",
                                            paste(
                                                unique(temp_species_dat$IUCN_CHINA)
                                            )
                                        ),
                                        collapse = ""
                                    ),
                                    "",
                                    paste(
                                        "**Habitat:**",
                                        ifelse (
                                            unique(temp_species_dat$HABITAT) == "",
                                            "",
                                            paste(unique(
                                                temp_species_dat$HABITAT
                                            ))
                                        ),
                                        collapse = ""
                                    ),
                                    "",
                                    paste(
                                        "**Altitude:**",
                                        ifelse(
                                            unique(temp_species_dat$ALTITUDE) == "",
                                            "",
                                            paste(unique(
                                                temp_species_dat$ALTITUDE
                                            ))
                                        ),
                                        collapse = ""
                                    ),
                                    "",
                                    paste(
                                        "**Distribution:**",
                                        ifelse(
                                            unique(
                                                temp_species_dat$PROVINTIAL_DISTRIBUTION
                                            ) == "",
                                            "",
                                            paste(
                                                unique(
                                                    temp_species_dat$PROVINTIAL_DISTRIBUTION
                                                )
                                            )
                                        ),
                                        collapse = ""
                                    ),
                                    " ",
                                    " ",
                                    " "
                                )
                            )
                        }
                        
                    }
                    
                }
            }
            
            if (theme == "simple") {
                for (i in 1:length(family_list)) {
                    temp_family_dat <-
                        subset(temp_group_dat,
                               temp_group_dat$FAMILY == family_list[i])
                    # Family Title
                    main_text <-
                        c(main_text, "", paste(unique(
                            paste(
                                "## ",
                                paste(
                                    as.numeric(temp_family_dat$FAMILY_NUMBER),
                                    temp_family_dat$FAMILY_CN,
                                    temp_family_dat$FAMILY
                                ),
                                sep = ""
                            )
                        ), collapse = ""))
                    temp_genera_list <-
                        sort(unique(temp_family_dat$GENUS))
                    for (j in 1:length(temp_genera_list)) {
                        temp_genera_dat <-
                            subset(temp_family_dat,
                                   temp_family_dat$GENUS == temp_genera_list[j])
                        # Genus Title
                        main_text <-
                            c(main_text,
                              "",
                              paste(unique(
                                  paste(
                                      "###",
                                      temp_genera_dat$GENUS,
                                      temp_genera_dat$GENUS_AUTHOR,
                                      temp_genera_dat$GENUS_CN
                                  )
                              ), collapse = ""))
                        
                        temp_species_list <-
                            sort(unique(temp_genera_dat$SPECIES_FULL))
                        for (k in 1:length(temp_species_list)) {
                            temp_species_dat <-
                                subset(
                                    temp_genera_dat,
                                    temp_genera_dat$SPECIES_FULL == temp_species_list[k]
                                )
                            main_text <- c(main_text,
                                           "",
                                           c(
                                               # Species Chinese Name
                                               paste(
                                                   "**",
                                                   unique(temp_species_dat$SPECIES_CN),
                                                   "**",
                                                   sep = "",
                                                   collapse = ""
                                               ),
                                               # Scientific Name
                                               # if(temp_species_dat$SPECIES_FULL == ""){
                                               #    paste("Error: Scientific Name Not Found")
                                               #} else {
                                               
                                               paste(unique(
                                                   paste(
                                                       "**",
                                                       temp_species_dat$GENUS_PARSED,
                                                       "**",
                                                       " **",
                                                       temp_species_dat$SPECIES_PARSED,
                                                       "** ",
                                                       temp_species_dat$AUTHOR_OF_SPECIES_PARSED,
                                                       temp_species_dat$INFRASPECIFIC_RANK_PARSED,
                                                       ifelse(
                                                           temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                           "",
                                                           "**"
                                                       ),
                                                       temp_species_dat$INFRASPECIFIC_EPITHET_PARSED,
                                                       ifelse(
                                                           temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                           "",
                                                           "**"
                                                       ),
                                                       temp_species_dat$AUTHOR_OF_INFRASPECIFIC_RANK_PARSED,
                                                       sep = ""
                                                   )
                                               ), collapse = " "),
                                               # },
                                               #  "",
                                               paste(
                                                   "**Specimens:**",
                                                   ifelse(
                                                       any(is.na(
                                                           temp_species_dat$SPECIMENS
                                                       )) | any(temp_species_dat$SPECIMENS == ""),
                                                       paste(na.omit(
                                                           unique(temp_species_dat$SPECIMENS)
                                                       ), collapse = ","),
                                                       paste(
                                                           unique(temp_species_dat$SPECIMENS),
                                                           collapse = ""
                                                       )
                                                   ),
                                                   collapse = ""
                                               ),
                                               "",
                                               ""
                                           ))
                        }
                        
                    }
                    
                }
            }
            
            if (theme == "minimal") {
                for (i in 1:length(family_list)) {
                    temp_family_dat <-
                        subset(temp_group_dat,
                               temp_group_dat$FAMILY == family_list[i])
                    # Family Title
                    main_text <-
                        c(main_text, "", paste(unique(
                            paste(
                                "## ",
                                paste(
                                    as.numeric(temp_family_dat$FAMILY_NUMBER),
                                    temp_family_dat$FAMILY_CN,
                                    temp_family_dat$FAMILY
                                ),
                                sep = ""
                            )
                        ), collapse = ""))
                    temp_genera_list <-
                        sort(unique(temp_family_dat$GENUS))
                    for (j in 1:length(temp_genera_list)) {
                        temp_genera_dat <-
                            subset(temp_family_dat,
                                   temp_family_dat$GENUS == temp_genera_list[j])
                        temp_species_list <-
                            sort(unique(temp_genera_dat$SPECIES_FULL))
                        for (k in 1:length(temp_species_list)) {
                            temp_species_dat <-
                                subset(
                                    temp_genera_dat,
                                    temp_genera_dat$SPECIES_FULL == temp_species_list[k]
                                )
                            main_text <- c(main_text,
                                           "",
                                           c(
                                               # Species Chinese Name
                                               paste(
                                                   "**",
                                                   unique(temp_species_dat$SPECIES_CN),
                                                   "**",
                                                   sep = "",
                                                   collapse = ""
                                               ),
                                               # Scientific Name
                                               #if(temp_species_dat$SPECIES_FULL == ""){
                                               #    paste("Error: Scientific Name Not Found")
                                               #} else {
                                               
                                               paste(unique(
                                                   paste(
                                                       "**",
                                                       temp_species_dat$GENUS_PARSED,
                                                       "**",
                                                       " **",
                                                       temp_species_dat$SPECIES_PARSED,
                                                       "** ",
                                                       temp_species_dat$AUTHOR_OF_SPECIES_PARSED,
                                                       temp_species_dat$INFRASPECIFIC_RANK_PARSED,
                                                       ifelse(
                                                           temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                           "",
                                                           "**"
                                                       ),
                                                       temp_species_dat$INFRASPECIFIC_EPITHET_PARSED,
                                                       ifelse(
                                                           temp_species_dat$INFRASPECIFIC_EPITHET_PARSED == "",
                                                           "",
                                                           "**"
                                                       ),
                                                       temp_species_dat$AUTHOR_OF_INFRASPECIFIC_RANK_PARSED,
                                                       sep = ""
                                                   )
                                               ), collapse = " "),
                                               #},
                                               "",
                                               ""
                                           ))
                        }
                        
                    }
                    
                }
            }
        }
        writeLines(main_text, outfile, useBytes = TRUE)
        cat("File", outfile, "has been saved to:\n", getwd(), "\n")
    }
