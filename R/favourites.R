#' Favorites
#'
#' List favorite Colours
#'
#' @return favorite colors (character vector)
#' @export
#'
#' @examples
#' fav_colours()
fav_colours <- function(){
 fav_colours <- c(
   "steelblue" = "steelblue"
   ) 
  
  return(fav_colours)
}

#' Favorites
#'
#' List favorite themes
#'
#' @return favorite colors (character vector)
#' @export
#'
#' @examples
#' fav_themes()
fav_themes <- function(){
  fav_themes <- c(
    "barplots" = "ggthemes::fivethirtyeight"
    )
  
  return(fav_themes)
}

#' Favorites
#'
#' List favorite fav_shiny_renderDataTable_options
#'
#' @return Example command using favorite renderDataTable options (string)
#' @export
#'
#' @examples
#' fav_shiny_renderDataTable_options()
fav_shiny_renderDataTable_options <- function(){
  command = "DT::renderDataTable({mtcars}, list(scrollX = TRUE), class = 'display nowrap')"
  return(command)
}