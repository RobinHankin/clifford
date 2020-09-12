`signature` <- function(s){
    if(missing(s)){  # return SOL
        s <- getOption("signature")
        if(is.null(s)){s <- .Machine$integer.max}
        if(is.infinite(s)){s <- .Machine$integer.max}
        showsig(s)
        class(s) <- "sigobj"
        return(s)
    } else { # set signature
        stopifnot(is_ok_sig(s))
        if(is.infinite(s)){s <- .Machine$integer.max}
        options("signature" = s)
        showsig(s)
        return(invisible(s))
    }
}

`showsig` <- function(s){
    if(isTRUE(getOption("show_signature"))){
        if(s == .Machine$integer.max){
            options("prompt" = "sig Inf> ")
        } else if (s < 0){
            options("prompt" = "Grassman > ")
        } else {
            options("prompt" = paste("sig", s, "> "))
        }
    } 
}

`print.sigobj` <- function(x,...){
    print(ifelse(x == .Machine$integer.max, Inf, x))
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

maxyterm <- function(C1,C2=as.clifford(0)){
    return(max(c(0,terms(C1),terms(C2),recursive=TRUE)))
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
            return(geoprod(e1, e2))
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
            return(geoprod(e1,clifford_inverse(e2)))
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
        if(lclass || rclass){
            return(clifford_eq_clifford(as.clifford(e1),as.clifford(e2)))
        } else {
            stop("Generic '==' called inappropriately")
        }
    } else if (.Generic == "!=") {
         if(lclass || rclass){
            return(!clifford_eq_clifford(as.clifford(e1),as.clifford(e2)))
        } else {
            stop("Generic '!=' called inappropriately")
        }
    }
}

`clifford_negative` <- function(C){
    if(is.zero(C)){
        return(C)
    } else {
        return(clifford(terms(C),-coeffs(C)))
    }
}

`geoprod` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_multiply(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

`clifford_times_scalar` <- function(C,x){
    clifford(terms(C),x*coeffs(C))
}

`clifford_inverse` <- function(C){
    if(signature()<0){stop("inverses not defined for Grassman algebra")}

    if((all(grades(C)==1)) || is.pseudoscalar(C)){
        return(clifford_times_scalar(Conj(C),1/eucprod(C)))
    }

    if(nbits(C)>5){stop("inverses only defined for p+q <=5")}
    jj <- cliffconj(C)*gradeinv(C)*rev(C)
    jj <- jj*neg(C*jj,c(1L,4L))
    jj/drop(zap(C*jj))
}

`clifford_plus_clifford` <- function(C1,C2){
    if(is.zero(C1)){
        return(C2)
    } else if(is.zero(C2)){
        return(C1)
    } else {
        return(as.clifford(c_add(
      L1 = terms(C1), c1 = coeffs(C1),
      L2 = terms(C2), c2 = coeffs(C2),
      m  = maxyterm(C1,C2)
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
      L   = terms(C), c = coeffs(C),
      m   = maxyterm(C),
      p   = n,
      sig = signature()
  )))
  }
}
        
`clifford_eq_clifford` <- function(C1,C2){
  c_equal(
      L1  = terms(C1), c1 = coeffs(C1),
      L2  = terms(C2), c2 = coeffs(C2),
      m   = maxyterm(C1,C2)
  )
}

`wedge` <- function(C1,C2){
    C2 <- as.clifford(C2)
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_outerprod(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

`cliffdotprod` <- function(C1,C2){
    C1 <- as.clifford(C1)
    C2 <- as.clifford(C2)
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_innerprod(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

`cross` <- function(C1,C2){(C1*C2-C2*C1)/2}
star <- scalprod

`fatdot` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_fatdotprod(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

`lefttick` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_lefttickprod(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

`righttick` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
  } else {
    return(as.clifford(c_righttickprod(
        L1  = terms(C1), c1 = coeffs(C1),
        L2  = terms(C2), c2 = coeffs(C2),
        m   = maxyterm(C1,C2),
        sig = signature()
    )))
  }
}

"%.%" <- function(C1,C2){UseMethod("%.%")}
"%^%" <- function(C1,C2){UseMethod("%^%")}
"%X%" <- function(C1,C2){UseMethod("%X%")}
"%star%" <- function(C1,C2){UseMethod("%star%")}
"% %" <- function(C1,C2){UseMethod("% %")}
"%euc%" <- function(C1,C2){UseMethod("%euc%")}
"%o%" <- function(C1,C2){UseMethod("%o%")}
"%_|%" <- function(C1,C2){UseMethod("%_|%")}
"%|_%" <- function(C1,C2){UseMethod("%|_%")}

"%.%.clifford" <- function(C1,C2){cliffdotprod(C1,C2)}
"%^%.clifford" <- function(C1,C2){wedge(C1,C2)}
"%X%.clifford" <- function(C1,C2){cross(C1,C2)}
"%star%.clifford" <- function(C1,C2){scalprod(C1,C2)}
"% %.clifford" <- function(C1,C2){geoprod(C1,C2)}
"%euc%.clifford" <- function(C1,C2){eucprod(C1,C2)}
"%o%.clifford" <- function(C1,C2){fatdot(C1,C2)}
"%_|%.clifford" <- function(C1,C2){lefttick(C1,C2)}
"%|_%.clifford" <- function(C1,C2){righttick(C1,C2)}
