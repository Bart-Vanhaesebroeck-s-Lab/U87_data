library(TCGAbiolinks)
library(DT)
library(downloader)
library(tidyverse)
library(tidyr)
library(dplyr)
library(tidylog)
library(devtools)
library(stringr)
library(biomaRt)
library(RColorBrewer)
library(gplots)
library(calibrate)
library(ggplot2)
library(ggrepel)
library(ggcorrplot)
library(edgeR)
library(limma)
library(RColorBrewer)
library(readr)
library(GSA)
library(fgsea)
library(msigdbr)
library(ggridges)
library(ggpubr)
library(GGally)
library(patchwork)
library(data.table)
library(Hmisc)
library(UpSetR)
library(ComplexHeatmap)
library(corrplot)
library(progeny)
library(dorothea)
library(pheatmap)
library(circlize)
library(viridis) # required for inferno colours
library(venn)
library(PCAtools)
library(vsn)
library(KEGGREST)
library(webchem)
library(RCy3)
library(tidygraph)
library(ggraph)
library(gprofiler2)
library(EGSEA)
library(EGSEAdata)
if(interactive()){
  
  mart = useMart("ensembl")
  mart=useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl", host="uswest.ensembl.org")
}


# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}
