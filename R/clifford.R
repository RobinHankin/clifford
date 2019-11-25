`clifford` <- function(blades,coeffs){
    stopifnot(is_ok_clifford(blades,coeffs))
    m <- mymax(c(blades,recursive=TRUE))
    out <- c_identity(blades,coeffs,m)
    class(out) <- "clifford"  # this is the only place class clifford is set
    return(out)
}

`blades` <- function(x){ x[[1]] }  # accessor methods start
`coeffs` <- function(x){ x[[2]] }  # accessor methods end

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

    if(!is.null(blade_elements)){
      stopifnot(all(blade_elements > 0))

    }
    
    blade_elements_increase <- c(lapply(blades,diff),recursive=TRUE)
    stopifnot(length(blades) == length(coeffs))

    return(TRUE)

}

`as.clifford` <- function(x){
    if(inherits(x,"clifford")){
        return(x)
    } else if(is.list(x)){
        return(clifford(x[[1]],x[[2]]))
    } else if(is.numeric(x)){
        return(as.clifford(x))
    } else if(is.null(x)){
        return(clifford(list(numeric(0)),0))
    } else {
        stop("not recognised")
    }
}

`is.clifford` <- function(x){inherits(x,"clifford")}

`nterms` <- function(x){length(coeffs(x))}
`is.zero` <- function(x){nterms(x)==0}
`is.scalar` <- function(x){
  (length(blades(x))==1) && (length(blades(x)[[1]])==0)
}

`nbits` <- function(x){max(c(blades(x),recursive=TRUE))}

`rcliff` <- function(n=9,b=6){
  clifford(
      replicate(n,sort(sample(seq_len(b),sample(b,1))),simplify=FALSE),
      sample(n)
  )
} 
  
`rev.clifford` <- function(x){
  f <- function(u){ifelse(length(u)%%4 %in% 0:1, 1,-1)}
  clifford(
      blades(x),
      coeffs(x) * unlist(lapply(blades(x),f))
  )
}

`print.clifford` <- function(x,...){
  cat("Element of a Clifford  algebra, equal to\n")

  f <- function(a){
      if(is.null(a)){
          return("")
      } else {
          return(paste("e",a,collapse=" ",sep=""))
      }
  }

  out <- ""
  for(i in seq_along(blades(x))){
    co <- coeffs(x)[i]
    if(co>0){
      pm <- " + " # pm = plus or minus
    } else {
      pm <- " - "
      co <- abs(co)
    }

    jj <- f(blades(x)[[i]])
    out <- paste(out, pm, co, jj, sep="")
  }
  if(is.zero(x)){
      out <- "the zero clifford element (0)"
  } else if(is.scalar(x)){
      out <- paste("scalar (",coeffs(x),")")
  }
  cat(out)
  cat("\n")
  return(x)
}
