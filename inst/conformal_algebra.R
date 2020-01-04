dimension <- 3
signature(dimension + 1)
 eplus <- basis(dimension+1)
 eminus <- basis(dimension + 2)
 e0 <-  (eminus - eplus)/2
einf <- eminus + eplus
E <- e0 %^% einf

`as.point` <- function(C){
    stopifnot(signature() == 4)
}

point <- function(x){  # point
    stopifnot(length(x)==dimension)
    as.1vector(x) + sum(x^2)*einf/2 + e0
}

sphere <- function(x,r){  # sphere
    point(x) - r^2*einf/2
}

spherestar <- function(...){ # eg   p1 %^% p2 %^% p3 %^% p4  
    jj <- list(...)
    stopifnot(length(jj) == dimension+1)
    Reduce(`%^%`,jj)
}

plane <- function(n,d){
    stopifnot(length(x)==dimension)
    stopifnot(length(d) == 1)
    as.1vector(n/sqrt(sum(n^2))) + d*einf
}

planestar <- function(...){ # eg   p1 %^% p2 %^% p3 %^% p4  
    jj <- list(...)
    stopifnot(length(jj) == dimension)
    Reduce(`%^%`,jj) %^% einf
}

circle     <- function(S1,S2){S1 %^% S2}
circlestar <- function(S1,S2){S1 %^% S2}

line <- function(){}
pointpair <- function(){}
homogpoint <- function(){}


lne 
