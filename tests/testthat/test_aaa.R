test_that("Test suite aaa.R",{
    expect_silent(as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(3))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(0))

    expect_error(as.clifford("o"))
    expect_true(numeric_to_clifford(1:3) == clifford(list(1,2,3),1:3))


    expect_false(clifford(list(1,1:2),1:2) == clifford(list(1,1:2),c(1,3)))
    expect_true(is.scalar(as.clifford(0)))
    expect_true(is.scalar(as.clifford(1)))
    expect_true(all(grades(clifford(list(1,2,3),1:3))==1))

    expect_true(maxyblade(as.clifford(0),as.clifford(0))==0)
    expect_true(maxyblade(as.clifford(0),as.clifford(1))==0)

    expect_true(is.zero(as.clifford(1) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(1) %.% as.clifford(0)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(0)))

    expect_true(as.clifford(0) == +as.clifford(0))
    expect_true(as.clifford(0) == -as.clifford(0))

    expect_error(as.clifford(0) == 0)
    expect_error(as.clifford(0) != 0)
    expect_error(0 == as.clifford(0))
    expect_error(0 != as.clifford(0))

    expect_true(as.clifford(0) * as.clifford(0) == as.clifford(0))
    expect_true(0 * as.clifford(0) == as.clifford(0))
    expect_true(1 * as.clifford(0) == as.clifford(0))
    expect_true(0 * as.clifford(1) == as.clifford(0))

    expect_true(1/basis(1) == basis(1))
    expect_true(1/basis(2) == basis(2))

    expect_true(basis(1)/basis(2) == clifford(list(1:2),1))

    jj <- clifford(list(1,1:2,1:3,1:4),1:4)
    expect_true(getcoeffs(jj,list(1:2))==2)
    expect_error(jj == 0)
    expect_error(jj == 1)
    expect_true(all(getcoeffs(jj,list(1,1:2)) %in% 1:2))
    expect_true(as.clifford(NULL) == as.clifford(0))
    expect_false(as.clifford(NULL) == as.clifford(1))
    expect_true(as.clifford(NULL) != as.clifford(1))
    expect_true(nbits(jj) == 4)
    expect_error(jj^jj)
    expect_error(jj^-1)

    expect_true(const(jj) == 0)
    jj <- 1+jj
    expect_true(const(jj) ==1)

    const(jj) <- 3
    expect_true(const(jj) == 3)
    expect_error(const(jj,drop=FALSE) == 3)
    expect_true(const(jj,drop=FALSE) == as.clifford(3))
    expect_true(is.clifford(jj))

    expect_true(is.blade(basis(3)))

    expect_true(is.homog(as.clifford(0)))
    expect_true(is.homog(as.clifford(1)))
    expect_false(is.homog(1+basis(2)))

    
    expect_true(is.pseudoscalar(as.clifford(0)))
    expect_true(is.pseudoscalar(as.clifford(1)))
    expect_true(is.pseudoscalar(pseudoscalar(1)))
    expect_true(is.pseudoscalar(pseudoscalar(2)))
    expect_true(is.pseudoscalar(pseudoscalar(3)))
    expect_false(is.pseudoscalar(1+pseudoscalar(3)))


    expect_equal(mod(as.clifford(0)),0)
    expect_equal(mod(as.clifford(1)),1)

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
