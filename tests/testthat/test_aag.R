big_test <- FALSE  # set to TRUE for a more in-depth workout

test_that("Test suite aag.R",{  # tests of cartan's isomorphism
    checker1 <- function(A,n){
        expect_true(cartan(cartan_inverse(A,n),n) == A)
        expect_true(cartan_inverse(cartan(A,n),n) == A)
    }
    
    
    checker2 <- function(A,B,n){
        {
            signature(n+3,Inf)
            AB <- A*B
        }
        {
            signature(n-1,Inf)
            expect_true(cartan(A,n)*cartan(B,n) == cartan(AB,n))
            expect_true(cartan_inverse(cartan(A,n)*cartan(B,n),n) == AB)
        }
    }

    if(big_test){
      reps <- 9
    } else {
      reps <- 1
    }
    
    for(i in seq_len(reps)){
        for(n in seq_len(reps)){
            A <- rcliff()
            B <- rcliff()
            checker1(A,n)
            checker2(A,B,n)
        }
    }
})

