`clifford` <- function(terms,coeffs=1){
    stopifnot(is_ok_clifford(terms,coeffs))
    terms <- elements(terms)
    coeffs <- elements(coeffs)
    if(length(coeffs)==1){coeffs <- coeffs+numeric(length(terms))}

    if(!isFALSE(getOption("warn_on_repeats")) & anyDuplicated(terms)>0){
        warning("repeated element in terms")
    }

    m <- mymax(c(terms,recursive=TRUE))
    out <- c_identity(terms,coeffs,m)
    class(out) <- "clifford"  # this is the only place class clifford is set
    return(out)
}

setOldClass("clifford")
`terms` <- function(x){disord(x[[1]], hashcal(x))}  # accessor methods start ...
`coeffs` <- function(x){ disord(x[[2]],hashcal(x))}  # ... continue ...
`getcoeffs` <- function(C,B){                     # ... accessor methods end
    c_getcoeffs(
        L = terms(C),
        c = coeffs(C),
        m = maxyterm(C),
        B = B)
}

`const` <- function(C,drop=TRUE){
  if(is.numeric(C)){return(C[1])}
  out <- getcoeffs(C,list(numeric(0)))
  if(drop){
    return(out)
  } else {
    return(as.clifford(out))
  }
}


`is.1vector` <- function(x){all(grades(x)==1)}
`is.basisblade` <- function(x){ (nterms(x)==1) || is.scalar(x) }
`is.blade` <- function(x){stop("Not implemented: factorization is hard")}
`coeffs<-` <- function(x,value){UseMethod("coeffs<-")}
`coeffs<-.clifford` <- function(x,value){
  jj <- coeffs(x)
  if(is.disord(value)){
    stopifnot(consistent(terms(x),value))
    jj <- value
  } else {
    jj[] <- value  # the meat
  }
  clifford(elements(terms(x)),elements(jj))
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

`is_ok_clifford` <- function(terms,coeffs){

    if(is.disord(terms) | is.disord(coeffs)){
        stopifnot(disordR::consistent(terms,coeffs))
    }

    terms <- elements(terms)
    d <- getOption("maxdim")
    if(!is.null(d)){
      jj <- c(elements(terms),recursive=TRUE)
      if((length(jj)>0) && any(jj>d)){
        stop("option maxdim exceeded")
      }
    }

    coeffs <- elements(coeffs)

    stopifnot(is.list(terms))
  
    term_elements <- c(terms,recursive = TRUE)


    if(!is.null(term_elements)){
      stopifnot(all(term_elements > 0))
    }
    
    term_elements_increase <- c(lapply(terms,diff),recursive=TRUE)
    stopifnot(all(term_elements_increase > 0))

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

`is.zero.clifford` <- function(x){
    if(is.clifford(x)){
        out <- nterms(x)==0
    } else {
        out <- x==0
    }
    return(out)
}

setGeneric("is.zero",function(x){standardGeneric("is.zero")})
setMethod("is.zero","clifford",is.zero.clifford)
setMethod("is.zero","ANY",function(x){x==0})


`is.real` <- function(C){length(c(elements(terms(C)),recursive=TRUE))==0}
`is.scalar` <- is.real
`nbits` <- function(x){
    if(clifford::is.real(x)){
        return(0)
    } else {
        return(max(c(elements(terms(x)),recursive=TRUE)))
    }
}

setGeneric("dim")
`dim.clifford` <- function(x){max(c(elements(terms(x)),recursive=TRUE))}

`grades` <- function(x){  #special dispensation for the zero clifford object
    if(is.zero(x)){
        out <- numeric(0)
    } else {
        out <- unlist(lapply(terms(x),length))
    } 
    return(disord(out,hashcal(x)))
}

`scalar` <- function(x=1){clifford(list(numeric(0)),x)}
`as.scalar` <- `scalar`
`as.1vector` <- function(x){clifford(as.list(seq_along(x)),x)}
`pseudoscalar` <- function(){
  m <- getOption("maxdim")
  if(is.null(m)){
    stop("maxdim not set")
  } else {
    return(e(seq_len(m)))
  }
}
`is.pseudoscalar` <- function(C){
    if(!is.clifford(C)){return(FALSE)}
    if(is.zero(C)){return(TRUE)}

    m <- getOption("maxdim")
    if(is.null(m)){
      warning("maxdim not set")
      return(FALSE)
    }

    jj <- terms(C)
    if(length(jj) != 1){return(FALSE)}
    return(all(jj[[1]] == seq_len(m)))
}

`antivector` <- function(v,n=length(v)){
    stopifnot(n>=length(v))
    clifford(sapply(seq_along(v),function(i){seq_len(n)[-i]},simplify=FALSE),v)
}

`as.antivector` <- function(v){antivector(v)}
`is.antivector` <- function(C, include.pseudoscalar=FALSE){
  if(!is.homog(C)){return(FALSE)}
  if(include.pseudoscalar && is.pseudoscalar(C)){return(TRUE)}
  return(all(grades(C) == maxyterm(C)-1))
}

`basis` <- function(n,x=1){
    if(identical(as.integer(n),0L)){
        return(scalar(1))
    } else {
        return(clifford(list(n),x))
    }
}

`e` <- basis

`rcliff` <- function(n=9,d=6,g=4,include.fewer=TRUE){
  if(include.fewer){
    f <- function(...){sample(g,1)}
  } else {
    f <- function(...){g}
  }
  out <- clifford(unique(replicate(n,sort(sample(d,f())),simplify=FALSE)),sample(n)-round(n/2))
  if(include.fewer){out <- out + round(1+mean(abs(coeffs(out))))}
  return(out)
} 

`rclifff` <- function(n=100,d=20,g=10,include.fewer=TRUE){
    rcliff(n=n,d=d,g=g,include.fewer=include.fewer)
}

`rblade` <- function(d=7,g=3){
    Reduce(`%^%`, sapply(seq_len(g), function(...) {
        as.1vector(sample(1:5,d,replace=TRUE))
    }, simplify = FALSE))
}

`print.clifford` <- function(x,...){
  cat("Element of a Clifford algebra, equal to\n")

  out <- ""
  tx <- terms(x)
  cx <- coeffs(x)
  for(i in seq_along(tx)){
    co <- elements(cx)[i]
    if(co>0){
      pm <- " + " # pm = plus or minus
    } else {
      pm <- " - "
    }
    co <- capture.output(cat(abs(co)))
    jj <- catterm(elements(tx)[[i]])
    out <- paste(out, pm, co, jj, sep="")
  }
  if(is.zero(x)){
      out <- "the zero clifford element (0)"
  } else if(is.scalar(x)){
      out <- paste("scalar (",capture.output(cat(cx)),")")
  }
  cat(paste(strwrap(out, getOption("width")), collapse="\n"))
  cat("\n")
  return(x)
}

setGeneric("drop")
setMethod("drop","clifford", function(x){
    if(is.zero(x)){
      return(0)
    } else if(is.scalar(x)){
      return(const(x))
    } else if(!is.null(getOption("maxdim"))){
      if(is.pseudoscalar(x)){return(coeffs(x))}
    } else {
      return(x)
    }
})

`grade` <- function(C,n,drop=TRUE){
  C <- as.clifford(C)
  out <- as.clifford(c_grade(terms(C),coeffs(C),maxyterm(C),n))
  if(drop){out <- drop(out)}
  return(out)
}

`grade<-` <- function(C,n,value){
    coeffs(C)[grades(C) %in% n] <- value
    return(C)
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

`scalprod` <- function(C1,C2=rev(C1),drop=TRUE){
    C1 <- as.clifford(C1)
    C2 <- as.clifford(C2)
    grade(C1*C2,0,drop=drop)
}

`eucprod` <- function(C1,C2=C1,drop=TRUE){
    C1 <- as.clifford(C1)
    C2 <- as.clifford(C2)
    grade(C1*Conj(C2),0,drop=drop)
}

`Mod.clifford` <- function(z){sqrt(abs(eucprod(z)))}

`is.even` <- function(C){all(grades(C)%%2==0)}
`is.odd`  <- function(C){all(grades(C)%%2==1)}

`evenpart` <- function(C){
    wanted <- which(unlist(lapply(elements(terms(C)),length))%%2==0)
    clifford(elements(terms(C))[wanted],coeffs=elements(coeffs(C))[wanted])
}

`oddpart` <- function(C){
    wanted <- which(unlist(lapply(elements(terms(C)),length))%%2==1)
    clifford(elements(terms(C))[wanted],coeffs=elements(coeffs(C))[wanted])
}

`allcliff` <- function(n,grade){
    if(missing(grade)){
        out <- clifford(apply(expand.grid(rep(list(0:1),n))>0,1,which),1)
    } else {
        out <- clifford(asplit(partitions::allbinom(n,grade),2))
    }
    return(out)
}

`zap` <- function(x,drop=TRUE,digits=getOption("digits")){
    out <- clifford(terms(x),base::zapsmall(coeffs(x),digits=digits))
    if(drop){out <- drop(out)}
    return(out)
}

`catterm` <- function(a){
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
  tx <- elements(terms(x))
  cx <- elements(coeffs(x))
  for(i in seq_along(tx)){
    co <- cx[i]
    if(co>0){
      pm <- " + " # pm = plus or minus
    } else {
      pm <- " - "
    }
    co <- abs(co)
    jj <- catterm(tx[[i]])
    out <- paste(out, pm, co, jj, sep="")
  }

  if(is.zero(x)){
    out <- "0"
  } else if(is.scalar(x)){
    out <- as.character(coeffs(x))
  } 
  return(out)
}

`gradesplus` <- function(x){
    if(is.zero(x)){return(disord(numeric(0),hashcal(x)))}
    p <- signature()[1]
    return(disord(unlist(lapply(terms(x),function(o){sum(o <= p)})),hashcal(x)))
}

`gradesminus` <- function(x){
    if(is.zero(x)){return(disord(numeric(0),hashcal(x)))}
    p <- signature()[1]
    q <- signature()[2]
    return(disord(unlist(lapply(terms(x),
                                function(o){
                                    sum((o > p) & (o <= p+q))
                                }
                                )),hashcal(x)))
}

`gradeszero` <- function(x){
    if(is.zero(x)){return(disord(numeric(0),hashcal(x)))}
    p <- signature()[1]
    q <- signature()[2]
    return(disord(unlist(lapply(terms(x),
                                function(o){
                                    sum(o > p+q)
                                }
                                )),hashcal(x)))
}

`first_n_last` <- function(x){
  n <- nterms(x)
  paste(
      as.character(clifford(list(x[[1]][[1]]),x[[2]][1])), " ...",
      as.character(clifford(list(x[[1]][[n]]),x[[2]][n]))
  )
}

`summary.clifford` <- function(object, ...){
  out <- list(
      first_n_last = first_n_last(object),
      nterms       = nterms(object),
      magnitude    = eucprod(object)
  )
  class(out) <- "summary.clifford"
  return(out)
}

"print.summary.clifford" <- function(x, ...){
  cat("Element of a Clifford algebra \n")  
  cat("Typical terms: ", x[[1]],"\n") 
  cat("Number of terms:", x[[2]],"\n") 
  cat("Magnitude:", x[[3]],"\n") 
}

`as.vector.clifford` <- function(x, mode="any"){
    tx <- terms(x)
    stopifnot(all(lapply(tx,length)==1))
    tx <- unlist(tx)
    out <- rep(0,max(tx))
    out[tx] <- coeffs(x)
    return(out)
}

`horner` <- function(P,v){Reduce(v, right=TRUE, f=function(a,b){b*P + a})}

setOldClass("clifford")
setMethod("[", signature(x="dot",i="clifford",j="ANY"),
          function(x,i,j,drop){
              j <- as.clifford(j)
              return((i*j-j*i)/2)
          })


setGeneric("sort")
setGeneric("lapply")


