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

// [[Rcpp::export]]
int my_cpp_add(int A, int B)
{
    return(A+B);
}
