.onAttach <- function(libname, pkgname){
    
    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        # Ensure that Chinese Characters could be displayed properly.
        suppressMessages(Sys.setlocale(category = "LC_ALL", locale = "Chinese"))
    }

    packageStartupMessage(paste("This is plantlist ", packageVersion("plantlist"),". ", sep = ""))
}
