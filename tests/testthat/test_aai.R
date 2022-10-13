test_that("Test suite aai.R",{  # tests of the commutator .[x,y]
    checker3 <- function(x,y,z){
        expect_true(is.zero(
            .[x,.[y,z]] +
            .[y,.[z,x]] +
            .[z,.[x,y]]
        ))
    }
    
    for(i in seq_len(7)){ checker3(rcliff(),rcliff(),rcliff()) }
})

