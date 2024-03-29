test_that("Test suite aaa.R",{
    options(maxdim=NULL) # default
    expect_silent(as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(3))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(0))

    expect_error(as.clifford("o"))
    expect_true(numeric_to_clifford(1:3) == clifford(list(1,2,3),1:3))


    expect_false(clifford(list(1,1:2),1:2) == clifford(list(1,1:2),c(1,3)))

    expect_true(as.clifford(0) == as.clifford(0))
    expect_true(as.clifford(1) == as.clifford(1))
    expect_false(e(1)+e(2) == e(1) + e(2) + e(3))
    expect_false(e(1)+e(2) + e(3)== e(1) + e(2))

    expect_false(e(1) + 2*e(2) ==  e(1) + e(2))
    expect_false(2*e(1) + e(2) ==  e(1) + e(2))
    
    expect_false(1 + e(1) ==  as.clifford(1))
    expect_false(1 + e(1) ==  e(1))

    expect_false(e(1) + e(2) == e(1) + e(3))
    expect_false(e(1) + e(2) == e(2) + e(4))

    expect_false(e(1) + e(2) == e(1) - e(2))

    expect_true(is.scalar(as.clifford(0)))
    expect_true(is.scalar(as.clifford(1)))
    expect_true(all(grades(clifford(list(1,2,3),1:3))==1))

    expect_true(maxyterm(as.clifford(0),as.clifford(0))==0)
    expect_true(maxyterm(as.clifford(0),as.clifford(1))==0)

    expect_true(is.zero(as.clifford(1) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(1) %.% as.clifford(0)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(1)))
    expect_true(is.zero(as.clifford(0) %.% as.clifford(0)))

    expect_true (is.zero(as.clifford(0) %o% as.clifford(0)))
    expect_true (is.zero(as.clifford(1) %o% as.clifford(0)))
    expect_true (is.zero(as.clifford(0) %o% as.clifford(1)))
    expect_false(is.zero(as.clifford(1) %o% as.clifford(1)))

    expect_true (is.zero(as.clifford(0) % % as.clifford(0)))
    expect_true (is.zero(as.clifford(1) % % as.clifford(0)))
    expect_true (is.zero(as.clifford(0) % % as.clifford(1)))
    expect_false(is.zero(as.clifford(1) % % as.clifford(1)))


    expect_true(as.clifford(0) == +as.clifford(0))
    expect_true(as.clifford(0) == -as.clifford(0))

    expect_true(as.clifford(0) == 0)
    expect_false(as.clifford(0) != 0)
    expect_true(0 == as.clifford(0))
    expect_false(0 != as.clifford(0))

    expect_true(as.clifford(0) * as.clifford(0) == as.clifford(0))
    expect_true(0 * as.clifford(0) == as.clifford(0))
    expect_true(1 * as.clifford(0) == as.clifford(0))
    expect_true(0 * as.clifford(1) == as.clifford(0))

    expect_true(1/basis(1) == basis(1))
    expect_true(1/basis(2) == basis(2))

    expect_true(basis(1)/basis(2) == clifford(list(1:2),1))

    A <- clifford(list(1,1:2,1:3),1:3)
    B <- clifford(list(1:2,1:6),c(44,45))

    expect_error(A[-1])
    expect_true(A[c(1,4)] == 0)
    expect_true(A[coeffs(A)>2] == clifford(list(1:3),3))

    expect_error(A[B])
    expect_silent(A[1,c(1,3,4)])
    expect_silent(A[2:3, 4] <- 99)
    expect_silent(A[] <- B)
    expect_silent(A[] <- 3)

    expect_true(A[disord(list(1,1:2)),1:3] == A[disord(list(1,1:2))])
    
    expect_true(is.1vector(clifford(list(1,2,3),1:3)))

    A <- clifford(list(1,1:2,1:3),1:3)
    expect_true(A[1] == basis(1))
    expect_true(A[1,1:2] == basis(1) + 2*basis(1)*basis(2))

    A[1] <- 20
    expect_true(A == clifford(list(1,1:2,1:3),c(20,2,3)))
    A[1] <- 0
    expect_true(A == clifford(list(1:2,1:3),2:3))


    A <- 5 + clifford(list(1,1:2,1:3),1:3)
    expect_true (is.clifford(A[coeffs(A)>4,drop=FALSE]))
    expect_false(is.clifford(A[coeffs(A)>4,drop=TRUE ]))

    A <- clifford(list(1,1:2,1:3),1:3)
    A[1,1:2] <- 33
    expect_true(A == clifford(list(1,1:2,1:3),c(33,33,3)))

    A <- clifford(list(1,1:2,1:3),1:3)
    A[1,1:2] <- 0
    expect_true(A == clifford(list(1:3),3))

    A <- clifford(list(1,1:2,1:3),1:3)
    A[] <- 0
    expect_true(is.zero(A))

    A <- clifford(list(1,1:2,1:3),1:3)
    coeffs(A) <- 0
    expect_true(is.zero(A))
    coeffs(A) <- 0   # can we change the zero object?
    expect_true(is.zero(A))
    
    A <- clifford(list(1,1:2,1:3),1:3)+3
    A[0,1:6] <- 7
    expect_true(const(A) == 7)
    expect_true(const(A[list(0,4:8)]) == 7)
    
    jj <- clifford(list(1,1:2,1:3,1:4),1:4)
    expect_true(getcoeffs(jj,list(1:2))==2)
    expect_false(jj == 0)
    expect_false(jj == 1)
    expect_true(all(getcoeffs(jj,list(1,1:2)) %in% 1:2))
    expect_true(as.clifford(NULL) == as.clifford(0))
    expect_false(as.clifford(NULL) == as.clifford(1))
    expect_true(as.clifford(NULL) != as.clifford(1))
    expect_true(nbits(jj) == 4)
    expect_silent(jj^jj)
    expect_error(jj^-1)

    expect_true(const(jj) == 0)
    jj <- 1+jj
    expect_true(const(jj) ==1)

    const(jj) <- 3
    expect_true(const(jj) == 3)
    expect_true(const(jj,drop=FALSE) == 3)
    expect_true(const(jj,drop=FALSE) == as.clifford(3))
    expect_true(is.clifford(jj))

    expect_true(is.basisblade(basis(3)))

    expect_true(is.homog(as.clifford(0)))
    expect_true(is.homog(as.clifford(1)))
    expect_false(is.homog(1+basis(2)))

    
    expect_true(is.pseudoscalar(as.clifford(0)))

    options(maxdim=5)
    expect_true(is.pseudoscalar(pseudoscalar()))
    options(maxdim = NULL) # restore default

    expect_equal(Mod(as.clifford(0)),0)
    expect_equal(Mod(as.clifford(1)),1)


    expect_output(print( rcliff()))
    expect_output(print( rcliff(include.fewer=TRUE)))
    expect_output(print( rcliff(include.fewer=FALSE)))
    expect_output(print(-rcliff()))
    expect_output(print(+rcliff()))

    expect_output(print(summary(rcliff())))

    expect_true(
        clifford(sapply(1:5,seq_len),1)[sapply(1:2,seq_len)] ==
        basis(1) + basis(1:2)
    )

    expect_true(allcliff(1) == 1+basis(1))

    expect_true(zap(basis(1)) == basis(1))
    expect_false(zap(pi*basis(1)) == pi*basis(1))

    expect_error(is.blade(as.clifford(4)))

    expect_error(antivector(1:5,3))
    expect_true(is.antivector(antivector(1:5,5)))
    expect_true(is.clifford(rblade()))

    expect_false(is.antivector(allcliff(2)))
    expect_false(is.antivector(allcliff(3)))

    options(maxdim=3)
    expect_false(is.antivector(pseudoscalar(),include.pseudoscalar=FALSE))
    expect_true (is.antivector(pseudoscalar(),include.pseudoscalar=TRUE ))
    options(maxdim=NULL)

    expect_visible(as.character(as.clifford(0)))
    expect_true(as.character(as.clifford(0)) == "0")
    expect_true(as.character(as.clifford(4)) == "4")

    options(maxdim=4)
    expect_silent(e(1))
    expect_silent(e(2))
    expect_silent(34+e(1:4))
    expect_error(e(5))
    expect_error(1+e(6))
    options(maxdim=NULL)

})
