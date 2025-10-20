#include "clifford.h"

/*
inline List prepare_then_call(const List &L, const NumericVector &c, const NumericVector &m,
                              std::function<clifford(const clifford&)> op) {
    const clifford cliff = prepare(L, c, m);
    return retval(op(cliff));
}
*/

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
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(add_lowlevel(cliff1, cliff2)); // the meat
}

// [[Rcpp::export]]
List c_multiply(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(geometricprod_lowlevel(cliff1, cliff2, sig)); // the meat
}

// [[Rcpp::export]]
List c_power(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const NumericVector &p,
          const NumericVector &sig
          ){
  const clifford cliff = prepare(L, c, m);
  return retval(power_lowlevel(cliff, p, sig)); // the meat
}

// [[Rcpp::export]]
List c_grade(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
  const clifford cliff = prepare(L, c, m);
  return retval(grade_lowlevel(cliff, n)); // the meat
}

// [[Rcpp::export]]
bool c_equal(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return equal_lowlevel(cliff1, cliff2); // the meat
}

// [[Rcpp::export]]
NumericVector c_getcoeffs(
          const List &L, const NumericVector &c,
          const NumericVector &m,
          const List &B
          ){
  const clifford cliff = prepare(L, c, m);
  return coeffs_lowlevel(cliff, B, m); // the meat
}

// [[Rcpp::export]]
List c_outerprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(outerprod(cliff1, cliff2, sig));  // the meat
}

// [[Rcpp::export]]
List c_innerprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(innerprod(cliff1, cliff2, sig));  // the meat
}

// [[Rcpp::export]]
List c_fatdotprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(fatdotprod(cliff1, cliff2, sig)); // the meat
}

// [[Rcpp::export]]
List c_lefttickprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(lefttickprod(cliff1, cliff2, sig)); // the meat
}

// [[Rcpp::export]]
List c_righttickprod(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m,
	  const NumericVector &sig
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(righttickprod(cliff1, cliff2, sig)); // the meat
}

// [[Rcpp::export]]
List c_overwrite(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,
          const NumericVector &m
          ){
  const clifford cliff1 = prepare(L1, c1, m);
  const clifford cliff2 = prepare(L2, c2, m);
  return retval(overwrite(cliff1, cliff2)); // the meat
}

// [[Rcpp::export]]
List c_cartan(
          const List &L,
	  const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
  const clifford cliff = prepare(L, c, m);
  return retval(cartan(cliff, n)); // the meat
}

// [[Rcpp::export]]
List c_cartan_inverse(
          const List &L,
	  const NumericVector &c,
          const NumericVector &m,
          const NumericVector &n
          ){
  const clifford cliff = prepare(L, c, m);
  return retval(cartan_inverse(cliff, n)); // the meat
}
