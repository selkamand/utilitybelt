#' @title Create directory
#' @description Take a path and create a new directory, with informative messages if it already exists.
#' @param dir_path path of new directory (string)
#' @param force_overwrite overwrite directory if it already exists (logical)
#' @param prompt_if_directory_exists a message printed to stderr if directory already exists and force_overwrite = FALSE (string).  If writing a commandline script, for example, you might want to print "Use the -f flag to overwrite the existing directory".
#' @param verbose Print more info when running (logical)
#' @return path to successfully created directory (string). If directory cannot be created, the function will throw an error.
#' @family filesystemfunctions
#' @export
dir_create <- function(dir_path, force_overwrite=FALSE, prompt_if_directory_exists = NULL, verbose = TRUE) {
  assertthat::assert_that(is.logical(force_overwrite), msg = "force_overwrite argument MUST be logical")
  assertthat::assert_that(!file.exists(dir_path) | isTRUE(force_overwrite), msg = paste0("The directory: ", dir_path ," already exists. ", prompt_if_directory_exists))
  assertthat::assert_that(assertthat::is.string(prompt_if_directory_exists) | is.null(prompt_if_directory_exists), msg = "prompt_if_directory_exists must be a string or NULL")
  assertthat::assert_that(is.logical(verbose), msg = "verbose argument MUST be logical")

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

#' @title Create file
#' @description Take a path and create a new file, with informative messages if it already exists.
#' @param file_path path of new file (string)
#' @param force_overwrite overwrite file if it already exists (logical)
#' @param prompt_if_file_exists a message printed to stderr if file already exists and force_overwrite = FALSE  (in addition to some generic error message).  If writing a commandline script, for example, you might want to print "Use the -f flag to overwrite the existing file". (string)
#' @param verbose Print more info when running (logical)
#' @return path to successfully created file (string). If file cannot be created, the function will throw an error.
#' @family filesystemfunctions
#' @export 
file_create <- function(file_path, force_overwrite=FALSE, prompt_if_file_exists = NULL, verbose = TRUE) {
  assertthat::assert_that(is.logical(force_overwrite), msg = fmterror("file_create: force_overwrite argument MUST be logical"))
  assertthat::assert_that(!file.exists(file_path) | isTRUE(force_overwrite), msg = fmterror("file_create: The file: [", file_path ," already exists. ]", prompt_if_file_exists))
  assertthat::assert_that(assertthat::is.string(prompt_if_file_exists) | is.null(prompt_if_file_exists), msg = "file_create: prompt_if_file_exists must be a string or NULL")
  assertthat::assert_that(is.logical(verbose), msg = fmterror("file_create: verbose argument MUST be logical, not ", class(verbose)))
  
  if(file.exists(file_path)){
    if(verbose) message("Overwriting folder: ", file_path)
    unlink(file_path)
    file.create(file_path)
  } else
  {
    if(verbose) message("Creating file: ", file_path)
    file.create(file_path)
  }
  return(file_path)
}


# Do files exist ----------------------------------------------------------

#' Check files ALL exist
#'
#' @param files a vector of filenames/filepaths. Directories and Files are treated the exact same ways (character).
#'
#' @return do all files/directories in \strong{files} vector exist: TRUE/FALSE (logical)
#' @export
#'
files_exist_all <- function(files){
  assert_that(is.character(files), msg="files MUST be a character vector")
  do_all_files_exist <- files %>%
    files_exist_which() %>%
    all()
  return(do_all_files_exist)
}


#' Check which files exist
#'
#' @param files a vector of filenames/filepaths. Directories and Files are treated the exact same ways (character).
#' @return vector indicating which files/directories in \strong{files} exist: TRUE/FALSE (logical)
#' @export
#'
files_exist_which <- function(files){
  assert_that(is.character(files), msg="files MUST be a character vector")
  exists_lgl <- purrr::map_lgl(.x = files, .f = file.exists)
  names(exists_lgl) <- files
  
  return(exists_lgl)
}
