#' @title Access onebenthic MCZ macrofaunal data from API 4
#'
#' @param year The desired survey year
#'
#' @return The requested output from onebenthic API 4 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_macrofaunal_data(year = 2014)
#'
ob_macrofaunal_data <- function(year) {
  stopifnot("Input must be numeric" = is.numeric(year))
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_4/API-4?",
             query = list(in_year = year))
  macrofaunal_data <- content(data, "text")%>%fromJSON
  str(macrofaunal_data)
}
