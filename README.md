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
If you've cloned this repo:
1. `library(devtools); library(roxygen2)`
2. `document()`


To create a raw package (NOT what you'll do if you've cloned this repo): 
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


On Namespace :
1. Can selectively export functions to users, hold back other functions for
   internal use.
2. `search()` provides a list of search paths.
3. `library()` loads the package into memory and then adds it to search path.


Beginning new project : 
### from Hilary Parker
1. `library("devtools"); library("roxygen2")`
2. `create("new.package")`    # from Rstudio, it creates new.package and new.package/R,
    DESCRIPTION, creates new.package.Rproj (necessary for hot-keys to work,
    e.g. cmd/ctl shift B)
3. Add .R file to new.package/R/
4. `document()`
5. `setwd("..")`
6. `install("new.package")`
### from https://r-pkgs.org/src.html
5. `usethis::use_rcpp()`
    a) Create a src/ directory to hold your .cpp files. 
        #. Created code.cpp
    b) Add Rcpp to the LinkingTo and Imports fields in the DESCRIPTION.
    c) Set up a .gitignore file 
    d) Tell you the two roxygen tags you need to add to your package:
        #. To R/new.package-package.R added 
            ## usethis namespace: start
            #' @importFrom Rcpp sourceCpp
            ## usethis namespace: end
            NULL
6. `cmd/ctl shift D` effectively runs :
    a) Rcpp::compileAttributes() 
        #. Updates RcppExports.cpp and RcppExports.R
    b) devtools::document(roclets = c('rd', 'collate', 'namespace'))
    c) These actions 
        #. Compiled the object files and shared lib.
        #. Added `importFrom(Rcpp,sourceCpp)`
7. `cmd/ctl shift B` effectively runs :
    a) `Rcpp::compileAttributes()`
    #) `R CMD INSTALL --no-multiarch --with-keep.source new.package`
8. Running `timesTwo()` fails here (step 4). Why?
9. I closed the project here. The `cmd/ctl` functions don't work when I reopen RStudio (even
   in the working directory)
    a) Evidently, I need to reopen the *.Rproj file to get it to work
9. To src/code.cpp, added 
    //' Multiply a number by two
    //' 
    //' @param x A single integer.
    //' @export 
10. Rerunning `cmd/ctl shift D` and `cmd/ctl shift B` still doesn't work in getting
    timesTwo() to work
11. This ends my attempt at using stupid RStudio.

Beginning new project (using [Rcpp Vignette] : 
0. library("Rcpp")
1. Rcpp.package.skeleton("test.rcpp.package")
2. Editting src/rcpp_hello_world.cpp with an add() function
3. library("roxygen2"); library("devtools"); install("test.rcpp.package")



## References :
1. [Not So Standard Deviations by Hillary Parker](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
2. [Fong Chun Chan's Blog](https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html)
3. [Compiled Code - R-pkgs.org](https://r-pkgs.org/src.html)
4. [Understanding Makevars - Stackoverflow](https://stackoverflow.com/a/43599233/4021436)
5. [Rcpp Vignettes](https://cran.r-project.org/web/packages/Rcpp/vignettes/Rcpp-package.pdf)
6. [Writing R Extensions](https://cran.r-project.org/doc/manuals/R-exts.html)

