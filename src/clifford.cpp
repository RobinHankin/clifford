#include "clifford.h"

// [[Rcpp::export]]
List c_identity(const List &L, const NumericVector &p, const NumericVector &m){
    const clifford out = prepare(L,p,m);
    return retval(out);
}

// [[Rcpp::export]]
List c_add(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){
    return retval(c_add(prepare(L1,c1,m),prepare(L2,c2,m)));
}

// [[Rcpp::export]]
List c_multiply(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(c_prod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_power(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
          const NumericVector &p,
          const NumericVector &sig
          ){
  return retval(c_power(prepare(L1,c1,m),p,sig));
}

// [[Rcpp::export]]
bool c_equal(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){
  return c_equal(prepare(L1,c1,m),prepare(L2,c2,m));
}
