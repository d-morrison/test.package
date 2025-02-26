#' @title API function
#' @inheritDotParams middle
api <- function(...) {
  middle(...)
}

#' @title intermediate function
#' @param arg1 a parameter argument
#' @inheritDotParams core
middle <- function(arg1, ...) {
  core(...)
}

#' @title core function
#' @param arg2 another parameter argument
core <- function(arg2) {
  # do stuff
}
