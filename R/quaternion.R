`clifford_to_quaternion` <- function(C){
    C <- as.clifford(C)
    stopifnot(all(c(terms(C),recursive=TRUE) <= 3))
    jj <- unlist(lapply(terms(C),length))
    stopifnot(all(jj <= 2))
    stopifnot(all(jj%%2 == 0))
    out <- matrix(c(const(C), -getcoeffs(C,list(c(1,2),c(1,3),c(2,3)) )))
    class(out) <- c("onion","quaternion")
  return(out)
}

`quaternion_to_clifford` <- function(Q){
  Q <- as.numeric(Q)
  stopifnot(length(Q)==4)
  clifford(list(numeric(0),c(1,2),c(1,3),c(2,3)),c(Q[1],-Q[2:4]))
}
