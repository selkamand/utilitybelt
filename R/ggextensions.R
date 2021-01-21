
# themes ------------------------------------------------------------------


#' Custom Themes
#'
#' @return ggtheme
#' @export
#'
theme_axis_titles <- function(){
  ggpubr::theme_cleveland() + 
  ggplot2::theme(plot.title = ggplot2::element_text(hjust=0.5, size = 18, face = "bold"),
        axis.title = ggplot2::element_text(face="bold"), 
        axis.title.y = ggplot2::element_text())
}


#' Custom Themes
#'
#' @return ggtheme
#' @export
#'
theme_axis_titles_cleveland <- function(){
  ggpubr::theme_cleveland() + 
    ggplot2::theme(plot.title = ggplot2::element_text(hjust=0.5, size = 18, face = "bold"),
          axis.title = ggplot2::element_text(face="bold"), 
          axis.title.y = ggplot2::element_text())
}