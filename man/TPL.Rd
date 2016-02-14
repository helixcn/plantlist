\name{TPL}
\alias{TPL}

\title{
Looking up Family, Family Number and Order in Modern Classification Systems.
}
\description{
This function enables the user to search the Family/Genus/Order for higher plants under modern Classification Systems. Genus/Families relationship came from the Plant list Website. }
\usage{
TPL(plant.names = NULL)
}

\arguments{
  \item{plant.names}{
 A characteristic vector containing the species or genus of flowering plants. 
}
}
\details{
This function search the Family, Family Number and Order for (1) Species (2) Genus (3) Family.
}
\value{
A data frame containing Genus (parsed from the string), Family (For Angiosperms: APGIII, For Gymnosperms: Christenhusz 2011, For lycophytes and ferns: Christenhusz 2011) orders. 
}
\note{

Please also pay attention to the following family names: 

Palmae= Arecaceae

Gramineae= Poaceae

Leguminosae= Fabaceae

Guttiferae= Clusiaceae

Cruciferae= Brassicaceae

Labiatae= Lamiaceae

Compositae= Asteraceae

Umbelliferae= Apiaceae

A small proportion of genus has been divided into several genera, even being placed into different families, this will lead to multiple entries for one enquiry. Pay attention to these issues. Users need to check the acceptance based on their own experiences or knowledge. They are: 
 
\code{Acanthocladium, Acanthodium, Acetosella, Acosta, Adelia,
 Agropogon, Alliaria, Amblytropis, Amelasorbus, Ammocalamagrostis,
 Anacampseros, Argyrautia, Arthraxon, Asplenosorus, Asteriscium, 
 Atomostigma, Balbisia, Banalia, Bartonia, Bassia, Benthamia, 
 Blechum, Blyttia, Bonapartea, Brachyloma, Brassocattleya, 
 Bridgesia, Brocchia, Brodiaea, Brugmansia, Bruguiera, Brya, 
 Bubbia, Bulbostylis, Burnettia, Calophyllum, Candollea, 
 Carduocirsium, Cedrus, Cephalopactis, Cladocolea, Coelidium,
 Condalia, Corynotheca, Craspedophyllum, Crepidophyllum, Ctenium,
 Cuspidaria, Cycnia, Cynoctonum, Cyrtanthus, Dactyloglossum, 
 Darcya, Dianthera, Distichia, Ditrichum, Donax, Drummondia, 
 Dryopteris, Dudleveria, Dunalia, Dusenia, Duvalia, Eria, 
 Eriosonia, Erucaria, Esenbeckia, Euchresta, Eucodonopsis, 
 Eustegia, Filicula, Flemingia, Froelichia, Gastrochilus, 
 Gerardia, Gertrudia, Gilibertia, Goeppertia, Griffithia, 
 Grimaldia, Guidonia, Gymnotheca, Gymnotraunsteinera, 
 Haemanthus, Harveya, Hedwigia, Heeria, Helicophyllum, 
 Heliohebe, Hepatica, Heteroneurum, Holboellia, Honckenya, 
 Hornschuchia, Humboldtia, Hutchinsonia, Hygrophila, 
 Hymenolepis, Hypopterygium, Isoloma, Joannesia, Jonesia, 
 Kaulfussia, Laeliocattleya, Lamprophyllum, Lasia, Laxmannia, 
 Lepidostemon, Leptopyrum, Lichtensteinia, Lightfootia, 
 Limnobium, Lophiocarpus, Lopholepis, Lumnitzera, Malacocarpus, 
 Mammea, Manettia, Mannia, Massularia, Mastigophora, Meeboldia, 
 Mertensia, Meyenia, Micranthus, Micromitrium, Miltonidium, 
 Mnium, Mollia, Moniera, Myconia, Myrmecophila, Myzorrhiza, 
 Neesia, Nivenia, Odontitella, Omalanthus, Onychium, 
 Orchidactyla, Orchigymnadenia, Orchiserapias, Oreocallis, 
 Ornithocidium, Oxymitra, Pachyneurum, Pachypodium, 
 Pachyveria, Pancovia, Panzeria, Parmentiera, Parsonsia, 
 Petagnia, Phalangium, Piquetia, Pityromeria, Platyloma, 
 Pleuridium, Polypodiopsis, Pseudadenia, Pseudinium, 
 Pseuditella, Pseudogaltonia, Pseudorhiza, Rauia, 
 Razoumofskya, Reinwardtia, Rhacoma, Rhynchocarpa, 
 Richardia, Richea, Roemeria, Roscoea, Rostellaria, 
 Roylea, Schmidtia, Schrebera, Sebastiania, Serapicamptis, 
 Silvia, Solena, Solenopsis, Solmsia, Sorbaronia, 
 Sorbopyrus, Spiranthera, Spirostachys, Stipularia, 
 Swartzia, Thomandersia, Tillandsia, Trichocyclus, Tricholepis, 
 Trisetokoeleria, Triticale, Triticosecale, Tulasnea, Uncaria,
 Urtica, Usteria, Vandopsis, Wahlenbergia, Waitzia, Washingtonia,
 Webera, Wedelia, Welwitschia, Wettsteinia, Wiborgia, Wilhelmsia,
 Zappania, Zieria, Ziziphus}

}
\references{
Bremer, Birgitta, K. Bremer, Mark Chase, Mike Fay, James Reveal, Douglas Soltis, Pamella Soltis and Peter Stevens. (2009) "An update of the Angiosperm Phylogeny Group classification for the orders and families of flowering plants: APG III." Botanical Journal of the Linnean Society.

Christenhusz, M., Zhang, X. C., and Schneider, H. (2011). A linear sequence of extant families and genera of lycophytes and ferns. Phytotaxa. 19:7-54

Christenhusz, M., Reveal, J., Farjon, A., Gardner, M. F., Mill, R. R., and Chase, M. W. (2011). A new classification and linear sequence of extant gymnosperms. Phytotaxa. 19:55-70

Haston, E., Richardson, J. E., Stevens, P. F., Chase, M. W. and Harris, D. J. (2009). The Linear Angiosperm Phylogeny Group (LAPG) III: a linear sequence of the families in APG III. Botanical Journal of the Linnean Society, 161(2), 128-131.

Liu Bing, Ye Jianfei , Liu Su, Wang Yuan, Yang Yong, Lai Yangjun, Zeng Gang and Lin Qinwen(2015). Families and genera of Chinese angiosperms: a synoptic classification based on APG III. Biodiversity Science. 23(2), 225-231.

Checklist of Genera of Higher Plants at the Plant List Website: \url{http://www.theplantlist.org/1.1/browse/-/-/}

}
\author{
Jinlong Zhang \email{ jinlongzhang01@gmail.com }
}

\seealso{
\code{\link{taxa.table}}, for generating taxa table for Phylomatic.
}
\examples{

TPL("Carex")
TPL("Apple")
splist <- c( "Ranunculus japonicus", 
             "Solanum nigrum", 
             "Punica sp.", 
             "Machilus", "Today", "####" ) 
res <- TPL(splist)
taxa.table(res)

TPL("Arecaceae")
TPL("Palmae")

TPL("Poaceae")
TPL("Gramineae")

TPL("Fabaceae")
TPL("Leguminosae")

TPL("Clusiaceae")
TPL("Guttiferae")

TPL("Brassicaceae")
TPL("Cruciferae")

TPL("Lamiaceae")
TPL("Labiatae")

TPL("Asteraceae")
TPL("Compositae")

TPL("Apiaceae")
TPL("Umbelliferae")

}
