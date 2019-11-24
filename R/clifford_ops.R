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

    if (!is.element(.Generic, c("+", "-", "*", "^", "==", "!="))){
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
    } else if (.Generic == "+") {
            return(clifford_plus_clifford(as.clifford(e2), as.clifford(e1)))
        }
    } else if (.Generic == "-") {
            return(clifford_plus_clifford(as.clifford(e1),clifford_negative(as.clifford(e2))))
        } else {
            oddfunc()
        }
    } else if (.Generic == "^") {
        if(lclass && !rclass){
            return(clifford_power_scalar(e1,e2)) # S^n
        } else {
            stop("Generic '^' not implemented in this case")
        }
    } else if (.Generic == "==") {
        if(lclass && rclass){
            return(clifford_equals_clifford(e1,e2))
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    } else if (.Generic == "!=") {
        if(lclass && rclass){
            return(!clifford_equals_clifford(e1,e2))
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    }
}

`clifford_negative` <- function(C){
    if(is.zero(C)){
        return(C)
    } else {
        return(clifford(blade(C),-coeffs(C)))
    }
}

`clifford_times_clifford` <- function(C1,C2){
    if(is.zero(C1) || is.zero(C2)){
    return(as.clifford(0))
    s <- getOption("signature")
  } else {
      jj <- multiply(
          C1[[1]],C1[[2]],
          C2[[1]],C2[[1]],
          max(nbits(C1),nbits(C2)), s)
      return(clifford(jj[[1]],jj[[2]]),s)
  }
}

`clifford_times_scalar` <- function(C,x){
    clifford(blades(),x*coeffs(C))
}

`clifford_plus_clifford` <- function(S1,S2){
  if(is.zero(S1)){
        return(S2)
    } else if(is.zero(S2)){
        return(S1)
    } else {
        jj <- mvp_add(
            allnames1=S1[[1]],allpowers1=S1[[2]],coefficients1=S1[[3]],
            allnames2=S2[[1]],allpowers2=S2[[2]],coefficients2=S2[[3]]
        )
        return(mvp(jj[[1]],jj[[2]],jj[[3]]))
    }
}

`mvp_plus_numeric` <- function(S,x){
    mvp_plus_mvp(S,numeric_to_mvp(x))
}

mvp_power_scalar <- function(S,n){
  stopifnot(n==round(n))
  if(n<0){
    stop("negative powers not implemented")
  } else if(n==0){
    return(constant(1))
  } else {
      jj <- mvp_power(allnames=S[[1]],allpowers=S[[2]],coefficients=S[[3]],n=n)
      return(mvp(jj[[1]],jj[[2]],jj[[3]]))
  }
}

`mvp_eq_mvp` <- function(S1,S2){
  is.zero(S1-S2)  # nontrivial; S1 and S2 might have different orders
}
