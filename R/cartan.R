`cartan` <- function(C,n=1){
    stopifnot(n>0)
    as.clifford(c_cartan(
        L = terms(C), c = coeffs(C),
        m = maxyterm(C),
        n = n))
}

`cartan_inverse` <- function(C,n=1){

    stopifnot(n>0)
    as.clifford(c_cartan_inverse(
        L = terms(C), c = coeffs(C),
        m = maxyterm(C),
        n = n))
}

