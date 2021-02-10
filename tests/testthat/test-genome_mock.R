library(testthat)
library(bfxapps2)
devtools::load_all()

context("test-genome_mock")

# test_that("multiplication works", {
 freqs <- matrix(1,nrow=4, ncol=4)
 colnames(freqs) <- c("A","C","G","T")
 rownames(freqs) <- c("g1","g2","g3","intergenefreqs")
 freqs["g1",] <- c(70,10,10,10)
 freqs["g2",] <- c(10,70,10,10)
 freqs["g3",] <- c(10,10,70,10)
 freqs["intergenefreqs",] <- c(10,10,10,70)
# print(freqs) # nucleotide frequencies of each gene
 result <- genome_mock(genelen=20,intergenelen=20,ngenes=3,freqs=freqs)
# print(result)
 cat("Characters",nchar(result),"\n")
# })
