# iSEE demo
library("iSEE")
library("scRNAseq")
library("scater")
sce = ReprocessedAllenData(assays = "tophat_counts")   
sce = logNormCounts(sce, exprs_values="tophat_counts")

set.seed(1000)
sce = runPCA(sce)
sce = runTSNE(sce)
reducedDimNames(sce)

rowData(sce)$mean_log <- rowMeans(logcounts(sce))
rowData(sce)$var_log <- apply(logcounts(sce), 1, var)

app <- iSEE(sce)
shiny::runApp(app)