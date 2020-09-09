test_that("Test suite aag.R",{  # tests of cartan's isomorphism
    checker1 <- function(A,n){
        expect_true(cartan(cartan_inverse(A,n),n) == A)
        expect_true(cartan_inverse(cartan(A,n),n) == A)
    }
    
    
    checker2 <- function(A,B,n){
        {
            signature(n+3)
            AB <- A*B
        }
        {
            signature(n-1)
            expect_true(cartan(A,n)*cartan(B,n) == cartan(AB,n))
            expect_true(cartan_inverse(cartan(A,n)*cartan(B,n),n) == AB)
        }
    }
    
    for(i in 1:9){
        for(n in 1:9){
            A <- rcliff()
            B <- rcliff()
            checker1(A,n)
            checker2(A,B,n)
        }
    }
})

