## Some ad-hoc tests of replacement methods implemented by grade<-()


test_that("Test suite aaj.R",{  # tests grade(C,n) <- value 

    a <- clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),1:8)

    jj <- a
    expect_true(jj == clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),1:8))

    jj <- a
    grade(jj,1) <- 0
    expect_true(jj ==  clifford(list(0,1:2,2:3,3:4,1:3,1:4),c(1,4:8)))

    jj <- a
    grade(jj,1) <- 50*e(3)
    expect_true(jj == clifford(list(0,3,1:2,2:3,3:4,1:3,1:4),c(1,50,4:8)))

    jj <- a
    grade(jj,1) <- 50*e(13)
    expect_true(jj == clifford(list(0,13,1:2,2:3,3:4,1:3,1:4),c(1,50,4:8)))

    jj <- a
    grade(jj,1) <- 50*e(13) + 51*e(14)
    expect_true(jj == clifford(list(0,13,14,1:2,2:3,3:4,1:3,1:4),c(1,50,51,4:8)))
    
    jj <- a 
    expect_error(grade(jj,1) <- e(1:2))

    jj <- a 
    grade(jj,1) <- 77
    expect_true(jj == clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),c(1,77,77,4:8)))

    jj <- a 
    grade(jj,2) <- 88
    expect_true(jj == clifford(list(0,3,7,1:2,2:3,3:4,1:3,1:4),c(1:3,rep(88,3),7:8)))

}    )
