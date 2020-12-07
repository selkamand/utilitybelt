#' Test Assertion with Invisible Return
#' Wraps around asserthat::assert_that() but makes return value invisible (can be assigned but will not print when not assigned)
#' @param ... see ?assertthat::assert_that
#' @param env see ?assertthat::assert_that
#' @param msg see ?assertthat::assert_that
#'
#' @return (invisible) TRUE if expression is TRUE. Will error if is FALSE
#' @export
#'
assert_that <- function(..., env = parent.frame(), msg = NULL){
  return(invisible(assertthat::assert_that(..., env=env, msg=msg)))
}
