#' @title Access onebenthic M-test tool data from API 6
#'
#' @param survey_name The desired survey name
#'
#' @return The requested output from onebenthic API 6 as \code{\link{str}}
#'
#' @import dplyr httr jsonlite
#' @importFrom utils str
#'
#' @export
#'
#' @examples
#' ob_mtest_data(survey_name = 'Eastern English Channel Regional Seabed Monitoring Programme 2020')
#'
ob_mtest_data <- function(survey_name) {
  data = GET("https://rconnect.cefas.co.uk/onebenthic_api_6/API-6?",
             query = list(in_surveyname = survey_name))
  mtest_data <- content(data, "text")%>%fromJSON
  str(mtest_data)
}
