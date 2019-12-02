test_that("Test suite aaa.R",{
    expect_silent(as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(3))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(0))

    expect_true(all(grades(clifford(list(1,2,3),1:3))==1))

    expect_true(maxyblade(as.clifford(0),as.clifford(0))==0)
    expect_true(maxyblade(as.clifford(0),as.clifford(1))==0)

    expect_true(is.zero(as.clifford(1) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(1) %.% as.clifford(0)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(0)))


    expect_silent(signature())
    expect_silent(signature(Inf))
    signature(0)
    expect_true(basis(1)*basis(1) == as.scalar( 1))
    expect_true(basis(2)*basis(2) == as.scalar( 1))




    signature(1)
    expect_true(basis(1)*basis(1) == as.scalar( 1))
    expect_true(basis(2)*basis(2) == as.scalar(-1))
    signature(0)

    options("show_signature" = TRUE)
    signature(2)
    expect_output(print(rcliff()))

    expect_error(signature(1:2))
    expect_error(signature(0.5))

    signature(0)

})
