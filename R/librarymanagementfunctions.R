#' @title Loads a library quietly
#' This function loads a package, optionally outputting a single line message if successful.
#' Will always print the full error message if load fails
#' @param library_name (string) Name of library to load
#' @param verbose (logical) Should we print a message if load was successful?
#'
#' @return void. This function is run for its side effect.
#' @export
#'
#' @examples "library_quietload(dplyr, verbose=TRUE)"
library_quietload <- function(library_name, verbose=FALSE){
  library_name = as.character(substitute(library_name))
  library_load_successful=suppressMessages(suppressPackageStartupMessages(suppressWarnings(require(library_name, character.only = TRUE, quietly = TRUE))))
  if(library_load_successful)
  {
    if(verbose)
      message("Succefully Loaded Library: ", library_name)
  }
  else
  {
    message(fmterror("Failed to load library: ", library_name))
    message(fmterror("----------------------- ERROR -----------------------------"))
    require(library_name, character.only = TRUE)
    assertthat::assert_that(library_load_successful)
  }
}
