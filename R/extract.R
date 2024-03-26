list_modifier <- function(B){
    lapply(B,
           function(x){
               if(identical(round(x),0)){
                   return(numeric(0))
               } else {
                   return(x)
               }
           } )
}

`[.clifford` <- function(C, index, ...,drop=FALSE){
    if(is.clifford(index)){
        stop("cannot extract a clifford; try A[terms(B)]")
    } else if(is.disord(index)){
        if(is.list(index)){
            dots <- elements(index)
        } else {
            return(clifford(elements(terms(C)[index]),elements(coeffs(C)[index])))
        }
    } else if(is.list(index)){
        dots <- index
    } else {
        dots <- c(list(index),list(...))
    }
    out <- clifford(list_modifier(dots),getcoeffs(C,list_modifier(dots)))
    if(drop){out <- drop(out)}
    return(out)
}  

`[<-.clifford` <- function(C, index, ..., value){
    
    if(missing(index)){ # C[] <- value
        dots <- list_modifier(list(...))
        if(is.clifford(value)){
            return(as.clifford(c_overwrite(
                terms(C),coeffs(C),
                terms(value),coeffs(value),
                maxyterm(C,value)
            )))
        } else { # value a scalar
            stopifnot(length(value) == 1)
            return(clifford(terms(C),value + numeric(length(coeffs(C)))))
        }
    } else {  # index supplied, dots interpreted as more terms
        dots <- list_modifier(c(as.list(index),list(...)))
        if(value==0){
            jj <- clifford(dots,1)
            return(as.clifford(c_overwrite(
                terms(C),coeffs(C),
                terms(jj),coeffs(jj),
                maxyterm(C,jj)
            ))-jj)
        } else { # value != 0
            jj <- clifford(dots,value) # sic; this is legit!
            return(as.clifford(c_overwrite(
                terms(C),coeffs(C),
                terms(jj),coeffs(jj),
                maxyterm(C,jj)
            )))
        }
    }
}


setGeneric("Re")
setGeneric("Im")

`Re.clifford` <- function(z){const(z)}
`Im.clifford` <- function(z){
  const(z) <- 0
  return(z)
}
