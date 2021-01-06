

#' Save R object to file
#' 
#' Function wraps around base::saveRDS, adding only an explicit 'force_overwrite' argument
#'
#' @inheritParams base::readRDS
#' @param force_overwrite overwrite file if it already exists (logical)
#'
#' @inherit base::readRDS return
#' @export 
save_RDS <- function(object, file, force_overwrite=FALSE, ascii = FALSE, version = NULL, compress = TRUE, refhook=NULL){
  assertthat::assert_that(is.logical(force_overwrite), msg = fmterror("saveRDS: force_overwrite argument MUST be logical"))
  assertthat::assert_that(!file.exists(file) | isTRUE(force_overwrite), msg = fmterror("saveRDS: The file: [", file ,"] already exists. To overwrite, use the 'force_overwrite' option"))
  #browser()
  saveRDS(object = object, file = file, ascii = ascii, version = version, compress = compress, refhook = refhook)
}
