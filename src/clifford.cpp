#include "clifford.h"

// [[Rcpp::export]]
List identity(const List &L, const NumericVector &p, const NumericVector &m){
    const clifford out = prepare(L,p,m);
    return retval(out);
}

// [[Rcpp::export]]
List add(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){
    return retval(c_add(prepare(L1,c1,m),prepare(L2,c2,m)));
}

