## Welcome to the Homepage of plantlist

plantlist is an R package for checking the status of a scientific name for higher plants. Its database was based on The Plant List Website. 

### How to install?

```library(devtools)
install_github("helixcn/plantlist")`
```R

If you haven't had devtools installed, please install it by typing 

```
install.packages("devtools")"
```R

in R console.

### How to use?

```
library(plantlist) 
```R

Check the status of a scientific name (with or without authorship)

```
status("Hypoxis filifolia")
```R

Subspecies (with or without authorship)

```
status("Hypoxis kilimanjarica subsp. kilimanjarica")
```R

Variaty (with or without authorship)

```
status("Hypoxis erecta var. aestivalis")
```R

Form (with or without authorship)

```
status("Hypoxis hirsuta f. villosissima")
```R

Important Warning: Because 'f.' is also used in the authorship, 
please do not provide the author name for the species when 
it is a form. Eg. 
"Hypoxis hirsuta (L.) Coville f. vollosissima Fernald". 
The function parse_taxa() inside the status() 
function will not be able to parse the name correctly. 
Therefore a form should always be provided as: 
"Hypoxis hirsuta f. vollosissima Fernald" 
or "Hypoxis hirsuta f. vollosissima". 

### Check the family/Order/family number for vascular plants

```
TPL("Hypoxis")
TPL("Hypoxis hirsuta")
```R

### Create a Family/Genus/Species Table for Phylomatic Software

```
sp <- c( "Ranunculus japonicus", "Anemone udensis", 
         "Ranunculus repens", "Ranunculus chinensis", 
         "Solanum nigrum", "Punica sp." ) 
res <- TPL(sp)
taxa.table(res)
```R

### For detailed help, please look at the manual for each function. 


Please feel free to send an email to the package maintainer **Dr. Jinlong Zhang** if you have any question or comments about this package.
