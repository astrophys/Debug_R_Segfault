/*****************************************************
Author : Ali Snedden
Date   : 1/9/21
License: MIT
Purpose:
Refs   : 
    1. https://r-pkgs.org/src.html

****************************************************/
#include <Rcpp.h>
#include <stdio.h>
using namespace Rcpp;

// [[Rcpp::export]]
int my_cpp_add(int A, int B)
{
	printf("Adding %i + %i...\n", A, B);
    return(A+B);
}


// [[Rcpp::export]]
int my_cpp_multiply(int A, int B)
{
	printf("Multiplying %i x %i...\n", A, B);
    return(A*B);
}
