#! /usr/bin/Rscript
# calculate_TPM.R

rm(list=ls())

# libraries
library(tidyverse)

# input file 
count <- read.csv("gene_count_matrix_sorted.csv", row.names = 1)
count <- arrange(count, row.names(count))

exon <- read.table("GRCh38_v108_exon_length.txt",
                   sep = "\t",
                   row.names = 1,
                   header = T)
exon <- arrange(exon, row.names(exon))

count.2 <- count
for (i in 1:ncol(count)) {
  count.2[,i] <- (count[,i]/exon$ExonLength)*1000
}

count.3 <- count.2
for (i in 1:ncol(count)) {
  count.3[,i] <- (count.2[,i]/sum(count.2[,i]))*1E6
}

write.table(count.3,
            file = "TPM_matrix.csv",
            quote = F, sep = ",",
            row.names = T,
            col.names = NA
           )

