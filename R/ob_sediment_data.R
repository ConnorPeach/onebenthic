#' @title Access onebenthic sediment data from API 3
#'
#' @param year The desired survey year
#'
#' @return The requested output from onebenthic API 3 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_sediment_data(year = 2000)
#'
ob_sediment_data <- function(year) {
  stopifnot("Input must be numeric" = is.numeric(year))
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_3/API-3?",
             query = list(in_year = year))
  sediment_data <- content(data, "text")%>%fromJSON
  glimpse(sediment_data)
}
