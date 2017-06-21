TPL <- function (plant.names = NULL) {    
    options(stringsAsFactors = FALSE)
    if (is.null(plant.names)) {
        stop("At least one plant species or genus should be provided.")
    }
    get.genus <- function(x) {
        Cap <- function(x) {
            paste(toupper(substring(x, 1, 1)), tolower(substring(x, 
                2)), sep = "")
        }
        if (is.data.frame(x)) {
            x <- as.vector(x)
        }
        x <- gsub("^[[:space:]]+|[[:space:]]+$", "", x)
        x <- Cap(x)
        first <- substr(x, 1, 1)
        start.point <- 2
        if (min(regexpr(" ", x)) > 1) {
            end.point <- regexpr(" ", x)
            second <- substr(x, start.point, end.point - 1)
        }
        else {
            x <- paste(x, " ")
            end.point <- regexpr(" ", x)
            second <- substr(x, start.point, end.point - 1)
        }
        return(paste(first, second, sep = ""))
    }
    
    APGIII_GENERA.path <- system.file("extdata", "APGIII_GENERA.csv", package = "plantlist")
    APGIII_ORDERS.path <- system.file("extdata", "APGIII_ORDERS.csv", package = "plantlist")
    
    APGIII_GENERA <- read.csv(APGIII_GENERA.path, header = TRUE, stringsAsFactors = FALSE)
    APGIII_ORDERS <- read.csv(APGIII_ORDERS.path, header = TRUE, stringsAsFactors = FALSE)
    
    genus <- get.genus(plant.names)
    genus <- data.frame(YOUR_SPECIES = plant.names, YOUR_GENUS = genus)
    
    res1 <- merge(x = genus, y = APGIII_GENERA, by.x = "YOUR_GENUS", 
        by.y = "GENUS", sort = FALSE, all.x = TRUE)

    res <- merge(x = res1, y = APGIII_ORDERS, by.x = "FAMILY",by.y = "APGIII_FAMILY",  
        sort = FALSE, all.x = TRUE)
    
    return(data.frame(YOUR_SEARCH = res$YOUR_SPECIES, POSSIBLE_GENUS = res$YOUR_GENUS, 
        FAMILY = res$FAMILY, ORDER = res$APGIII_ORDER, FAMILY_NUMBER = res$APGIII_NUMBER, 
        GROUP = res$GROUP       
        ))
}
