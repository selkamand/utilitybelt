
#' Get Calling Function
#'
#' Looks through stack trace to identify the function that called the current function.
#'
#' @param n_function_calls_ago position in the stack trace we're interested in. By default will return the name of the function containing the line: get_calling_function(). Setting to 1 will get the call 1 up in the stack trace.(integer)
#' @param verbose print informative messages
#' @return the function call as a string. If function is called from the base environment or n_function_calls_ago is set higher than the number of calls in the stack trace, will return 'base' (string)
#' @export
#'
#' @examples
#' wrapper <- function(n_function_calls_ago=1, verbose=TRUE){
#'   get_calling_function(n_function_calls_ago, verbose)
#' }
#' 
#' wrapper() # Returns"wrapper()"
#' 
#' wrapper_wrapper <- function(n_function_calls_ago=1, verbose=TRUE){
#'   wrapper(n_function_calls_ago, verbose=verbose)
#' }
#' 
#' wrapper_wrapper() # Returns "wrapper(n_function_calls_ago, verbose = verbose)"
#' wrapper_wrapper(2) # Returns "wrapper_wrapper(2)"
#' wrapper_wrapper(100, verbose=FALSE) # Returns "base"
#' wrapper_wrapper(100, verbose=TRUE) # Returns "base" + message 
#' 
get_calling_function <- function(n_function_calls_ago=1, verbose = TRUE) {
  #utilitybelt::assert_that(assertthat::is.number(n_function_calls_ago), assertive::is_whole_number(n_function_calls_ago))
  assert_is_whole_number(n_function_calls_ago)
  stack_position = n_function_calls_ago*-1
  calling_function <- tryCatch(
    expr = { sys.call(stack_position) },
    error = function(err){
      if (verbose) message(fmtwarning("Not that many frames on the stack, returning 'base' as the nearest approximation"))
      return(NULL)
    })
  
  if(is.null(calling_function)) return("base")

  return(deparse(calling_function))
}
# 

