## Define a checker function, and call it at the end;
## should return TRUE if the package works, and stop with error if
## a test is failed. 

test_that("Test suite aac.R",{

  checker <- function(x){expect_true(all(gradesplus(x)+gradesminus(x)+gradeszero(x) == grades(x)))}

  for(i in 1:5){
    signature(sample(0:4,1),sample(0:4,1))
    d <- sample(2:10,1)
    g <- sample(seq_len(d),1)
    checker(rcliff(d=d,g=g))
  } # for loop closes
  signature(Inf)  # revert to default signature

  
})
