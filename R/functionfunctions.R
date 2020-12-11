#Functions that act on other functions

#' How Many Arguments?
#'
#' Check how many arguments a function takes. 
#' 
#' Can be called from inside or outside the function, however if calling from inside a function, the function must be named.
#'
#' @param FUN a function whose arguments we're going to count (function)
#'
#' @return the number of arguments the function takes (numeric)
#' @export
#'
#' @examples
#' # Calling from outside a named function
#' fun = function(a, b, c) { return(a+b-c) }
#' fun_count_arguments(fun) ##Returns 3
#' 
#' # Calling from outside an anonymous
#' fun_count_arguments(function(a, b, c) { return(a+b+c) }) ##Returns 3
#' 
#' # Calling from inside a named function
#' my_function <- function(a, b, c, d, e, f, g) { return(fun_count_arguments(my_function)) }
#' my_function() # Equals 7
fun_count_arguments <- function(FUN){
  assert_that(is.function(FUN), msg = fmterror("fun_count_arguments: FUN must be a function, not a: ", class(FUN)))
  number_of_arguments = length(formals(FUN))
  return(number_of_arguments)
}
