## This file follows the structure of aaa.R in the free group package.

## Define some checker functions, and call them at the end.  They
## should all return TRUE if the package works, and stop with error if
## a test is failed.  Function checker1() has one argument, checker2()
## two, and checker3() has three.  Equation numbers are from Hestenes.

test_that("Test suite aab.R",{

checker1 <- function(A){

  expect_true(A == +A)
  expect_true(A == -(-A))
  expect_error(!A)

  expect_true(A == A+0) # 1.6
  expect_false(A == 1+A) # 1.7
  expect_false(A == A+1)
    
  expect_true(A+A == 2*A)
  expect_true(A+A == A*2)

  expect_true(A-A == as.clifford(0))  # 1.8
  expect_true(is.zero(A-A))    # 1.8
  expect_true(A-A == as.clifford(0)) # 1.8
  expect_true(A+A+A == 3*A)
  expect_true(A+A+A == A*3)

  expect_true(A/2 + A/2 == A)

  expect_error(A&A)
  expect_true(A*A == A^2)

  expect_true(is.zero(A %^% as.clifford(0)))
  expect_true(is.zero(A %.% as.clifford(0)))

  expect_true(A^0 == as.clifford(1))
  expect_true(A^1 ==     A)
  expect_true(A^2 ==   A*A)
  expect_true(A^3 == A*A*A)

  expect_true(is.homog(grade(A,0)))
  expect_true(is.homog(grade(A,1)))
  expect_true(is.homog(grade(A,2)))
  expect_true(is.homog(grade(A,3)))

  expect_true(rev(rev(A)) == A)

  
  for(r in 0:3){
    expect_true(grade(grade(A,r,drop=FALSE),r) == grade(A,r)) # 1.12; grade() is idempotent
    expect_true(rev(grade(A,0)) == grade(A,0))
    for(lam in 0:2){
      expect_true(grade(lam*A,r,drop=FALSE) == lam*grade(A,r,drop=FALSE))  # 1.11
    }
  }

  total <- as.clifford(0)
  for(r in unique(grades(A))){
    total <- total + grade(A,r)
  }
  expect_true(A == total)  # 1.9
  expect_true(grade(grade(A,1,drop=FALSE)*grade(A,1,drop=FALSE),0)>=0) # 1.13
  expect_true(grade(rev(A),0) == grade(A,0)) # 1.17c
  expect_true(rev(grade(A,1)) == grade(A,1)) # 1.17d
}
  
checker2 <- function(A,B){
  expect_true(A+B == B+A) # 1.1
  expect_true(A+2*B == B+B+A)
  for(r in 0:3){
    expect_true(grade(A+B,r) == grade(A,r)+grade(B,r))  # 1.10
  }

  expect_true(rev(A*B) == rev(B)*rev(A))  # 1.17a
  expect_true(rev(A + B) == rev(B) + rev(A)) # 1.17b


}

checker3 <- function(A,B,C){
  expect_true(A+(B+C) == (A+B)+C)  # addition is associative; 1.2
  expect_true(A*(B*C) == (A*B)*C)  # geometric product is associative; 1.3


  expect_true(A*(B+C) == A*B + A*C) # left distributive; 1.4
  expect_true((A+B)*C == A*C + B*C) # right distributive; 1.5

  expect_true(A %^% (B %^% C) == (A %^% B) %^% C)
  expect_true(A %^% (B + C) == A %^% B + A %^% C)

  
}
  
  
for(i in 1:100){
    A <- rcliff(include.fewer=TRUE)
    B <- rcliff(5)
    C <- rcliff(5)
    
    checker1(A)
    checker2(A,B)
    checker3(A,B,C)
}

})
