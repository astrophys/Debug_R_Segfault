# Author : Ali Snedden
# Date   : 1/8/21
# License: MIT
# Notes  :
#   
#
#
# Purpose:
#  
# 
#
#
# How to Run :






###############################################################################
# ARGS    : str : a character vector (aka a string)
# RETURN  :
# PURPOSE : Exit with error
# DEBUG   : Tested. It worked
# FUTURE  :
###############################################################################
###############################################################################
#' The function that exits with an error code and prints an error
#'
#' @param Str : String to print upon exit
#' @keywords error
#' @export
#' @examples
#' exit_with_error()
###############################################################################
exit_with_error <- function(Str){
    ## Rscript
    if(sys.nframe() == 0L){
        write(Str,stderr())
        q(save = "no", status = 1, runLast = FALSE)
    ## Interactive
    }else{
        write(Str,stderr())
        q(save = "no", status = 1, runLast = TRUE)
        #browser()
    }
}


###############################################################################
#' The function that adds two numbers
#'
#' @param A : first  number to add
#' @param B : second number to add
#' @keywords add
#' @export
#' @examples
#' add()
###############################################################################
add <- function(A, B){
    #intSum = .Call('my_cpp_add', (A, B))        # Does NOT work - Why?
    #return(my_cpp_add(A, B))        # Does NOT work - Why?
    return(A + B)                 # Works!
}
