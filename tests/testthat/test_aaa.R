test_that("Test suite aaa.R",{
    expect_silent(as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(3))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(3) + as.clifford(0))
    expect_silent(as.clifford(0) + as.clifford(0))

    expect_true(all(grades(clifford(list(1,2,3),1:3))==1))

})
