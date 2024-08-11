#' @title Access onebenthic taxon data from API 2
#'
#' @param aphiaid The desired species aphiaid
#'
#' @return The requested output from onebenthic API 2 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_taxon_data(aphiaid = 130867)
#'
ob_taxon_data <- function(aphiaid) {
  stopifnot("Input must be numeric" = is.numeric(aphiaid))
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_2/API-2?",
             query = list(in_valid_aphiaid = aphiaid))
  taxon_data <- content(data, "text", encoding = "UTF-8") %>% fromJSON
  glimpse(taxon_data)
}
