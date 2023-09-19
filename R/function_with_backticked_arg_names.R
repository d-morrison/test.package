#' A function with argument names defined using backticks
#'
#' More information about this function.
#'
#' @param `arg 1` a number
#' @param `arg 2` a string
#'
#' @return the string `"goodbye"`
#' @export
#'
#' @examples
#' function_with_backticked_arg_names()
function_with_backticked_arg_names = function(
    `arg 1` = 1,
    `arg 2` = "apple")
{
  print(`arg 1`)
  print(`arg 2`)
  return('goodbye')
}
