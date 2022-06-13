## -----------------------------------------------------------------------------
library(plantlist)
TPL("Carex") # 薹草属
TPL("Apple") # 苹果
splist <- c("Ranunculus japonicus", 
            "Solanum nigrum",
            "Punica sp.", 
            "Machilus", 
            "Today", 
            "####" )            ### 查询多个种
res <- TPL(splist)

## -----------------------------------------------------------------------------
library(plantlist)
sp <- c( "Ranunculus japonicus", 
         "Anemone udensis",
         "Ranunculus repens",
         "Ranunculus chinensis",
         "Solanum nigrum",
         "Punica sp." )
res <- TPL(sp)
taxa.table(res)

## -----------------------------------------------------------------------------
library(plantlist)

#### 查询一个名称
status("Myrica rubra")

#### 查询多个名称
status(c("Myrica rubra", 
         "Adinandra millettii",
         "Machilus thunbergii",
         "Ranunculus japonicus",
         "Cyclobalanopsis neglecta"))

## -----------------------------------------------------------------------------
library(plantlist)
res_CTPL <- CTPL(c("桃儿七", 
                   "连香树", 
                   "水青树", 
                   "绿樟", 
                   "网脉实蕨", 
                   "Magnolia coco", 
                   "Punica"))
count_taxa(res_CTPL)

