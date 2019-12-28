`clifford` <- function(blades,coeffs=1){
    if(length(coeffs)==1){coeffs <- coeffs+numeric(length(blades))}
    stopifnot(is_ok_clifford(blades,coeffs))
    m <- mymax(c(blades,recursive=TRUE))
    out <- c_identity(blades,coeffs,m)
    class(out) <- "clifford"  # this is the only place class clifford is set
    return(out)
}

`blades` <- function(x){ x[[1]] }  # accessor methods start
`coeffs` <- function(x){ x[[2]] }

`getcoeffs` <- function(C,B){ # accessor methods end
    c_getcoeffs(
        L = blades(C),
        c = coeffs(C),
        m = maxyblade(C),
        B = B)
}

`const` <- function(C,drop=TRUE){
  out <- getcoeffs(C,list(numeric(0)))
  if(drop){
    return(out)
  } else {
    return(as.clifford(out))
  }
}


`is.1vector` <- function(x){all(grades(x)==1)}
`is.blade` <- function(x){ (nterms(x)==1) || is.scalar(x) }
`blade` <- function(B){clifford(list(B),1)}
`coeffs<-` <- function(x,value){UseMethod("coeffs<-")}
`coeffs<-.clifford` <- function(x,value){
    stopifnot(length(value) == 1)
    return(clifford(blades(x),value + 0*coeffs(x)))
}

`const<-` <- function(x,value){UseMethod("const<-")}
`const<-.clifford` <- function(x,value){
    stopifnot(length(value) == 1)
    x <- x-const(x)
    return(x+value)
}



`mymax` <- function(s){
    if(length(s)==0){
        return(0)
    } else {
        return(suppressWarnings(max(s)))
    }
}

`is_ok_clifford` <- function(blades,coeffs){
    stopifnot(is.list(blades))
    blade_elements <- c(blades,recursive = TRUE)
    stopifnot(length(blades) == length(coeffs))

    if(!is.null(blade_elements)){
      stopifnot(all(blade_elements > 0))
    }
    
    blade_elements_increase <- c(lapply(blades,diff),recursive=TRUE)
    stopifnot(all(blade_elements_increase > 0))

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
  if(length(x)==1){
    return(as.scalar(x))
  } else {
    return(as.1vector(x))
  }
}

`is.clifford` <- function(x){inherits(x,"clifford")}

`nterms` <- function(x){length(coeffs(x))}
`is.zero` <- function(C){nterms(C)==0}
`nbits` <- function(x){max(c(blades(x),recursive=TRUE))}
`grades` <- function(x){unlist(lapply(blades(x),length))}
`is.scalar` <- function(C){
  if(is.zero(C)){
    return(TRUE)
  } else {
    return((length(blades(C))==1) && (length(blades(C)[[1]])==0))
  }
}

`scalar` <- function(x=1){clifford(list(numeric(0)),x)}
`as.scalar` <- `scalar`
`as.1vector` <- function(x){clifford(as.list(seq_along(x)),x)}
`pseudoscalar` <- function(n,x=1){clifford(list(seq_len(n)),x)}
`as.pseudoscalar` <- `pseudoscalar`
`is.pseudoscalar` <- function(C){
    if(is.zero(C)){return(TRUE)}
    return(
        is.clifford(C)         &&
        (length(blades(C))==1) &&
        all(blades(C)[[1]] == seq_along(blades(C)[[1]]))
    )
}

`basis` <- function(n,x=1){clifford(list(n),x)}

`rcliff` <- function(n=9,d=6,grade=4,include.fewer=TRUE){
  if(include.fewer){
    f <- function(grade){sample(grade,1)}
  } else {
    f <- function(grade){grade}
  }
  clifford(replicate(n,sort(sample(d,f(grade))),simplify=FALSE),sample(n))
} 
  
`rev.clifford` <- function(x){
  f <- function(u){ifelse(length(u)%%4 %in% 0:1, 1,-1)}
  clifford(
      blades(x),
      coeffs(x) * unlist(lapply(blades(x),f))
  )
}

`Conj.clifford` <- function(z){
  z <- rev(z)
  clifford(
      blades(z),
      coeffs(z) * ifelse(gradesminus(z)%%2==0,1,-1)
  )
}

`print.clifford` <- function(x,...){
  cat("Element of a Clifford algebra, equal to\n")

  out <- ""
  for(i in seq_along(blades(x))){
    co <- coeffs(x)[i]
    if(co>0){
      pm <- " + " # pm = plus or minus
    } else {
      pm <- " - "
    }
    co <- capture.output(cat(abs(co)))
    jj <- catblade(blades(x)[[i]])
    out <- paste(out, pm, co, jj, sep="")
  }
  if(is.zero(x)){
      out <- "the zero clifford element (0)"
  } else if(is.scalar(x)){
      out <- paste("scalar (",capture.output(cat(coeffs(x))),")")
  }
  cat(paste(strwrap(out, getOption("width")), collapse="\n"))
  cat("\n")
  return(x)
}

`drop` <- function(C){
    if(is.zero(C)){
        return(0)
    } else if(is.scalar(C)){
        return(const(C))
    } else {
        return(C)
    }
}

`grade` <- function(C,n,drop=TRUE){
  C <- as.clifford(C)
  out <- as.clifford(c_grade(blades(C),coeffs(C),maxyblade(C),n))
  if(drop){out <- drop(out)}
  return(out)
}

`is.homog` <- function(C){
    C <- as.clifford(C)
    if(is.zero(C)){return (TRUE)}
    if(is.scalar(C)){ return(TRUE) }
    g <- grades(C)
    if(min(g) == max(g)){
        return(TRUE)
    } else {
        return(FALSE)
    }
}

`scalprod` <- function(C1,C2=rev(C1),drop=TRUE){grade(C1*C2,0,drop=drop)}
`eucprod` <- function(C1,C2=Conj(C1),drop=TRUE){grade(C1*C2,0,drop=drop)}

`Mod.clifford` <- function(z){sqrt(scalprod(Conj(z),z))}

`is.even` <- function(C){all(grades(C)%%2==0)}
`is.odd`  <- function(C){all(grades(C)%%2==1)}

`evenpart` <- function(C){
    wanted <- which(unlist(lapply(blades(C),length))%%2==0)
    clifford(blades(C)[wanted],coeffs=coeffs(C)[wanted])
}

`oddpart` <- function(C){
    wanted <- which(unlist(lapply(blades(C),length))%%2==1)
    clifford(blades(C)[wanted],coeffs=coeffs(C)[wanted])
}

`allcliff` <- function(n){
    clifford(apply(expand.grid(rep(list(0:1),n))>0,1,which),1)
}

`zap` <- function(x,digits=getOption("digits")){
  clifford(blades(x),base::zapsmall(coeffs(x),digits=digits))
}

`catblade` <- function(a){
  if(length(a)==0){
    return("")
  } else {
    if(isTRUE(getOption("separate"))){
      return(paste("e",a,collapse=" ",sep=""))
    } else {
      jj <- getOption("basissep")
      if(is.null(jj)){jj <- ""}
      return(paste("e_",paste(a,collapse=jj),sep=""))
    }
  }
}

`as.character.clifford` <- function(x,...){
  out <- ""
  for(i in seq_along(blades(x))){
    co <- coeffs(x)[i]
    if(co>0){
      pm <- " + " # pm = plus or minus
    } else {
      pm <- " - "
    }
    co <- abs(co)
    jj <- catblade(blades(x)[[i]])
    out <- paste(out, pm, co, jj, sep="")
  }

  if(is.zero(x)){
    out <- "0 "
  } else if(is.scalar(x)){
    out <- as.character(coeffs(x))
  } 
  return(out)
}

`gradesplus` <- function(x){
    sig <- signature()
    if(sig==0){
        return(grades(x))
    } else if(sig>0){
        return(unlist(lapply(blades(x),function(o){sum(o <= sig)})))
    } else if(sig<0){
        return(grades(x)*NA)
    } else {
        stop("this cannot happen")
    }
}

`gradesminus` <- function(x){ grades(x) - gradesplus(x) }

`dual` <- function(C,n){ C*clifford_inverse(pseudoscalar(n)) }
