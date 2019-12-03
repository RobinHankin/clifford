## This file follows the structure of aaa.R in the free group package.

## Define some checker functions, and call them at the end.  They
## should all return TRUE if the package works, and stop with error if
## a test is failed.  Function checker1() has one argument, checker2()
## two, and checker3() has three.  

test_that("Test suite aab.R",{

checker1 <- function(x){

  expect_true(x == +x)
  expect_true(x == -(-x))
  expect_error(!x)

  expect_true(x == x+0)
  expect_false(x == 1+x)
  expect_false(x == x+1)
    
  expect_true(x+x == 2*x)
  expect_true(x+x == x*2)

  expect_true(x-x == as.clifford(0))
  expect_true(is.zero(x-x))
  expect_true(x-x == as.clifford(0))
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
  
  expect_true(is.homog(grade(x,1)))
  expect_true(is.homog(grade(x,2)))
  expect_true(is.homog(grade(x,3)))

  
}

checker2 <- function(x,y){
  expect_true(x+y == y+x)
  expect_true(x+2*y == y+x+x)
}

checker3 <- function(x,y,z){
  expect_true(x*(y*z) == (x*y)*z)
  expect_true(x*(y+z) == x*y + x*z)
  expect_true((x+y)*z == x*z + y*z)

  expect_true(x %^% (y %^% z) == (x %^% y) %^% z)
  expect_true(x %^% (y + z) == x %^% y + x %^% z)

  
}
  
  
for(i in 1:2){
    x <- rcliff(include.fewer=TRUE)
    y <- rcliff(5)
    z <- rcliff(5)
    
    checker1(x)
}

})
