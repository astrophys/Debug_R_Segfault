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
//#define INTEGER int   // doesn't work
//INTEGER my_cpp_add(INTEGER A, INTEGER B)
//using namespace std;

//' @export
// [[Rcpp::export]]
int my_cpp_add(int A, int B)
{
    return(A+B);
}
