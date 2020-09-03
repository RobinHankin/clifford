// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// c_identity
List c_identity(const List& L, const NumericVector& p, const NumericVector& m);
RcppExport SEXP _clifford_c_identity(SEXP LSEXP, SEXP pSEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L(LSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type p(pSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    rcpp_result_gen = Rcpp::wrap(c_identity(L, p, m));
    return rcpp_result_gen;
END_RCPP
}
// c_add
List c_add(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m);
RcppExport SEXP _clifford_c_add(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    rcpp_result_gen = Rcpp::wrap(c_add(L1, c1, L2, c2, m));
    return rcpp_result_gen;
END_RCPP
}
// c_multiply
List c_multiply(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_multiply(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_multiply(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_power
List c_power(const List& L, const NumericVector& c, const NumericVector& m, const NumericVector& p, const NumericVector& sig);
RcppExport SEXP _clifford_c_power(SEXP LSEXP, SEXP cSEXP, SEXP mSEXP, SEXP pSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L(LSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c(cSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type p(pSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_power(L, c, m, p, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_grade
List c_grade(const List& L, const NumericVector& c, const NumericVector& m, const NumericVector& n);
RcppExport SEXP _clifford_c_grade(SEXP LSEXP, SEXP cSEXP, SEXP mSEXP, SEXP nSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L(LSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c(cSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type n(nSEXP);
    rcpp_result_gen = Rcpp::wrap(c_grade(L, c, m, n));
    return rcpp_result_gen;
END_RCPP
}
// c_equal
bool c_equal(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m);
RcppExport SEXP _clifford_c_equal(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    rcpp_result_gen = Rcpp::wrap(c_equal(L1, c1, L2, c2, m));
    return rcpp_result_gen;
END_RCPP
}
// c_getcoeffs
NumericVector c_getcoeffs(const List& L, const NumericVector& c, const NumericVector& m, const List& B);
RcppExport SEXP _clifford_c_getcoeffs(SEXP LSEXP, SEXP cSEXP, SEXP mSEXP, SEXP BSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L(LSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c(cSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const List& >::type B(BSEXP);
    rcpp_result_gen = Rcpp::wrap(c_getcoeffs(L, c, m, B));
    return rcpp_result_gen;
END_RCPP
}
// c_outerprod
List c_outerprod(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_outerprod(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_outerprod(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_innerprod
List c_innerprod(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_innerprod(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_innerprod(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_fatdotprod
List c_fatdotprod(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_fatdotprod(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_fatdotprod(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_lefttickprod
List c_lefttickprod(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_lefttickprod(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_lefttickprod(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_righttickprod
List c_righttickprod(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m, const NumericVector& sig);
RcppExport SEXP _clifford_c_righttickprod(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP, SEXP sigSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type sig(sigSEXP);
    rcpp_result_gen = Rcpp::wrap(c_righttickprod(L1, c1, L2, c2, m, sig));
    return rcpp_result_gen;
END_RCPP
}
// c_overwrite
List c_overwrite(const List& L1, const NumericVector& c1, const List& L2, const NumericVector& c2, const NumericVector& m);
RcppExport SEXP _clifford_c_overwrite(SEXP L1SEXP, SEXP c1SEXP, SEXP L2SEXP, SEXP c2SEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L1(L1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c1(c1SEXP);
    Rcpp::traits::input_parameter< const List& >::type L2(L2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c2(c2SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    rcpp_result_gen = Rcpp::wrap(c_overwrite(L1, c1, L2, c2, m));
    return rcpp_result_gen;
END_RCPP
}
// c_cartan
List c_cartan(const List& L, const NumericVector& c, const NumericVector& m, const NumericVector& n);
RcppExport SEXP _clifford_c_cartan(SEXP LSEXP, SEXP cSEXP, SEXP mSEXP, SEXP nSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const List& >::type L(LSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type c(cSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type m(mSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type n(nSEXP);
    rcpp_result_gen = Rcpp::wrap(c_cartan(L, c, m, n));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_clifford_c_identity", (DL_FUNC) &_clifford_c_identity, 3},
    {"_clifford_c_add", (DL_FUNC) &_clifford_c_add, 5},
    {"_clifford_c_multiply", (DL_FUNC) &_clifford_c_multiply, 6},
    {"_clifford_c_power", (DL_FUNC) &_clifford_c_power, 5},
    {"_clifford_c_grade", (DL_FUNC) &_clifford_c_grade, 4},
    {"_clifford_c_equal", (DL_FUNC) &_clifford_c_equal, 5},
    {"_clifford_c_getcoeffs", (DL_FUNC) &_clifford_c_getcoeffs, 4},
    {"_clifford_c_outerprod", (DL_FUNC) &_clifford_c_outerprod, 6},
    {"_clifford_c_innerprod", (DL_FUNC) &_clifford_c_innerprod, 6},
    {"_clifford_c_fatdotprod", (DL_FUNC) &_clifford_c_fatdotprod, 6},
    {"_clifford_c_lefttickprod", (DL_FUNC) &_clifford_c_lefttickprod, 6},
    {"_clifford_c_righttickprod", (DL_FUNC) &_clifford_c_righttickprod, 6},
    {"_clifford_c_overwrite", (DL_FUNC) &_clifford_c_overwrite, 5},
    {"_clifford_c_cartan", (DL_FUNC) &_clifford_c_cartan, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_clifford(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
