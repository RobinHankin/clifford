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
  return retval(add_lowlevel(prepare(L1,c1,m),prepare(L2,c2,m)));
}

// [[Rcpp::export]]
List c_multiply(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(geometricprod_lowlevel(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_power(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const NumericVector &p,
          const NumericVector &sig
          ){
  return retval(power_lowlevel(prepare(L,c,m),p,sig));
}

// [[Rcpp::export]]
List c_grade(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
  return retval(grade_lowlevel(prepare(L,c,m),n));
}

// [[Rcpp::export]]
bool c_equal(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){
  return equal_lowlevel(prepare(L1,c1,m),prepare(L2,c2,m));
}

// [[Rcpp::export]]
NumericVector c_getcoeffs(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const List &B
          ){
  return coeffs_lowlevel(prepare(L,c,m),B,m);
}

// [[Rcpp::export]]
List c_outerprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(outerprod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_innerprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(innerprod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_fatdotprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(fatdotprod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_lefttickprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(lefttickprod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_righttickprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  return retval(righttickprod(prepare(L1,c1,m),prepare(L2,c2,m),sig));
}

// [[Rcpp::export]]
List c_overwrite(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,
          const NumericVector &m
          ){
  return retval(overwrite(prepare(L1,c1,m),prepare(L2,c2,m)));
}

// [[Rcpp::export]]
List c_cartan(
          const List &L,
	  const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
        return retval(cartan(prepare(L,c,m),n));
}

// [[Rcpp::export]]
List c_cartan_inverse(
          const List &L,
	  const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
        return retval(cartan_inverse(prepare(L,c,m),n));
}
