CTPL2 <- function(infile = NULL, outfile = "result_cnplants.xlsx"){
    taxa <- read.xlsx(xlsxFile = infile)
    colnames(taxa) <- "TAXA_NAME"
    cnplants = plantlist::cnplants
    res <- merge(x = taxa, y = cnplants, by.x = "TAXA_NAME", by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)
    write.xlsx(res, outfile)
    print(paste("File '", outfile, "' has been saved to '", getwd(), "'",sep = ""))
    return(invisible(res))
}
