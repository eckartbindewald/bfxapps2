

random_fragments <- function(s,len, n=1) {
 if (length(s) > 1) {
  warning("randomfragments: only first sequence will be used")
  s <- s[1]
 }
 stopifnot(is.finite(n))
 stopifnot(is.finite(len))
 if (n < 1) {
   return(character()) # return empty character vector
 } else if (len < 1) {
   return(character(n))
 }
 ns <- nchar(s)
 if (len > ns) {
   warning("Fragment length is larger than sequence length")
   return(NULL)
 }
 starts <- sample(ns-len+1,n,replace=TRUE)
 stopifnot(length(starts) == n)
 ends <- starts + len -1
 stopifnot(min(starts) >= 1)
 stopifnot(max(ends) <= ns)
 stopifnot(min(ends-starts) >= 0)
 fragments <- stringr::str_sub(s,starts,ends)
 stopifnot(length(fragments) == n)
 stopifnot(length(unique(nchar(fragments)))==1)
 stopifnot(nchar(fragments[1]) == len)
 fragments
}