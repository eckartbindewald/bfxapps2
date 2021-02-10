

random_sequence <- function(n, freqs=c("A"=0.25,"C"=0.25,"G"=0.25,"T"=0.25)) {
 alphabet=names(freqs)
 stopifnot(!is.null(alphabet))
 minfreqs <- min(freqs[freqs> 0])
 stopifnot(is.finite(minfreqs))
 freqs2 <- round(freqs/minfreqs)
 alph2 <- c()
 for (i in seq_along(freqs2)) {
   v<- rep(alphabet[i],freqs2[i])
   alph2 <- append(alph2, v)
 }
 na2 <- length(alph2)
 ids <- sample(na2,n,replace=TRUE)
 result <- paste0(alph2[ids],collapse="")
 stopifnot(all(is.finite(freqs)))
 result
}

genome_mock <- function(genelen,freqs,intergenelen=genelen) {
 stopifnot(!is.null(nrow(freqs)))
 stopifnot(!is.null(colnames(freqs)))
 ngenes = nrow(freqs)-1
 alphabet=colnames(freqs)
 stopifnot(is.character(alphabet))
 for (i in 1:nrow(freqs)) {
  if (sum(freqs[i,]) > 0.0) {
   freqs[i,] <-freqs[i,] / sum(freqs[i,])
  } else {
    warning("Cannot normalize nucleotide frequencies for matrix row ",i)
  }
 }
 result <- ""
 for (i in 1:ngenes) {
  fv <- freqs["intergenefreqs",]
  names(fv) <- colnames(freqs)
  s <- random_sequence(intergenelen,freqs=fv)
#  cat("adding preceding intergenic sequence for gene",i,":",s,"\n")
  result <- paste0(result, s)
  fv = freqs[i,] # (1-x)*sv + x*ev
  names(fv) <- colnames(freqs)
  s = random_sequence(genelen,freqs=fv)
#  cat("adding sequence for gene",i,":",s,"\n")
  result <- paste0(result, s)
 }
 s <- random_sequence(intergenelen,freqs=freqs["intergenefreqs",])
# cat("adding final intergenic sequence for gene",i,":",s,"\n")
 result <- paste0(result,s)
 result
}

genome_mock2 <- function(lengths,freqs) {
 stopifnot(!is.null(nrow(freqs)))
 stopifnot(!is.null(colnames(freqs)))
 for (i in 1:nrow(freqs)) {
  if (sum(freqs[i,]) > 0.0) {
   freqs[i,] <-freqs[i,] / sum(freqs[i,])
  } else {
    warning("Cannot normalize nucleotide frequencies for matrix row ",i)
  }
 }
 result <- c()
 for (i in seq_along(lengths)) {
  fv <- freqs[i,]
  names(fv) <- colnames(freqs)
  s <- random_sequence(lengths[i],freqs=fv)
  result <- append(result, s)
 }
 names(result) <- rownames(freqs)
 result
}
