## Some preliminary work on the map Cl(p+1,q+1) -> M(Cl(p,2),2,2)

## Follows E. Hitzer and S. Sangwine 2017. "Multivector and
## multivector matrix inverses in real Clifford algebras", Applied
## Mathematics and Computation. 311:3755-89

hitzerC7 <- function(m){
    p <- signature(m)
    q <-  nbits(m)-p

    b1 <- e(c(seq_len(p), seq(from=p+2,to=p+q+1)))
    b2 <- e(seq_len(p+1+q))
    b3 <- e(p+1)
    b4 <- e(c(seq_len(p),seq(from=p+2,to=p+1+q+1)))
    b5 <- e(p+1+q+1)
    b6 <- b3 * b5

    b1_inv <- Conj(b1)
    b2_inv <- Conj(b2)
    b3_inv <- Conj(b3)
    b4_inv <- Conj(b4)
    b5_inv <- Conj(b5)
    b6_inv <- Conj(b6)
    
    return(cmat(  
        m1 = (m %_|% b1) * b1_inv                        ,
        m2 = (((m-m1) %_|% b2) * b2_inv) %|_% b3_inv     ,
        m3 = (((m-m1-m2) %_|% b4 ) * b4_inv) %|_% b5_inv ,
        m4 = (m-m1-m2-m3) %|_% b6_inv
    ))
}
        
cmat <- function(m1,m2,m3,m4){# short for "clifford matrix"
    out <- list(m1,m2,m3,m4)
    class(out) <- "cmat"
    return(out)
}

"Ops.cmat" <- function (e1, e2 = NULL) 
{
    oddfunc <- function(...){stop("odd---neither argument has class clifford?")}
    unary <- nargs() == 1
    lclass <- nchar(.Method[1]) > 0
    rclass <- !unary && (nchar(.Method[2]) > 0)
    
    if(unary){
        if (.Generic == "+") {
            return(e1)
        } else if (.Generic == "-") {
            return(cmat_negative(e1))
        } else {
            stop("Unary operator '", .Generic, "' is not implemented for cmat objects")
        }
    }

    if (!is.element(.Generic, c("+", "-", "*", "/","^", "==", "!="))){
        stop("Operator '", .Generic, "' is not implemented for cmat objects")
    }

    if (.Generic == "*") {
        if (lclass && rclass) {
            return(cmat_prod_cmat(e1, e2))
        } else if (lclass) {
            return(cmat_prod_scalar(e1, e2))
        } else if (rclass) {
            return(scalar_prod_cmat(e1, e2))
        } else {
            oddfunc()
        }
    } else if (.Generic == "/") {
        if(lclass & !rclass){
            return(cmat_prod_scalar(e1,1/e2))
        } else if (!lclass & rclass){
            return(cmat_prod_scalar(e1,cmat_inverse(e2)))
        } else if (lclass & rclass){
            return(cmat_prod_cmat(e1,cmat_inverse(e2)))
        } else {
            oddfunc()
        }
    } else if (.Generic == "+") {
         return(cmat_plus_cmat(e1,e2))
    } else if (.Generic == "-") {
        return(cmat_plus_cmat(e1,cmat_negative(e2)))
    } else if (.Generic == "^") {
        if(lclass && !rclass){
            stop("powers not implemented")
        } else {
            stop("Generic '^' not implemented in this case")
        }
    } else if (.Generic == "==") {
        if(lclass && rclass){
            stop("== not implemented")
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    } else if (.Generic == "!=") {
         if(lclass && rclass){
            stop("== not implemented")
        } else {
            stop("Generic '==' only compares two clifford objects with one another")
        }
    }
}

cmat_negative    <- function(x){stop("not implemented")}
cmat_plus_cmat   <- function(x){stop("not implemented")}
cmat_prod_cmat   <- function(x){stop("not implemented")}
cmat_prod_scalar <- function(x){stop("not implemented")}
scalar_prod_cmat <- function(x){stop("not implemented")}

