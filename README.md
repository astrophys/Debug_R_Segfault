# Debugging an R package with Compiled Code
#### Author : 
#### License: MIT 
## Purpose:
This package is my attempt to understand debugging compiled code. I'm having
difficulty debugging segmentation faults in R-TDA. Some outstanding questions :
1. How is the compiled code in R-TDA actually compiled. There isn't a Makefile or
   configure file?
2. Why can't I get useful debugging information in _TDA_Kde()?
3. How does R mangle (see Rcppexports.cpp) the functions in the src code?
4. How does ~/.R/Makevars control compilation flags.

## Installation :
Steps :
1. `install.packages("devtools")`
2. `devtools::install_github("klutometis/roxygen")`

## Running :

## Notes :
When making a package : 
1. load `devtools` and `roxygen2`
2. `create("debug.Compiled.R.Packages")`    # Create director
3. `A=66; B=42; document()`                 # First two args are so main can complete w/o error
4. `setwd("..")`; `install("debug.Compiled.R.Packages")`
    a) Evidently, MUST have all code wrapped within functions. The files get sourced.
## References :
1. [Not So Standard Deviations by Hillary Parker](https://hilaryparker.com/about-hilary-parker/)
2. [Fong Chun Chan's Blog](https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html)
