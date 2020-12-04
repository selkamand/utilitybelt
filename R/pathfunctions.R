#' Get source directory (ONLY WORKS IF FILE IS SOURCED!)
#' 
#' WARNING: if you run in interactive mode, this function will print an informative error 
#'
#' @param warn  warn the user that running interactively will error? (lgl)
#'
#' @return path to the directory containing the script from which the function is called. If run interactively, will throw an error (string)
#' @export
#'
getpathSourceDirectory <- function(warn=FALSE){
  if(warn)
    message("BE WARY... this function returns the script name ONLY if the script is being sourced. If not, then it will return NULL")
  
  path=funr::get_script_path()
  assertthat::assert_that(!is.null(path), msg = "Failed to succesfully get source path. This will happen when getpathSourceDirectory is run interactively, rather than being sourced")
  return(path)
}


# -------------------------------------------------------------------------


#' Was this file sourced or run interactively?
#'
#' @return TRUE if script from which file was called was sourced, FALSE if run interactively (e.g. line by line in rstudio) (logical)
#' @export
#'
#' @examples
#' thisFileWasSourced()
thisFileWasSourced <- function(){
  if(is.null(funr::get_script_path())) 
    return(FALSE)
  else
    return(TRUE)
}


# -------------------------------------------------------------------------


#' getpathProjectRootDirectory
#'
#' @param warn Warn user to run checkScriptsDeclareTheirLocation(<project_directory>) to ensure its set up to accurately identify a projects 'home'  (logical)
#'
#' @return absolute path of the project directory rootfolder
#' @export
#'
#' @examples
#' getpathProjectRootDirectory(warn=FALSE)
getpathProjectRootDirectory <- function(warn=TRUE){
  if(warn){
   message("I would reccomend adding (here::i_am(<filepathrelativetoprojectroot>) to the top of your file)")
  }
  return(here::here())
    
}


# -------------------------------------------------------------------------


#' Finding Project Path, Check Directory Is Setup Correctly
#' 
#' Before running \strong{getpathProjectRootDirectory()}, run \strong{checkScriptsDeclareTheirLocation(<project_dir>)} interactively.
#' This function searches <project_dir> recursively for R scripts and checks if the line 'here::i_am(<path_from_project_root>)' is present in ALL of them. 
#' If not, a warning is output, recommending you add it line.
#' If all scripts declare their location relative to project root as above, \strong{getpathProjectRootDirectory()} is less likely to make a mistake. 
#'
#' @param project_home_path path to project home (string) 
#'
#' @return TRUE if project is ready for getpathProjectRootDirectory(), FALSE if some scripts need the line 'here::i_am(<path_from_project_root>)' to be added. 
#' @export
#'
#' @examples
#' checkScriptsDeclareTheirLocation(
#'   system.file(
#'     "filesfortesting/here_positive_control", 
#'     package="utilitybelt"
#'   )
#' )
checkScriptsDeclareTheirLocation <- function(project_home_path){
  assertthat::assert_that(assertthat::is.string(project_home_path), msg = fmterror("project_home_path should be a string, not a ", class(project_home_path)))
  assertthat::assert_that(file.exists(project_home_path), msg = fmterror("Cannot find project directory: ", project_home_path))
  full_file_list.v <- dir(project_home_path, full.names = TRUE, recursive = TRUE)
  rscripts <- full_file_list.v[grep(pattern = "\\.R$",full_file_list.v)]
  #print(rscripts)
  scripts_is_here_present <- sapply(rscripts, function(script) script %>% readLines() %>% grepl(pattern = "here::i_am\\(") %>% any())
  scripts_all_have_here <- all(scripts_is_here_present)
  
  if(!scripts_all_have_here) {
    scripts_without_here <- names(scripts_is_here_present)[scripts_is_here_present==FALSE]
    message("'here::i_am(<project_relative_path>)' needs to be added to the following scripts if here() is to reliably identify the project home directory: \n", paste0(scripts_without_here, collapse = "\n"), "")
  }
  return(scripts_all_have_here)
}


# -------------------------------------------------------------------------


# Takes a filename and removes extensions (file.vep.tsv to file.vep and file.vep.vcf.gz to file.vep AND/OR  extracts basename (i.e. dir1/dir2/file.tsv to file)
#' Process filenames/paths
#'
#' @param path a filename/filepath (string)
#' @param extract_basename extract basename (logical)
#' @param remove_extension remove extension (logical)
#' @param verbose (logical)
#'
#' @return processed path (string)
#' @export
#'
#' @examples
#' path_process("Dir1/Dir2/Dir3/file.tsv", extract_basename=TRUE, remove_extension=TRUE)
path_process <- function(path, extract_basename, remove_extension, verbose=FALSE) {
  assertthat::assert_that(assertthat::is.string(path))
  assertthat::assert_that(is.logical(extract_basename))
  assertthat::assert_that(is.logical(remove_extension))
  assertthat::assert_that(any(extract_basename, remove_extension), msg = "No point running function if you neither wish to extract basename OR remove the extension")
  
  processed_path <- path
  if (extract_basename)
    processed_path <- base::basename(processed_path)
  if(remove_extension & grepl(pattern = "\\.gz$", processed_path) == TRUE) #Should handle vcf.gz and bed.gz etc as expected (removes both)
    processed_path <- tools::file_path_sans_ext(processed_path)
  if(remove_extension)
    processed_path <- tools::file_path_sans_ext(processed_path)
  
  return(processed_path)
}




