CTPL2 <- function (infile = NULL, outfile = "result_CTPL2.xlsx") 
{
    # In case if plantlist::CTPL is called.
    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        # Ensure that Chinese Characters could be displayed properly.
        suppressMessages(Sys.setlocale(category = "LC_ALL", locale = "Chinese"))
    }

  taxa <- openxlsx::read.xlsx(xlsxFile = infile) 
  #### By default, the first row will be used as column names
  if ("SPCN_CTPL2" %in% colnames(taxa)[-1]){
    warning("Only the first column could be called 'SPCN_CTPL2'")
  }
  colnames(taxa) <- c("SPCN_CTPL2", colnames(taxa)[-1])
  cnplants_dat = plantlist::cnplants_dat
  res <- merge(x = taxa, y = cnplants_dat, by.x = "SPCN_CTPL2", 
               by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)
  openxlsx::write.xlsx(res, outfile)
  print(paste("File '", outfile, 
        "' has been saved to:\n'", 
        getwd(), 
        "'", sep = ""))
  return(invisible(res))
}
