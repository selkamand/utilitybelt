
# 
#' Create directory
#' Take a path and create a new directory, with informative messages if it already exists.
#' @param dir_path path of new directory (string)
#' @param force_overwrite overwrite directory if it already exists (logical)
#' @param promt_if_directory_exists a message printed to stderr if directory already exists and force_overwrite = FALSE (string).  If writing a commandline script, for example, you might want to print "Use the -f flag to overwrite the existing directory".
#' @param verbose Print more info when running (logical)
#' @return path to successfully created directory (string). If directory cannot be created, the function will throw an error.
#' @export
dir_create <- function(dir_path, force_overwrite=FALSE, promt_if_directory_exists = NULL, verbose = TRUE) {
  assertthat::assert_that(is.logical(force_overwrite), msg = "force_overwrite argument MUST be logical")
  assertthat::assert_that(!file.exists(dir_path) | isTRUE(force_overwrite), msg = paste0("The directory: ", dir_path ," already exists. ", promt_if_directory_exists))
  assertthat::assert_that(assertthat::is.string(promt_if_directory_exists) | is.null(promt_if_directory_exists), msg = "promt_if_directory_exists must be a string or NULL")
  assertthat::assert_that(is.logical(verbose), msg = "force_overwrite argument MUST be logical")
  
  if(file.exists(dir_path)){
    if(verbose) message("Overwriting folder: ", dir_path)
    unlink(dir_path, recursive = TRUE)
    dir.create(dir_path, recursive = TRUE)
  } else
  {
    if(verbose) message("Creating directory: ", dir_path)
    dir.create(dir_path, recursive = TRUE)
  }
  return(dir_path)
}