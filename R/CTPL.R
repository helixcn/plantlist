CTPL <- function(taxa = NULL, print_as_list = TRUE){
    options(stringsAsFactors = FALSE)
    if(length(taxa) == 1){
        if(any(unique(taxa) == "")){
            stop("taxa is empty, please provide provide scientific or Chinese name(s)")
        }
    }
    if(any(taxa == ""|is.null(taxa))){
        stop("At least one taxa is empty, can not search")
    }

    taxa <- enc2utf8(taxa)
    #taxa <- data.frame(taxa)
    #colnames(taxa) <- "TAXA_NAME"

    cnplants_dat = plantlist::cnplants_dat

    ## Tool function
    Cap <- function(x) {
        paste(toupper(substring(x, 1, 1)), tolower(substring(x, 2)), sep = "")
    }

    ## Tool function, replace multiple white space
    REPLACE <- function(x) {
            if (length(x) > 1) {
                stop("only one string is allowed")
            }
            bbb <- gsub(" +", " ", gsub(",+", ", ", 
                gsub(", +", ",", x)))
            bbb <- gsub("^[[:space:]]+|[[:space:]]+$", "", 
                bbb)
            endchar <- substr(bbb, nchar(bbb), nchar(bbb))
            if (endchar == ",") {
                yyy <- gregexpr(pattern = ",", bbb)
                res <- substr(bbb, start = 1, stop = ifelse(unlist(lapply(yyy, 
                    function(x) {
                      max(x) - 1
                    })) > 1, unlist(lapply(yyy, function(x) {
                    max(x) - 1
                })), nchar(bbb)))
            }
            else {
                res <- bbb
            }
            res <- gsub("^[[:space:]]+|[[:space:]]+$", "", res)
            return(res)
    }

    YOUR_SEARCH = Cap(sapply(taxa, REPLACE, USE.NAMES = FALSE))


    SPECIES_CN <- cnplants_dat$SPECIES_CN
    SPECIES <- cnplants_dat$SPECIES

    res0 <- cnplants_dat[1,]
    res_empty <- t(data.frame(rep(NA, ncol(cnplants_dat[1,]))))
    colnames(res_empty) <- colnames(cnplants_dat)

    rep_id <- c() # Count number of times the element needs to repeat.
    for(i in 1:length(YOUR_SEARCH)){
        selected_index <-  SPECIES_CN %in% YOUR_SEARCH[i] | SPECIES %in% YOUR_SEARCH[i]
        if(any(selected_index > 0)){
             res0 <- rbind(res0, cnplants_dat[selected_index,])
             rep_id[i] <- table(selected_index)[2]
             if(table(selected_index)[2] > 1){
                 warning(paste("Taxa: '", YOUR_SEARCH[i], "' matched more than one row.", collapse = "", sep = "")) 
             }
        } else {
             res0 <- rbind(res0, res_empty)
             rep_id[i] <- 1
        }
    }

    res1 <- res0[2:nrow(res0),]
    res <- data.frame(YOUR_SEARCH = rep(taxa, rep_id), res1)
    row.names(res) <- 1:nrow(res)
    if(print_as_list){
        if(nrow(res) > 6){
            cat("Note: too many rows, only the first few were printed")
        }
        print.listof(head(res)) # Only the first few species will be printed
        return(invisible(res))
    } else {
        return(res)
    }
}
