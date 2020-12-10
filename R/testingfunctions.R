#' @title Test Assertion with Invisible Return
#' @description 
#' Wraps around asserthat::assert_that() but makes return value invisible (can be assigned but will not print when not assigned)
#' @param ... see ?assertthat::assert_that
#' @param env see ?assertthat::assert_that
#' @param msg see ?assertthat::assert_that
#' @return invisible (TRUE) if expression is TRUE. Will error if is FALSE
#' @export
#' @family customassertions
assert_that <- function(..., env = parent.frame(), msg = NULL){
  return(invisible(assertthat::assert_that(..., env=env, msg=msg)))
}


#' Check object is a non-empty string
#'
#' @param object Some value you want to assert is a non-empty string
#' @param msg Some message to print on failure (appended to the hard-coded message). Will automatically get wrapped in fmterror (string)
#' @return invisible(TRUE) if the object is a non-empty string. Throws an error if it is not.
#' @export
#' @examples
#' possiblestring = "Billy"
#' assert_non_empty_string(possiblestring)
#' 
#' @family customassertions
#' 
assert_non_empty_string <- function(object, msg=""){
  assert_that(assertthat::is.string(object), msg = fmterror("object: [", substitute(object), "] must be a string, not a", class(object), ". ", msg))
  assert_that(nchar(object) > 0, msg = fmterror("object: [", substitute(object), "] is a string but its empty. Need to have more than 0 characters", class(object), ". ", msg))
}