## Tests issue #60


test_that("Test suite aak.R",{  # tests disordR issue #42

  a <- 1 + 2* e(1) + 2*e(1:2) + 3*e(3) + 3*e(1:3) + 4*e(2:3)
  expect_error(coeffs(a)[coeffs(a) <= 2]  <- coeffs(a)[coeffs(a) <=4])

} )
