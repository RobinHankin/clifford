`clifford` <- function(blades,coeffs){
    stopifnot(is_ok_clifford(blades,coeffs))
    m <- mymax(c(blades,recursive=TRUE))
    out <- c_identity(blades,coeffs,m)
    class(out) <- "clifford"  # this is the only place class clifford is set
    return(out)
}

`blades` <- function(C){ C[[1]] }  # accessor methods start
`coeffs` <- function(C){ C[[2]] }  # accessor methods end

`mymax` <- function(x){
    if(length(x)==0){
        return(0)
    } else {
        return(suppressWarnings(max(x)))
    }
}

`is_ok_clifford` <- function(blades,coeffs){
    stopifnot(is.list(blades))
    blade_elements <- c(blades,recursive = TRUE)
    
    stopifnot(all(blade_elements >0))
    stopifnot(all(blade_elements == round(blade_elements)))

    blade_elements_increase <- c(lapply(blades,diff),recursive=TRUE)
    stopifnot(all(blade_elements_increase > 0))

    stopifnot(length(blades) == length(coeffs))

    return(TRUE)

}

`as.clifford` <- function(x){
    if(inherits(x,"clifford")){
        return(x)
    } else if(is.list(x)){
        return(clifford(x[[1]],x[[2]]))
    } else if(is.numeric(x)){
        return(numeric_to_clifford(x))
    } else if(is.null(x)){
        return(clifford(list(numeric(0)),0))
    } else {
        stop("not recognised")
    }
}

`numeric_to_clifford` <- function(x){
    stopifnot(is.numeric(x))
    stopifnot(length(x) == 1)
    return(clifford(list(numeric(0)),x))
}

`nterms` <- function(C){length(coeffs(C))}
`is.zero` <- function(C){nterms(C)==0}
`is.scalar` <- function(C){nterms(C)==1}
`nbits` <- function(C){max(c(blades(C),recursive=TRUE))}
