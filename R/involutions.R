`minus` <- function(x){-x}

`rev.clifford` <- function(x){
  coeffs(x)[(grades(x)%%4) %in% 2:3] %<>% minus
  return(x)
}

`Conj.clifford` <- function(z){
  z <- rev(z)
  coeffs(z)[gradesminus(z)%%2 != 0] %<>% minus
  return(z)
}

`cliffconj` <- function(z){
    coeffs(z)[grades(z)%%4 %in% 1:2] %<>% minus
    return(z)
}

`neg` <- function(C,n){
    coeffs(C)[grades(C) %in% n] %<>% minus
    return(C)
}

`gradeinv` <- function(C){
    coeffs(C)[grades(C)%%2==1] %<>% minus
    return(C)
}

`dual` <- function(C,n){ C*clifford_inverse(pseudoscalar()) }

