#' @title Access onebenthic community data from API 1
#'
#' @param year The desired survey year
#' @param sieve_size The desired sieve size
#'
#' @return The requested output from onebenthic API 1 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_community_data(year = 2000, sieve_size = 1)
#'
ob_community_data <- function(year, sieve_size) {
  stopifnot("Input must be numeric" = is.numeric(year))
  stopifnot("Input must be numeric" = is.numeric(sieve_size))
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_1/API-1_with_filters?",
             query = list(in_year = year, in_sieve_size_mm = sieve_size))
  community_data <- content(data, "text", encoding = "UTF-8") %>% fromJSON
  glimpse(community_data)
}
