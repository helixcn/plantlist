## Welcome to the Homepage of plantlist

plantlist is an R package for checking the status of a scientific name of higher plants based on The Plant List Version 1.1 (http://www.theplantlist.org/). It also has functions for Searching the Chinese Names and Making checklist of plants.

### How to install?

```R
library(devtools)
install_github("helixcn/plantlist")
```

If you haven't had devtools installed, please install it by typing

```R
install.packages("devtools")
```

in R console.

### How to use?

```R
library(plantlist)

### Check the status of a scientific name (with or without authorship)

status("Hypoxis filifolia")

### Subspecies (with or without authorship)

status("Hypoxis kilimanjarica subsp. kilimanjarica")

### Variaty (with or without authorship)

status("Hypoxis erecta var. aestivalis")

### Form (with or without authorship)

status("Hypoxis hirsuta f. villosissima")

### Important Warning: Since 'f.' is also used in the authorship,
### please do not provide the author name for the species when
### it is a form. Eg.
### "Hypoxis hirsuta (L.) Coville f. vollosissima Fernald".
### The function parse_taxa() inside the status()
### function will not be able to parse the name correctly.
### Therefore a form should always be provided as:
### "Hypoxis hirsuta f. vollosissima Fernald"
### or "Hypoxis hirsuta f. vollosissima".

### Check the family/Order/family number for vascular plants
TPL("Hypoxis")
TPL("Hypoxis hirsuta")

### Create a Family/Genus/Species Table for Phylomatic Software

sp <- c( "Ranunculus japonicus", "Anemone udensis",
         "Ranunculus repens", "Ranunculus chinensis",
         "Solanum nigrum", "Punica sp." )
res <- TPL(sp)
taxa.table(res)
```

For more information, please refer to the manual for each function.

Please feel free to send an email to the package maintainer **Jinlong Zhang** if you have any question or comments about this package.


# Citation

From 0.7.2 onwards, the plantlist package uses a database of Chinese Names compiled by Dr. **LIU Bing** (Institute of Botany, Chinese Academy of Sciences), Dr. **LIU Su** (The Shanghai Chenshan Botanical Garden), Mr. **FENG Zhenhao** and Mr. **JIANG Kaiwen** (Southwest Forestry University) *et al.*. The maintainer would like to thank the authors for allowing the usage of their database. Any bugs/errors in the R functions, help files (Rd files) or the vignettes are the responsibility of the package maintainer, not the author of the database.

For more information, please refer to http://duocet.ibiodiversity.net/

If you use `plantlist` in your study, please cite it:

- Jinlong Zhang, Bing Liu, Su Liu, Zhenhao Feng and Kaiwen Jiang
  **(year)**. plantlist: Looking Up the Status of Plant Scientific Names
  based on The Plant List Database, Searching the Chinese Names and
  Making checklists of plants. R package version **(X.X.X)**
  https://github.com/helixcn/plantlist/


# Disclaimer

Partially from the MIT license (https://opensource.org/licenses/MIT).

"THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."

