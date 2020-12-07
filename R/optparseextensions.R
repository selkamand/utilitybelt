#' @title Print Help to Stderr
#' @description Wraps around optparse's print_help function but sends help info to stderr
#' @return invisible (NULL)
#' @export
#'
print_help_stderr <- function(){
 sink(stderr())
  optparse::print_help()
  sink()
  return(invisible(NULL))
}
