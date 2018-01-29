CTPL2 <- function (infile = NULL, outfile = "result_CTPL2.xlsx") 
{
  taxa <- read.xlsx(xlsxFile = infile) #### By default, the first row will be used as column names
  if ("SPCN_CTPL2" %in% colnames(taxa)[-1]){
    warning("Only the first column could be called 'SPCN_CTPL2'")
  }
  colnames(taxa) <- c("SPCN_CTPL2", colnames(taxa)[-1])
  cnplants = plantlist::cnplants
  res <- merge(x = taxa, y = cnplants, by.x = "SPCN_CTPL2", 
               by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)
  write.xlsx(res, outfile)
  print(paste("File '", outfile, "' has been saved to '", getwd(), 
              "'", sep = ""))
  return(invisible(res))
}
