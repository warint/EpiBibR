url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
path <- file.path(tempdir(), "temp.Rdata")
curl::curl_download(url, path)
#reading the data
rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
load(rData)  




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
  EpiBib_data
  
  EpiBib_data[, 1:ncol(EpiBib_data)][is.na(EpiBib_data[, 1:ncol(EpiBib_data)])] <- "NA"
  
  EpiBib_grep <- with(EpiBib_data, EpiBib_data[grepl(author, AU, ignore.case = TRUE) &
                                                 grepl(year, PY, ignore.case = TRUE) &
                                                 grepl(country, AU_CO, ignore.case = TRUE) &
                                                 grepl(source, SO, ignore.case = TRUE) & 
                                                 grepl(abstract, AB, ignore.case = TRUE), ])
  
}

# Function 2: Retrieving Bibliographic Data

#' deprecated-EpiBib_references
#'
#' @description this function allows you to retrieve the complete medical bibliographic dataframe.
#'
#' @return The complete bibliographic dataframe
#' @export
#' @import curl
#' 
#' @examples
#' EpiBib_data <- EpiBib_references()



EpiBib_references <- function() {
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  EpiBib_data
  
  .Deprecated(msg = "'EpiBib_references()' will be removed in the next version and replaced by the simpler function 'epibib_data()'. 'epibib_data()' is already available.")    
}



# Function 3: Authors

#' deprecated-EpiBib_author
#'
#' @description This function allows you to search references by authors.
#'
#' @param author The name of the author
#'
#'
#' @return dataframe with only the references from the selected author
#' @export
#'
#' @examples
#' df <- EpiBib_author("Yang")
#' df <- EpiBib_author("Ya")
#' df <- EpiBib_author("Yang")

EpiBib_author <- function(author) {
  
  .Deprecated(msg = "'EpiBib_author()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()'is already available.")
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  if (missing(author)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(author,  EpiBib_data$AU, ignore.case = TRUE), ]
  }
}




# Function 4: Authors'country of origin

#' deprecated-EpiBib_country
#'
#' @description This function allows you to search references by authors' country of origin.
#' Be careful. countries can be identified differently. For exemple, United Kingdom vs England.
#'
#' @param country The name of the country
#'
#' @return dataframe with only the references from the selected country.
#' @export
#'
#' @examples
#' df <- EpiBib_country("Canada")
#' df <- EpiBib_country("china")
#' df <- EpiBib_country("England")

EpiBib_country <- function(country) {
  
  .Deprecated(msg = "'EpiBib_country()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  EpiBib_data
  if (missing(country)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(country, EpiBib_data$AU_CO, ignore.case = TRUE), ]
  }
}



# Function 5: Title

#' deprecated-EpiBib_title
#'
#' @description This function allows you to search references by keywords in the title.
#'
#' @param title keyword in the title
#'
#' @return dataframe with only the references including the selected word in the title.
#' @export
#'
#' @examples
#' df <- EpiBib_title("pandemic")
#' df <- EpiBib_title("coronaVir")


EpiBib_title <- function(title) {
  
  .Deprecated(msg = "'EpiBib_title()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  EpiBib_data
  if (missing(title)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(title, EpiBib_data$TI, ignore.case = TRUE), ]
  }
}




# Function 6: Year

#' deprecated-EpiBib_year
#'
#' @description This function allows you to search references by year.
#'
#' @param year A year
#'
#' @return dataframe with only the references including the selected year.
#' @export
#'
#' @examples
#' df <- EpiBib_year("2017")


EpiBib_year <- function(year) {
  
  .Deprecated(msg = "'EpiBib_year()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData) 
  EpiBib_data
  if (missing(year)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(year, EpiBib_data$PY, ignore.case = TRUE), ]
  }
}



# Function 7: source

#' deprecated-EpiBib_source
#'
#' @description This function allows you to search references by source
#' Be careful, souces' name are only avalailable in an abbreviated form.
#'
#'
#' @param source The name of the source
#'
#' @return dataframe with only the references including the selected source
#' @export
#'
#' @examples
#' df <- EpiBib_source("med")
#' df <- EpiBib_source("bio")


EpiBib_source <- function(source) {
  
  .Deprecated(msg = "'EpiBib_source()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  EpiBib_data
  if (missing(source)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(source, EpiBib_data$SO, ignore.case = TRUE), ]
  }
}




# Function 8: Abstract

#' deprecated-EpiBib_abstract
#'
#' @description This function allows you to search references by keywords in the title.
#'
#' @param abstract keyword in the abstract
#'
#' @return dataframe with only the references including the selected word in the title.
#' @export
#'
#' @examples
#' df <- EpiBib_abstract("coronav")
#' df <- EpiBib_abstract("issue")
#'

EpiBib_abstract <- function(abstract) {
  
  .Deprecated(msg = "'EpiBib_abstract()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)  
  EpiBib_data
  if (missing(abstract)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(abstract, EpiBib_data$AB, ignore.case = TRUE), ]
  }
}

# Function 9: Author & Year

#' deprecated-EpiBib_AU_YE
#' 
#' @description This function allows you to search references by author and year.
#' 
#' @param author The name of the author
#'
#' @param year A year
#'
#' @return dataframe with only the references including the selected author and year.
#' @export
#'
#' @examples
#' df <- EpiBib_AU_YE(author = "yang", year = 2005)



EpiBib_AU_YE <- function(author = NULL, year = NULL) {
  
  .Deprecated(msg = "'EpiBib_AU_YE()' will be removed in the next version and replaced by the simpler function 'epibib_data()'.'epibib_data()' is already available.")
  
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData) 
  EpiBib_data
  if (is.null(author) & is.null(year)) {
    EpiBib_data
  } else if (is.null(author)) {
    EpiBib_data[grep(year, EpiBib_data$PY, ignore.case = TRUE), ]
  } else if (is.null(year)) {
    EpiBib_data[grep(author, EpiBib_data$AU, ignore.case = TRUE), ]
  } else {
    with(EpiBib_data, EpiBib_data[grepl(author, AU, ignore.case = TRUE) & grepl(year, PY, ignore.case = TRUE), ])
  } 
}






