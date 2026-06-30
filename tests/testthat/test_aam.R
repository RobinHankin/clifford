## Some tests of evenpart() and is.even() [resp, odd].  This file
## follows the structure of aaa.R in the free group package.

## Define some checker1(), which takes a single clifford object as
## argument, and call it.  It should all return TRUE if the package
## works, and stop with error if a test is failed.

## The test suite contains some ad-hoc tests at the end as well.

test_that("Test suite aam.R",{

checker1 <- function(A){

    expect_true(is.even(evenpart(A)))
    expect_true(is.odd (oddpart (A)))
    
    expect_true(evenpart(A) == evenpart(evenpart(A)))  # idempotence
    expect_true(oddpart (A) == oddpart (oddpart (A)))
    
    expect_true(is.zero(evenpart(oddpart(A))))
    expect_true(is.zero(oddpart(evenpart(A))))

    expect_true(2*evenpart(A) == evenpart(2*A))
    expect_true(2*oddpart (A) ==  oddpart(2*A))
    
    expect_true(A == evenpart(A) + oddpart(A))
    
}   # checker1() closes
  

checker2 <- function(A, B){

    expect_true(evenpart(A) + evenpart(B) == evenpart(A+B))
    expect_true(oddpart(A)  + oddpart(B)  ==  oddpart(A+B))

    expect_true(is.even(evenpart(A) * evenpart(B)))
    expect_true(is.even( oddpart(A) *  oddpart(B)))
    
    expect_true(is.odd(evenpart(A) *  oddpart(B)))
    expect_true(is.odd( oddpart(A) * evenpart(B)))
   
    
}   # checker2() closes
  
for(i in seq_len(3)){
        A <- rcliff(include.fewer=TRUE)
        B <- rcliff(5)
        checker1(A)
        checker2(A,B)
    }


a <- clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),1:8)

expect_true(
    evenpart(a) ==
    clifford(list(0, 1:2, 2:3, 3:4, 1:4), coeffs = c(1, 4 ,5, 6, 8))
)

expect_true(
    oddpart(a) ==
    clifford(list(3, 1:3, 7), coeffs = c(2, 7, 3))
)


})

