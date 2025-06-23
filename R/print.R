`print.clifford` <- function(x, ...){
    o <- getOption("clifford_print_special")
    if(is.null(o)){
        print_clifford_default(x, ...)
    } else if(o == "quaternion"){
        print_clifford_quaternion(x)
    } else {
        stop('Option "clifford_print_special", if not NULL, should be "quaternion"')
    }
}

`print_clifford_default` <- function(x,...){
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
  return(invisible(x))
}

`print.sigobj` <- function(x,...){
    print(ifelse(x == .Machine$integer.max, Inf, x))
}

`print_special` <- function(x, params, name, positive = TRUE, article = "A"){
  if(x != (x <- x[params])){ stop(paste("not a pure", name)) }
  
  negative <- cbind(!positive,seq_along(params))[,1]
  getval <- function(i){  # returns numeric
      out <- getcoeffs(x,list(params[[i]]))
      if(negative[i]){out <- -out}
      return(out)
  }
  
  getstring <- function(i){
      out <- getval(i)
      jj <- capture.output(cat(out))
      if(out > 0){ out <- paste("+", jj, sep="") }
      return(out)
  }

  if(getval(1) != 0){out <- getstring(1)} else {out <- ""}
  for(i in seq_along(params)[-1]){
    if(getval(i) != 0){
      out <- paste(out, paste(" ", getstring(i), names(params)[i],sep=""),  sep="")
    }
  }
    
  cat(paste(article, name, "equal to: \n",sep=" "))
  cat(paste(strwrap(out, getOption("width")), collapse = "\n"))
  cat("\n")
  return(invisible(out))
}

`print_clifford_quaternion` <- function(x){
    stopifnot(getOption("maxdim") == 3)
    stopifnot(signature()[1] >= 3)
    print_special(x,
                  params = list(" " = 0, i=c(1,2), j=c(1,3), k=c(2,3)),
                  positive=c(TRUE,FALSE,FALSE,FALSE),
                  name = "quaternion", article = "A")
}
