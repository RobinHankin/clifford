`[.clifford` <- function(C, ...){
  dots <- list(...)
  clifford(dots,getcoeffs(C,dots))
}  

`[<-.clifford` <- function(C, index, ..., value){

  if(missing(index)){ # C[] <- value
    dots <- list(...)
    if(is.clifford(value)){
      return(as.clifford(c_overwrite(
          blades(C),coeffs(C),
          blades(value),coeffs(value),
          maxyblade(C,value)
      )))
    } else { # value a scalar
      stopifnot(length(value) == 1)
      return(clifford(blades(C),value + numeric(length(coeffs(C)))))
    }
  } else {  # index supplied, dots interpreted as more blades
    dots <- c(list(index),list(...))
    jj <- clifford(dots,value) # sic; this is legit!
    return(as.clifford(c_overwrite(
        blades(C),coeffs(C),
        blades(jj),coeffs(jj),
        maxyblade(C,jj)
    )))
  }
}

