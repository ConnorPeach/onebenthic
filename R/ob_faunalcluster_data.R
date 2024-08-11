#' @title Access onebenthic faunal cluster ID tool data from API 5
#'
#' @param survey_name The desired survey name
#'
#' @return The requested output from onebenthic API 5 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_faunalcluster_data(survey_name = 'South Coast Regional Seabed Monitoring Programme 2022')
#'
ob_faunalcluster_data <- function(survey_name) {
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_5/API-5?",
             query = list(in_Survey_name = survey_name))
  faunalcluster_data <- content(data, "text")%>%fromJSON
  glimpse(faunalcluster_data)
}
