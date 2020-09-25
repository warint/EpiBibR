
# Function 1: Retrieving Bibliographic Data

#' epibib_data
#'
#' @description this function allows you to to find and display medical bibliographic data according to the selected parameters.
#' If no arguments are filled, all data will be displayed.
#' 
#'
#' @param author The name of an author
#' @param year Years for which you want the data.
#' @param country Author's country of origin 
#' @param title Keyword in the title
#' @param source Name of the source
#' @param abstract Keyword in the abstract
#'
#'
#' @return Data for the author, country, year, title, source and abstract requested
#' @export
#' @import curl
#' 
#' @examples
#' EpiBib_data <- epibib_data()


epibib_data <- function(author = "", year = "", country = "", title = "", source = "", abstract = "") {
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  
  EpiBib_data[, 1:ncol(EpiBib_data)][is.na(EpiBib_data[, 1:ncol(EpiBib_data)])] <- "NA"
  
  EpiBib_grep <- with(EpiBib_data, EpiBib_data[grepl(author, AU, ignore.case = TRUE) &
                                                 grepl(year, PY, ignore.case = TRUE) &
                                                 grepl(country, AU_CO, ignore.case = TRUE) &
                                                 grepl(source, SO, ignore.case = TRUE) & 
                                                 grepl(abstract, AB, ignore.case = TRUE), ])
  
}


