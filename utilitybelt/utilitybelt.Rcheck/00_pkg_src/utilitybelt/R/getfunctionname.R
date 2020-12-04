getpathSourceDirectory <- function(warn=TRUE){
  if(warn)
    message("BE WARY... this function returns the script name ONLY if the script is being sourced. If not, then it will return NULL")
  return(funr::get_script_path())
}



getpathProjectRootDirectory <- function(warn=TRUE){
  if(warn){
   message("I would reccomend running: 'checkScriptsDeclareTheirLocation(<project_directory>)' in an interactive session to check if scripts are set up such that here::here() can reliably identified the project root") 
  }
  here::here()
}


checkScriptsDeclareTheirLocation <- function(absolute_project_home){
  assertthat::assert_that(assertthat::is.string(absolute_project_home), msg = fmterror("absolute_project_home should be a string, not a ", class(absolute_project_home)))
  assertthat::assert_that(file.exists(absolute_project_home), msg = fmterror("Cannot find project directory: ", absolute_project_home))
  full_file_list.v <- dir(absolute_project_home, full.names = TRUE, recursive = TRUE)
  rscripts <- full_file_list.v[grep(pattern = "\\.R$",full_file_list.v)]
  #print(rscripts)
  scripts_is_here_present <- sapply(rscripts, function(script) script %>% readLines() %>% grepl(pattern = "here::i_am", x = .) %>% any())
  scripts_all_have_here <- all(scripts_is_here_present)
  
  if(!scripts_all_have_here) {
    scripts_without_here <- names(scripts_is_here_present)[scripts_is_here_present==FALSE]
    message("'here::i_am(<project_relative_path>)' needs to be added to the following scripts if here() is to reliably identify the project home directory: \n", paste0(scripts_without_here, collapse = "\n"), "")
  }
  return(scripts_all_have_here)
}
checkScriptsDeclareTheirLocation("/Users/selkamand/tools/noncoding_constraint")
