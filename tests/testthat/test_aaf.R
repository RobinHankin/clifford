test_that("Test suite aaf.R",{  # tests of division
    small <- 1e-4
    tiny <- 1e-10
    checker1 <- function(A){
        if(Mod(A)>small){
            expect_true(Mod(A/A-1) < tiny)
            expect_true(Mod(A^2/A-A)  < tiny)
        }
    }
    
    checker2 <- function(A,B){
        if(Mod(B)>small){
            expect_true( Mod((A/B)*B-A) < tiny)
            expect_true( Mod((A*B)/B-A) < tiny)
            expect_true( Mod(((A*B)/B)/A-1) < tiny)
        }
    }
    
    for(n in 1:9){
        A <- rcliff(d=5)
        B <- rcliff(d=5)
        checker1(A)
        checker2(A,B)
    }

    # Some spot checks:
    expect_error(1/(1+e(1:6)))

})

