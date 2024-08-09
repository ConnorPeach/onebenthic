#' @title Access onebenthic non-native species data from API 7
#'
#' @param year The desired survey year
#'
#' @return The requested output from onebenthic API 7 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_nonnative_data(year = 2014)
#'
ob_nonnative_data <- function(year) {
  stopifnot("Input must be numeric" = is.numeric(year))
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_7/API-7?",
             query = list(in_year = year))
  nonnative_data <- content(data, "text")%>%fromJSON
  str(nonnative_data)
}
