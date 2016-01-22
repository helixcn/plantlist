.onAttach <- function(libname, pkgname){
    Sys.setlocale("LC_ALL", "US")
    packageStartupMessage(paste("This is plantlist ", packageVersion("plantlist"),". ", sep = ""))
}
