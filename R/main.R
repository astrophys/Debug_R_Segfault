# Author : Ali Snedden
# Date   : 1/8/21
# License: MIT
# Notes  :
#
#
# Purpose:
#   This package is my attempt to understand debugging compiled code. I'm having
#   difficulty debugging segmentation faults in R-TDA. Some outstanding questions :
#   1. How is the compiled code in R-TDA actually compiled. There isn't a Makefile
#      or configure file?
#   2. Why can't I get useful debugging information in _TDA_Kde()?
#   3. How does R mangle (see Rcppexports.cpp) the functions in the src code?
#   4. How does ~/.R/Makevars control compilation flags.  
#  
#
#
# How to Run :
#source(functions.R)


###############################################################################
#' The main function that calls add()
#'
#' @param A : first  number to add
#' @param B : second number to add
#' @keywords add
#' @export
#' @examples
#' main()
###############################################################################
main<-function(A=0, B=0)
{
    result=add(A,B)
    return(result)
}
### Called via RScript ###
#if(sys.nframe() == 0L){
#    args = commandArgs(trailingOnly=TRUE)
#    ### Catch incorrect program usage ###
#    print(args)
#    A = args[1]
#    B = args[2]
#    result = main(A,B)
#
#
#### Interactive ###
#}else{
#    if(!exists("A")){
#        exit_with_error("ERROR!!! A DNE\n")
#    }
#    if(!exists("B")){
#        exit_with_error("ERROR!!! B DNE\n")
#    }
#    result = main(A,B)
#}
