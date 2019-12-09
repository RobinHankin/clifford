test_that("Test suite aaa.R",{  # tests of signature

    expect_silent(signature())
    expect_silent(signature(Inf))
    signature(0)
    expect_true(basis(1)*basis(1) == as.scalar( 1))
    expect_true(basis(2)*basis(2) == as.scalar( 1))

    expect_true(basis(1) %^% basis(2) + basis(2) %^% basis(1) == as.clifford(0))


    signature(1)
    expect_true(basis(1)*basis(1) == as.scalar( 1))
    expect_true(basis(2)*basis(2) == as.scalar(-1))

    expect_true(1/basis(1) == +basis(1))
    expect_true(1/basis(2) == -basis(2))


    signature(0)

    options("show_signature" = TRUE)
    signature(2)
    expect_output(print( rcliff()))
    expect_output(print( rcliff(include.fewer=TRUE)))
    expect_output(print( rcliff(include.fewer=FALSE)))
    expect_output(print(-rcliff()))
    expect_output(print(+rcliff()))

    expect_error(signature(1:2))
    expect_error(signature(0.5))

    signature(0)

})
