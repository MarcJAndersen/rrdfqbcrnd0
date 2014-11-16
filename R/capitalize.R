##' @title Capitalize string for use in rdfs definitions (not good version)
##' @param s
##' @param strict
##' @return s capitalized

capitalize <- function(s, strict = FALSE) {
# suggested R online help /library/base/html/chartr.html
    cap <- function(s) paste(toupper(substring(s, 1, 1)),
                  {s <- substring(s, 2); if(strict) tolower(s) else s},
                             sep = "", collapse = " " )
    sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}
