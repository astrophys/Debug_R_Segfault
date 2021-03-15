/*****************************************************
Author : Ali Snedden
Date   : 1/9/21
License: MIT
Purpose:
Refs   : 
    1. https://r-pkgs.org/src.html

****************************************************/
#include <Rcpp.h>
using namespace Rcpp;
//using namespace std;

// [[Rcpp::export]]
INTEGER my_cpp_add(INTEGER A, INTEGER B)
{
    return(A+B);
}
