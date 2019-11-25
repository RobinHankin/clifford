// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

// [[Rcpp::depends(BH)]]


#include <map>
#include <iostream>
#include <Rcpp.h>
#include <iterator>
#include <vector>
#include <assert.h>
#include <tuple>
#include <boost/dynamic_bitset.hpp>

using namespace std;
using namespace Rcpp;

typedef boost::dynamic_bitset<> blade;  
typedef map<blade, long double> clifford;
typedef std::tuple<blade, int> blade_and_sign;

clifford remove_zeros(clifford &C){
   for(auto it=C.begin() ; it != C.end() ;){
        if(it->second == 0){
            it = C.erase(it); //increments pointer
        } else {
            ++it; // increment anyway
        }
    } 
    return(C);
}

clifford prepare(const List &L, const NumericVector &d, const NumericVector &m){
    clifford out;
    const unsigned n=L.size();
    for(int i=0 ; i<n ; i++){
        if(d[i] != 0){
            Rcpp::IntegerVector iv = as<Rcpp::IntegerVector> (L[i]);
            blade b;
            b.resize(m[0]+1);  //off-by-one
            for(int j=0 ; j < iv.size(); j++){
                b[iv[j]] = 1;
            }
            out[b] += d[i];  // the meat
        } // if d[i] closes
    }  // i loop closes
    return remove_zeros(out);
}

Rcpp::IntegerVector which(const blade b){ // takes a blade, returns which(blade)
    Rcpp::IntegerVector out;
    unsigned int i;
    for(i=0 ; i<b.size() ; ++i){
        if((bool) b[i]){
            out.push_back(i); // the meat; off-by-one here
        }
    }
    return out;
}


List Rblades(const clifford C){  // takes a clifford object, returns a list of which(blades); used in retval()
    List out;
    clifford::const_iterator ic;
    for(ic=C.begin(); ic != C.end(); ++ic){
        out.push_back(which(ic->first));
    }
    return(out);
}

NumericVector coeffs(const clifford C){  // takes a clifford object, returns the coefficients
    NumericVector out(C.size());
    unsigned int i=0;
    clifford::const_iterator ic;   // it iterates through a hyper2 object
    
    for(ic=C.begin(); ic != C.end(); ++ic){
        out[i] = ic->second;
        i++;
    }
    return out;
}

List retval(const clifford &C){  // used to return a list to R
        return List::create(Named("blades") =  Rblades(C),
                            Named("coeffs") =  coeffs(C)
                            );
}

clifford c_add(clifford cliff1, clifford cliff2){
    clifford::iterator ic;
    if(cliff1.size() > cliff2.size()){ // #1 is bigger, so iterate through #2
        for (ic=cliff2.begin(); ic != cliff2.end(); ++ic){
            const blade b = ic->first;
            cliff1[b] += cliff2[b];  
        }
        return remove_zeros(cliff1);
    } else {  // L2 is bigger
        for (ic=cliff1.begin(); ic != cliff1.end(); ++ic){
            const blade b = ic->first;
            cliff2[b] += cliff1[b];  
        }
        return remove_zeros(cliff2);
    }
}

blade_and_sign juxtapose(blade b1, blade b2, const unsigned int signature){//juxtaposes two blades, returns reduction and sign
    int sign = 1;
    blade bout;
    const unsigned int m = max(b1.size(),b2.size());

    b1.resize(m);
    b2.resize(m);
    bout.resize(m);        

    for(int i=0 ; i<m ; ++i){
        
        if       (((bool)~b1[i]) & ((bool)~b2[i])){ bout[i] = false;   // neither
        } else if(((bool) b1[i]) & ((bool)~b2[i])){ bout[i] = true;   // just b1
        } else if(((bool)~b1[i]) & ((bool) b2[i])){ bout[i] = true;   // just b2
        } else if(((bool) b1[i]) & ((bool) b2[i])){ bout[i] = false;  // both, but...
            if((signature>0) && (i>signature)){sign *= -1;};  // ...swap sign!  NB check for off-by-one error
        }
    }
    return std::make_tuple(bout,sign);
}

clifford c_prod(const clifford C1, const clifford C2, const NumericVector &signature){
    clifford out;
    clifford::const_iterator ic1,ic2;
    blade b;
    int sign;
    for(ic1=C1.begin(); ic1 != C1.end(); ++ic1){
        for(ic2=C2.begin(); ic2 != C2.end(); ++ic2){
            tie(b, sign) = juxtapose(ic1->first, ic2->first, signature[0]);
            out[b] += sign*(ic1->second)*(ic2->second); // the meat
        }
    }
    return out;
}

clifford c_power(const clifford C, const NumericVector &power, const NumericVector &signature){  // p for power
    clifford out;
    unsigned int p = power[0];
    if(p<1){throw std::range_error("power cannot be <1");} 
    if(p==1){
        return C;
    } else {
        out = C; 
        for( ; p>1; p--){
            out = c_prod(C,out,signature[0]);
        }
    }
    return out;
}

bool c_equal(clifford C1, clifford C2){
    // modelled on spray_equality()
    if(C1.size() != C2.size()){
        return false;
    }

    for (clifford::const_iterator ic=C1.begin(); ic != C1.end(); ++ic){
        blade b = ic->first;
        if(C1[b] != C2[b]){
            return false;
        } else {
            C2.erase(b);
        }
    }
    
    if(C2.empty()){
        return true;
    } else {
        return false;
    }
}
