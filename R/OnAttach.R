.onAttach <- function(libname, pkgname){
    packageStartupMessage(paste("This is plantlist ", packageVersion("plantlist"),". ", sep = ""))
}
