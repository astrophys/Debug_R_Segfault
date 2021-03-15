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
3. `document()`                             # Generates man and NAMESPACE
4. `setwd("..")`; `install("debug.Compiled.R.Packages")`
    a) Evidently, MUST have all code wrapped within functions. The files get sourced.
5. `usethis::use_rcpp()` 
    a) Creates src
    b) Adds Rcpp to LinkingTo and Imports in DESCRIPTION
    c) Creates src/.gitignore so that compiled code doesn't accidently get
       committed to git repo
6. `devtools::load_all()` per ref 4 this is dangerous

On Compiling :
1. Note that `package/src/Makevars` takes precedence over `~/.R/Makevars`. This is
   largely why I'm having difficulty debugging R-TDA
2. R magically compiles code into shared library


## References :
1. [Not So Standard Deviations by Hillary Parker](https://hilaryparker.com/about-hilary-parker/)
2. [Fong Chun Chan's Blog](https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html)
3. [Compiled Code - R-pkgs.org](https://r-pkgs.org/src.html)
4. [Understanding Makevars - Stackoverflow](https://stackoverflow.com/a/43599233/4021436)
5. [Rcpp Vignettes](https://cran.r-project.org/web/packages/Rcpp/vignettes/Rcpp-package.pdf)
6. [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html)
