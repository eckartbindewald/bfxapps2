library(testthat)
library(bfxapps2)
devtools::load_all()
test_that("random_sequence works for simple example",{
 n=10
 result <- random_sequence(n=n)
 print(result)
 expect_equal(nchar(result),n)
 expect_equal(length(result),1)
 
})

test_that("random_sequence works for simple example",{
 n=10
 freqs <- c(A=1,C=0,G=0,T=0)
 result <- random_sequence(n=n,freqs=freqs)
 print(result)
 expect_equal(nchar(result),n)
 expect_equal(length(result),1)
 expect_equal(result,"AAAAAAAAAA")
 
})