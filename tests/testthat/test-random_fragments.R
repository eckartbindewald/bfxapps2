library(testthat)
library(bfxapps2)
devtools::load_all()
context("test-random_fragments")

test_that("random_fragments works", {
 s <- paste0(LETTERS,collapse="") # = "ABCDEFG..."
 len <- 10
 n <- 3
 frags <- random_fragments(s,len,n)
 expect_is(frags,"character")
 expect_equal(length(frags),n)
 lens <- unique(nchar(frags))
 expect_equal(length(lens),1)
 expect_equal(lens[1],len)
})
