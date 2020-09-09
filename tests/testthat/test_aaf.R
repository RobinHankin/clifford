test_that("Test suite aaf.R",{  # tests of cartan's isomorphism from
                                # Cl(p,q) to Cl(p+4,q-4)

    checker1 <- function(A,n){
        expect_true(cartan(cartan_inverse(A,n+1),n+1) == A)
        expect_true(cartan_inverse(cartan(A,n+1),n+1) == A)
    }
    
    checker2 <- function(A,B,n){
        signature(n+4 -1)
        AB <- A*B
        
        signature(n-1)
        expect_true(cartan(A,n)*cartan(B,n) == cartan(AB,n))
        expect_true(cartan_inverse(cartan(A,n) * cartan(B,n),n) == AB)
    }
    
    for(n in 1:9){
        A <- rcliff()
        B <- rcliff()
        checker1(A,n)
        checker2(A,B,n)
    }
    
    
    ## now some spot checks:
    
    expect_true(cartan(e(1),1) == -e(2:4))
    expect_true(cartan(e(1),2) == +e(1))
    expect_true(cartan(e(1),3) == +e(1))
    expect_true(cartan(e(1),4) == +e(1))
    


})

