## Tests print_special()


test_that("Test suite aal.R",{  # tests printing of quaternions

options("maxdim" = 3)
signature(3)
a <- clifford(list(0,c(1,2),c(1,3),c(2,3)), 6:9)

options("clifford_print_special" = "does_not_exist")
expect_error(print(e(1:2)))

options("clifford_print_special" = "quaternion")
expect_error(print(e(1:3)))
expect_output(print(a))
expect_output(print(a-6))

## restore defaults:
options("maxdim" = NULL)
options("clifford_print_special" = NULL)
signature(Inf)
} )
