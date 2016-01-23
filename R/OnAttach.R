.onAttach <- function(libname, pkgname){
    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        Sys.setlocale("LC_ALL", "US")
    }
    packageStartupMessage(paste("This is plantlist ", packageVersion("plantlist"),". ", sep = ""))
}
