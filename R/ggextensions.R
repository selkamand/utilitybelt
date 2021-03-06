
# themes ------------------------------------------------------------------


#' Custom Themes
#' @param dist_from_plot_xlab distance between x axis title and plot (number)
#' @param dist_from_plot_ylab distance between y axis title and plot (number)
#' @param dist_from_plot_ggtitle distance between y axis title and plot (number)
#' @return ggtheme
#' @export
theme_axis_titles <- function(dist_from_plot_xlab = 10, dist_from_plot_ylab=10, dist_from_plot_ggtitle = 10){
  .Deprecated(new = "theme_common_adjustments")
  
  ggplot2::theme(
    plot.title = ggplot2::element_text(hjust=0.5, size = 18, face = "bold", margin = ggplot2::margin(b = dist_from_plot_ggtitle)),
    axis.title = ggplot2::element_text(face="bold"), 
    axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t=dist_from_plot_xlab)),
    axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r=dist_from_plot_ylab))
  )
}

#' Custom Themes 
#' 
#' ggplot theme that fixes a bunch of issues I tend to have with plots
#'
#' @param dist_from_plot_xlab distance between x axis title and plot (number)
#' @param dist_from_plot_ylab distance between y axis title and plot (number)
#' @param dist_from_plot_ggtitle distance between y axis title and plot (number)
#' @param subtitle_face Font face ("plain", "italic", "bold", "bold.italic")
#' @param no_background set all backgrounds to clear? (flag)
#'
#' @return ggtheme
#' @export
#' @examples 
#' mtcars %>% 
#'   ggplot2::ggplot(ggplot2::aes(cyl>6, mpg)) + 
#'   ggplot2::geom_point() + 
#'   theme_common_adjustments()
theme_common_adjustments <- function(dist_from_plot_xlab = 10, dist_from_plot_ylab=10, dist_from_plot_ggtitle = 10, no_background=FALSE, subtitle_face="plain"){
  custom_theme <- ggplot2::theme(
    plot.title = ggplot2::element_text(hjust=0.5, size = 18, face = "bold", margin = ggplot2::margin(b = dist_from_plot_ggtitle)),
    plot.subtitle = ggplot2::element_text(hjust = 0.5, face = subtitle_face),
    axis.title = ggplot2::element_text(face="bold"), 
    axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t=dist_from_plot_xlab)),
    axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r=dist_from_plot_ylab))
  )
  
  
  if(no_background){
    custom_theme <- custom_theme + ggplot2::theme(panel.background = ggplot2::element_blank(), plot.background = ggplot2::element_blank())
  }
  
  return(custom_theme)
}




#' Add crossbar to ggplot
#'
#' Adds a crossbar to a ggplot. 
#' Best used when comparing one categorical and one numeric variable using geom_point / geom_jitter(height=0).
#'
#' @param summaryfunction a function run on the y aesthetic to determine where line is drawn. 
#' Options include median, mean, max, min, or any other function that summarises a numeric vector into a single number (function)
#' @param width width of crossbar
#' @param size,colour ggplot aesthetics
#'
#' @return ggplot geom
#' @export
#'
#' @examples 
#' mtcars %>% 
#'   ggplot2::ggplot(ggplot2::aes(cyl>6, mpg)) + 
#'   ggplot2::geom_point() + 
#'   utilitybelt::geom_crossbar_predefined()
geom_crossbar_predefined <- function(summaryfunction=stats::median, width=0.4, size=0.3, colour){
  assertthat::assert_that(is.function(summaryfunction), msg = "summaryfunction must be a function (e.g. mean)")
  ggplot2::stat_summary(fun = summaryfunction, fun.min = summaryfunction, fun.max = summaryfunction,
               geom = "crossbar", width = width, size=size)
}

#' geom barplot counts
#' 
#' Add text labels indicating counts above barplot columns. 
#' Works on plots that have a geom_bar() layer.
#' Works even if you flip axis with coord_flip().
#' 
#' @param distance_from_bar distance between text and cbar 
#' @param size size of text (number)
#' @param alpha transparancy (number)
#' @param color colour (string)
#' @param family font family (string)
#' @param fontface Font face ("plain", "italic", "bold", "bold.italic") (string) 
#'
#' @return ggplot geom 
#' @export
#'
#' @examples
#' mtcars %>%
#' ggplot2::ggplot(ggplot2::aes(x=as.character(cyl))) +
#' ggplot2::geom_bar() +
#' ggplot2::xlab("cylinders") + 
#' geom_barplot_counts() 
geom_barplot_counts <- function(distance_from_bar=1.5, size = 4, fontface="bold", alpha = 0.8, color = "black", family="Helvetica"){
  ..count..=NULL
  
  ggplot2::geom_text(
    stat='count', ggplot2::aes(label=..count..), 
    nudge_y = distance_from_bar, 
    size = size,
    fontface=fontface, 
    alpha = alpha, 
    color=color,
    family=family
  )
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




#' Custom Themes
#'
#' @return ggtheme
#' @export
#'
theme_no_legend <- function(){
    ggplot2::theme(legend.position = "none")
}

#' Custom Themes
#'
#' @return ggtheme
#' @export
theme_no_legend_title <- function(){
  ggplot2::theme(legend.title = ggplot2::element_blank())
}