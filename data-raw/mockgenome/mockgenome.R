## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE,comment=NA)
library(knitr)


## ------------------------------------------------------------------------
set.seed(2) # ensure that we can obtain same random sequence each time
library(bfxapps2)
 freqs <- matrix(1,nrow=5, ncol=4)
 colnames(freqs) <- c("A","C","G","T")
 rownames(freqs) <- c("i1","g1","i2","g2","i3")
 freqs["i1",] <- c(10,10,10,70)
 freqs["g1",] <- c(12,64,12,12)
 freqs["i2",] <- c(10,10,10,70)
 freqs["g2",] <- c(12,12,64,12)
 freqs["i3",] <- c(10,10,10,70)
 print(freqs)
 lengths <- c(10,15,10,30,10)
 intervalseqs <- genome_mock2(lengths=lengths,freqs=freqs)
 genome <- paste0(intervalseqs,collapse="")
 substr(genome,19,25) <- "ATATAAA" # end-of-gene motif
 substr(genome,59,65) <- "ATATAAA" # end-of-gene motif


## ------------------------------------------------------------------------
 reads <- random_fragments(genome,len=7,n=80)


## ------------------------------------------------------------------------
knitr::kable(reads)

## ------------------------------------------------------------------------
library(Biostrings)
gx <- DNAString(genome)
matches1 <- matchPattern(reads[1],gx)
matches1

## ------------------------------------------------------------------------
library(Biostrings)
gx <- DNAString(genome)
matches1 <- matchPattern(reads[1],gx)
matches1

## ------------------------------------------------------------------------
lead1 <- paste0(rep(" ",53),collapse="") # this many space characters
s1 <- paste0(lead1,reads[1])
cat(s1,"\n",genome,"\n")

## ------------------------------------------------------------------------
gene1 <- intervalseqs["g1"]
gene2 <- intervalseqs["g2"]
kable(c(gene1,gene2))

## ------------------------------------------------------------------------
g1normfrags <- random_fragments(gene1,len=7,n=80)
g2normfrags <- random_fragments(gene2,len=7,n=160)
g1casefrags <- random_fragments(gene1,len=7,n=216)
g2casefrags <- random_fragments(gene2,len=7,n=144)

## ------------------------------------------------------------------------
kable(g1normfrags)

## ------------------------------------------------------------------------
kable(g2normfrags)

## ------------------------------------------------------------------------
g1casefrags <- random_fragments(gene1,len=7,n=216)
g2casemfrags <- random_fragments(gene2,len=7,n=144)

## ------------------------------------------------------------------------
kable(g1casefrags)

## ------------------------------------------------------------------------
kable(g2casefrags)

rnaseq_mock <- list()
frags_norm <- c(g1normfrags,g2normfrags)
frags_case <- c(g1casefrags,g2casefrags)
rnaseq_mock[["normal"]] <- frags_norm
rnaseq_mock[["case"]]   <- frags_case

usethis::use_data(rnaseq_mock)

