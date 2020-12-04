

#' Colour text
#' 
#' A collection of functions that take text and return that same text flanked by  characters 
#' that will lead to its coloration/formatting when printed to terminals using message/cat. Different presets are available:
#' fmterror, fmtwarning, fmtsuccess, fmtbold.
#' 
#' If greater control is required, use the crayon package
#'
#' @param ... (string/s) Text to colorise. Comma separated strings will be concatenated (no spaces) before colorisation.
#'
#' @return (string) Input text flanked by relevant Ansi escape codes
#' @export
#'
#' @examples 
#' message(fmtwarning("This is a warning"))
fmterror <- function(...) { return(crayon::bold(crayon::red(paste0(...))))  }
fmtwarning <- function(...) { return(crayon::bold(crayon::yellow(paste0(...))))  }
fmtsuccess <- function(...) { return(crayon::bold(crayon::green(paste0(...))))  }
fmtbold <- function(...) { return(crayon::bold(paste0(...)))  }