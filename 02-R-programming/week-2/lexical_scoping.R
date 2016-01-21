#http://wiki.math.yorku.ca/index.php/R:_Scoping_of_free_variable_names
#
#  Scoping
#

a <- "Global"
f <- function() {
  
  g <- function(x)
    cat(x,a,"\n")
  g("called in f before assn of a:")
  a <- "in f"
  g("called in f after assn of a:")
  h <- function(x) {
    a <- "defined in h"
    g(x)
  }
  h("h calling g from in f:")
  a <- "redefined in f"
  h("h calling g in f after redefining a")
  rm(a)
  h("h calling g after removing a")
}

f()
