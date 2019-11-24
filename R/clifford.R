`clifford` <- function(blades,coeffs){
    stopifnot(is_ok_clifford(blades,coeffs))
    out <- identity(blades,coeffs,max(c(blades,recursive=TRUE)))
    class(out) <- "clifford"  # this is the only place class clifford is set
    return(out)
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


