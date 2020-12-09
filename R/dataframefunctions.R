
#' df_sum_last_column
#'
#' @param data a dataframe whose last column you want to sum (dataframe)
#'
#' @return sum of last column (numeric) 
#' @export
#'
#' @examples
#' df_sum_last_column(mtcars)
df_sum_last_column <- function(data) {
  utilitybelt::assert_that(is.data.frame(data))
  utilitybelt::assert_that(ncol(data) > 0)
  utilitybelt::assert_that(nrow(data) > 0)
  
  ncols <- ncol(data)
  lastcol.v <- data[[ncols]]
  utilitybelt::assert_that(is.numeric(lastcol.v), msg = "last column of supplied dataframe must be numeric")
  
  return(sum(lastcol.v))
}