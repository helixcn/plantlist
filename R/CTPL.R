CTPL <- function(taxa = NULL, taxafile = NULL, outfile = "CTPL_results.csv"){

    options(stringsAsFactors = FALSE)
    if(is.null(taxa)&is.null(taxafile)){
        stop("at least taxa or taxafile should be specified")
    }
    if(!is.null(taxa)&!is.null(taxafile)){
        stop("taxa and taxafile should be not be specified at the same time")
    }
    if(is.null(taxa)){
        taxa <- read.csv(taxafile, header = TRUE, stringsAsFactors = FALSE)
    } else {
        taxa <- taxa
    }
    
    taxa <- data.frame(taxa)
    colnames(taxa) <- "TAXA_NAME"
    
    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        cn.path <- system.file("extdata", "CN_win.csv", package = "plantlist")
        dat <- read.csv(cn.path, header = TRUE)
    } else {
        cn.path <- system.file("extdata", "CN_linux.csv", package = "plantlist")
        dat <- read.csv(cn.path, header = TRUE)
    }
    
    res <- merge(x = taxa, y = dat, by.x = "TAXA_NAME", by.y = "NAME", sort = FALSE, all.x = TRUE)
    write.csv(res, outfile)
    print(paste("File '", outfile, "' has been saved to", getwd(), sep = ""))
    return(res)
}
