`signature` <- function(s){
    if(missing(s)){  # return SOL
        jj <- getOption("signature")
        if(!is.null(jj)){
            return(jj)
        } else {
            return(0)
        }
    } else { # set signature
        stopifnot(is_ok_sig(s))
        if(is.infinite(s)){s <- 0}
        options("signature" = s)
        if(isTRUE(getOption("show_signature"))){
            options("prompt" = paste(s, "> "))
        }
        return(s)
    }
}

`is_ok_sig` <- function(s){
    if(length(s) != 1){
        stop("signature must have length 1")
    } else if(s != round(s)){
      stop("signature must be an integer")
    } else {
      return(TRUE)
    }
}

maxyblade <- function(C1,C2=as.clifford(0)){
    return(max(c(0,blades(C1),blades(C2),recursive=TRUE)))
}
               
"Ops.clifford" <- function (e1, e2 = NULL) 
{
    oddfunc <- function(...){stop("odd---neither argument has class clifford?")}
    unary <- nargs() == 1
    lclass <- nchar(.Method[1]) > 0
    rclass <- !unary && (nchar(.Method[2]) > 0)
    
    if(unary){
        if (.Generic == "+") {
            return(e1)
        } else if (.Generic == "-") {
            return(clifford_negative(e1))
        } else {
            stop("Unary operator '", .Generic, "' is not implemented for clifford objects")
        }
    }

    if (!is.element(.Generic, c("+", "-", "*", "/","^", "==", "!="))){
        stop("Operator '", .Generic, "' is not implemented for clifford objects")
    }

    if (.Generic == "*") {
        if (lclass && rclass) {
            return(clifford_times_clifford(e1, e2))
        } else if (lclass) {
            return(clifford_times_scalar(e1, e2))
        } else if (rclass) {
            return(clifford_times_scalar(e2, e1))
        } else {
            oddfunc()
        }
    } else if (.Generic == "/") {
        if(lclass * !rclass){
            return(clifford_times_scalar(e1,1/e2))
        } else if (!lclass & rclass){
            return(clifford_times_scalar(clifford_inverse(e2),e1))
        } else if (lclass & rclass){
            return(clifford_times_clifford(e1,clifford_inverse(e2)))
        } else {
            oddfunc()
        }
    } else if (.Generic == "+") {
         return(clifford_plus_clifford(as.clifford(e2), as.clifford(e1)))
    } else if (.Generic == "-") {
            return(clifford_plus_clifford(as.clifford(e1),clifford_negative(as.clifford(e2))))
    } else if (.Generic == "^") {
      if(lclass && !rclass){
        return(clifford_power_scalar(e1,e2)) # S^n
        } else {
            stop("Generic '^' not implemented in this case")
        }
    } else if (.Generic == "==") {
        if(lclass && rclass){
            return(clifford_eq_clifford(as.clifford(e1),as.clifford(e2)))
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    } else if (.Generic == "!=") {
         if(lclass && rclass){
            return(!clifford_eq_clifford(as.clifford(e1),as.clifford(e2)))
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    }
}

`clifford_negative` <- function(C){
    if(is.zero(C)){
        return(C)
    } else {
        return(clifford(blades(C),-coeffs(C)))
    }
}

`clifford_times_clifford` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
    s <- getOption("signature")
  } else {
    return(as.clifford(c_multiply(
        L1  = blades(C1), c1 = coeffs(C1),
        L2  = blades(C2), c2 = coeffs(C2),
        m   = maxyblade(C1,C2),
        sig = signature()
    )))
  }
}

`clifford_times_scalar` <- function(C,x){
    clifford(blades(C),x*coeffs(C))
}

`clifford_inverse` <- function(C){
    stopifnot(is.blade(C))
    return(clifford_times_scalar(rev(C),1/scalprod(C)))
}

`clifford_plus_clifford` <- function(C1,C2){
    if(is.zero(C1)){
        return(C2)
    } else if(is.zero(C2)){
        return(C1)
    } else {
        return(as.clifford(c_add(
      L1 = blades(C1), c1 = coeffs(C1),
      L2 = blades(C2), c2 = coeffs(C2),
      m  = maxyblade(C1,C2)
      )))
    }
}

clifford_power_scalar <- function(C,n){
  stopifnot(n==round(n))
  if(n<0){
    stop("negative powers not implemented")
  } else if(n==0){
    return(as.clifford(1))
  } else {
    return(as.clifford(c_power(
      L   = blades(C), c = coeffs(C),
      m   = maxyblade(C),
      p   = n,
      sig = signature()
  )))
  }
}
        
`clifford_eq_clifford` <- function(C1,C2){
  c_equal(
      L1  = blades(C1), c1 = coeffs(C1),
      L2  = blades(C2), c2 = coeffs(C2),
      m   = maxyblade(C1,C2)
  )
}

`clifford_wedge_clifford` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
    s <- getOption("signature")
  } else {
    return(as.clifford(c_outerprod(
        L1  = blades(C1), c1 = coeffs(C1),
        L2  = blades(C2), c2 = coeffs(C2),
        m   = maxyblade(C1,C2),
        sig = signature()
    )))
  }
}

`clifford_dot_clifford` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
    s <- getOption("signature")
  } else {
    return(as.clifford(c_innerprod(
        L1  = blades(C1), c1 = coeffs(C1),
        L2  = blades(C2), c2 = coeffs(C2),
        m   = maxyblade(C1,C2),
        sig = signature()
    )))
  }
}

"%.%" <- function(C1,C2){UseMethod("%.%")}
"%.%.clifford" <- function(C1,C2){clifford_dot_clifford(C1,C2)}
"%^%" <- function(C1,C2){UseMethod("%^%")}
"%^%.clifford" <- function(C1,C2){clifford_wedge_clifford(C1,C2)}
