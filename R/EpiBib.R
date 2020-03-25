

load("EpiBib_data.RData")

# Function 1: Retrieving Bibliographic Data

#' EpiBib_references
#'
#' @Description this function allows you to retrieve the complete medical bibliographic dataframe.
#'
#' @return The complete bibliographic dataframe
#' @export
#'
#' @examples
#' df <- EpiBib_references()



EpiBib_references <- function() {
    EpiBib_data
}



# Function 2: Authors

#' EpiBib_author
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
  if (missing(author)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(author,  EpiBib_data$AU, ignore.case = TRUE), ]
  }
}




# Function 3: Authors'country of origin

#' EpiBib_country
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
  if (missing(country)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(country, EpiBib_data$AU_CO, ignore.case = TRUE), ]
  }
}



# Function 4: Title

#' EpiBib_title
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
  if (missing(title)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(title, EpiBib_data$TI, ignore.case = TRUE), ]
  }
}




# Function 5: Year

#' EpiBib_year
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
  if (missing(year)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(year, EpiBib_data$PY, ignore.case = TRUE), ]
  }
}



# Function 6: Journal

#' EpiBib_journal
#'
#' @description This function allows you to search references by journal.
#' Be careful, journals' name are only avalailable in an abbreviated form.
#'
#'
#' @param journal The name of the journal
#'
#' @return dataframe with only the references including the selected journal.
#' @export
#'
#' @examples
#' df <- EpiBib_journal("med")
#' df <- EpiBib_journal("bio")


EpiBib_journal <- function(journal) {
  if (missing(journal)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(journal, EpiBib_data$SO, ignore.case = TRUE), ]
  }
}




# Function 7: Abstract

#' EpiBib_abstract
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
  if (missing(abstract)) {
    EpiBib_data
  } else {
    EpiBib_data[grep(abstract, EpiBib_data$AB, ignore.case = TRUE), ]
  }
}

# Function 8: Author & Year

#' TitleEpiBib_AU_YE
#' 
#'  @description This function allows you to search references by author and year.
#' 
#' @param author The name of the author
#'
#' @param year A year
#'
#' @return dataframe with only the references including the selected author and year.
#' @export
#'
#' @examples
#' df <- EpiBib_AU_YE(author = "AHMAD", year = 2020)
#' df <- EpiBib_AU_YE(author = "yang")
#' ddf <- EpiBib_AU_YE(year = 2005)


EpiBib_AU_YE <- function(author = NULL, year = NULL) {
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
