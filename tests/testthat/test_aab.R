## This file follows the structure of aaa.R in the free group package.

## Define some checker functions, and call them at the end.  They
## should all return TRUE if the package works, and stop with error if
## a test is failed.  Function checker1() has one argument, checker2()
## two, and checker3() has three.  Equation numbers are from Hestenes.

test_that("Test suite aab.R",{

checker1 <- function(x){

  expect_true(x == +x)
  expect_true(x == -(-x))
  expect_error(!x)

  expect_true(x == x+0) # 1.6
  expect_false(x == 1+x) # 1.7
  expect_false(x == x+1)
    
  expect_true(x+x == 2*x)
  expect_true(x+x == x*2)

  expect_true(x-x == as.clifford(0))  # 1.8
  expect_true(is.zero(x-x))    # 1.8
  expect_true(x-x == as.clifford(0)) # 1.8
  expect_true(x+x+x == 3*x)
  expect_true(x+x+x == x*3)

  expect_true(x/2 + x/2 == x)

  expect_error(x&x)
  expect_true(x*x == x^2)

  expect_true(is.zero(x %^% as.clifford(0)))
  expect_true(is.zero(x %.% as.clifford(0)))

  expect_true(x^0 == as.clifford(1))
  expect_true(x^1 ==     x)
  expect_true(x^2 ==   x*x)
  expect_true(x^3 == x*x*x)

  expect_true(is.homog(grade(x,0)))
  expect_true(is.homog(grade(x,1)))
  expect_true(is.homog(grade(x,2)))
  expect_true(is.homog(grade(x,3)))

  expect_true(rev(rev(x)) == x)

  
  for(r in 0:3){
    expect_true(grade(grade(x,r,drop=FALSE),r) == grade(x,r)) # 1.12; grade() is idempotent
    expect_true(rev(grade(x,0)) == grade(x,0))
    for(lam in 0:2){
      expect_true(grade(lam*x,r,drop=FALSE) == lam*grade(x,r,drop=FALSE))  # 1.11
    }
  }

  total <- as.clifford(0)
  for(r in unique(grades(x))){
    total <- total + grade(x,r)
  }
  expect_true(x == total)  # 1.9
  expect_true(grade(grade(x,1,drop=FALSE)*grade(x,1,drop=FALSE),0)>=0) # 1.13
  expect_true(grade(rev(x),0) == grade(x,0)) # 1.17c
  expect_true(rev(grade(x,1)) == grade(x,1)) # 1.17d
}
  
checker2 <- function(x,y){
  expect_true(x+y == y+x) # 1.1
  expect_true(x+2*y == y+y+x)
  for(r in 0:3){
    expect_true(grade(x+y,r) == grade(x,r)+grade(y,r))  # 1.10
  }

  expect_true(rev(x*y) == rev(y)*rev(x))  # 1.17a
  expect_true(rev(x + y) == rev(y) + rev(x)) # 1.17b


}

checker3 <- function(x,y,z){
  expect_true(x+(y+z) == (x+y)+z)  # addition is associative; 1.2
  expect_true(x*(y*z) == (x*y)*z)  # geometric product is associative; 1.3


  expect_true(x*(y+z) == x*y + x*z) # left distributive; 1.4
  expect_true((x+y)*z == x*z + y*z) # right distributive; 1.5

  expect_true(x %^% (y %^% z) == (x %^% y) %^% z)
  expect_true(x %^% (y + z) == x %^% y + x %^% z)

  
}
  
  
for(i in 1:100){
    x <- rcliff(include.fewer=TRUE)
    y <- rcliff(5)
    z <- rcliff(5)
    
    checker1(x)
    checker2(x,y)
    checker3(x,y,z)
}

})
