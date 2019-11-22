// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

// [[Rcpp::depends(BH)]]


#include <map>
#include <iostream>
#include <Rcpp.h>
#include <iterator>
#include <vector>
#include <assert.h>

using namespace std;
using namespace Rcpp;

typedef std::vector<bool> blade;  // technically wrong but...
typedef map<blade, long double> clifford;

clifford prepare(const List &L, const NumericVector &d, const NumericVector &m){
    clifford out;
    const unsigned n=L.size();

    for(int i=0; i<n ; i++){
        if(d[i] != 0){
            Rcpp::IntegerVector iv = as<Rcpp::IntegerVector> (L[i]);
            blade b;
            b.resize(m[0]);
            for(int j=0 ; j < iv.size(); j++){
                b[iv[j]] = 1;
            }
            out[b] += d[i];  // the meat
        } // if d[i] closes
    }  // i loop closes
    return(out);
}

List makeblades(const clifford C){  // takes a clifford object, returns the blades
    List out;
    clifford::const_iterator ic;
    
    for(ic=C.begin(); ic != C.end(); ++ic){
        out.push_back(ic->first);
    }
    return(out);
}

NumericVector makecoeffs(const clifford C){  // takes a clifford object, returns the coefficients
    NumericVector out(C.size());
    unsigned int i=0;
    clifford::const_iterator ic;   // it iterates through a hyper2 object
    
    for(ic=C.begin(); ic != C.end(); ++ic){
        out(i++) = ic->second;   // initialize-and-fill is more efficient than  out.push_back(it->second) 
    }
    return(out);
}

List retval(const clifford &C){  // used to return a list to R
    
        return List::create(Named("blades") =  makeblades(C),
                            Named("coeffs") =  makecoeffs(C)
                            );
}

// [[Rcpp::export]]
List identity(const List &L, const NumericVector &p, const NumericVector &m){
    const clifford out = prepare(L,p,m);
    return retval(out);
}

clifford c_add(clifford cliff1, clifford cliff2){
    clifford::iterator ic;
    if(cliff1.size() > cliff2.size()){ // #1 is bigger, so iterate through #2
        for (ic=cliff2.begin(); ic != cliff2.end(); ++ic){
            const blade b = ic->first;
            cliff1[b] += cliff2[b];  
        }
        return cliff1;
    } else {  // L2 is bigger
        for (ic=cliff1.begin(); ic != cliff1.end(); ++ic){
            const blade b = ic->first;
            cliff2[b] += cliff1[b];  
        }
        return cliff2;
    }
}

// [[Rcpp::export]]
List add(
          const List &L1, const NumericVector &c1,
          const List &L2, const NumericVector &c2,  // c[12] = coeffs
          const NumericVector &m
          ){

    return retval(c_add(prepare(L1,c1,m),prepare(L2,c2,m)));
}


blade juxtapose(const blade b1, const blade b2){
    signed int sign;
    blade::iterator i1,i2;
}

clifford prod(const clifford C1, const clifford C2){
    clifford out;
}





