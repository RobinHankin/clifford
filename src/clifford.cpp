// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-



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
            for(int j=0 ; j<(unsigned int) iv.size(); j++){
                b[iv[j]] = 1;
            }
            out[b] += d[i];  // the meat
        } // if d[i] closes
    }  // i loop closes
    return(out);
}


