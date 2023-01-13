## Normalization

library("DESeq2")
library("airway")
library("ggplot2")
library("dplyr")
library("gridExtra")
library("hexbin")
data("airway")

aw = DESeqDataSet(airway, design = ~ cell + dex) |> estimateSizeFactors()
sizeFactors(aw)

samples = c("SRR1039513", "SRR1039517") 

myScatterplot = function(x) {
  as_tibble(x) %>% 
    mutate(rs = rowSums(x)) %>%
    filter(rs >= 2) %>%
    ggplot(aes(x = asinh(SRR1039513), 
               y = asinh(SRR1039517))) + geom_hex(bins = 50) +
    xlab("SRR1039513") + ylab("SRR1039517") +
    coord_fixed() + 
    geom_abline(slope = 1, intercept = 0, col = "orange") + 
    theme(legend.position = "none")
}

png("fig/normalization.png", width = 1400, height = 700, res = 180)
grid.arrange(
  myScatterplot(counts(aw)),
  myScatterplot(counts(aw, normalized = TRUE)),
  ncol = 2)
dev.off()

# DESeqDataSet(airway, design = ~ cell + dex) |> DESeq()
