url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
path <- file.path(tempdir(), "temp.Rdata")
curl::curl_download(url, path)
#reading the data
rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
load(rData)  




# Function 1: Retrieving Bibliographic Data

#' epibibr_data
#'
#' @description This function allows you to find and display medical bibliographic data according to the selected parameters.
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
#' EpiBib_data <- epibibr_data()


epibibr_data <- function(author = "", year = "", country = "", title = "", source = "", abstract = "") {
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData)
  EpiBib_data
  
  EpiBib_data[, 1:ncol(EpiBib_data)][is.na(EpiBib_data[, 1:ncol(EpiBib_data)])] <- "MISSING999"
  
  EpiBib_grep <- with(EpiBib_data, EpiBib_data[grepl(author, AU, ignore.case = TRUE) &
                                                 grepl(year, PY, ignore.case = TRUE) &
                                                 grepl(country, AU_CO, ignore.case = TRUE) &
                                                 grepl(source, SO, ignore.case = TRUE) & 
                                                 grepl(abstract, AB, ignore.case = TRUE), ])
  
  EpiBib_grep[ EpiBib_grep == "MISSING999" ] <- NA 
}

#' epibibr_visual
#'
#' @description This function allows you to create visuals from the preset options :
#'  line chart on number of articles, bar chart on most productive authors or bar chart on most productive countries. 
#'
#' @param chart Type of charts
#' @param title Chart title, if TRUE will appear
#'
#' @return Graph chosen
#' 
#' @export
#' 
#' @import ggplot2
#' @import ggsci
#' @import dplyr
#'
#' 
#' 
#' @examples
#' epibibr_visual(chart = "line_1", title = TRUE){

epibibr_visual <- function(chart = "line_1", title = TRUE){
  PY <- ..count.. <- AU <- AU_CO <- NULL
  
  url <- paste0("https://warin.ca/datalake/epiBib/EpiBib.Rdata")
  path <- file.path(tempdir(), "temp.Rdata")
  curl::curl_download(url, path)
  #reading the data
  rData <- file.path(paste0(tempdir(), "/temp.Rdata"))
  load(rData) 
  
  if(chart == "line_1"){
    EpiBib_data$PY <- as.numeric(EpiBib_data$PY)
    if(title == TRUE){
      ggplot(data = EpiBib_data, aes(x = PY)) +
        geom_line(aes(fill=..count..), stat="bin", bins = 30, size = 0.8, color = "olivedrab") + 
        geom_point(aes(fill=..count..), stat="bin", bins = 30, size = 2.5, color = "olivedrab") + 
        ggtitle("Count of Articles") +
        xlab("") + ylab("Articles") + 
        theme_minimal() + 
        theme(legend.position = "none")
    } else {
      ggplot(data = EpiBib_data, aes(x = PY)) +
        geom_line(aes(fill=..count..), stat="bin", bins = 30, size = 0.8, color = "olivedrab") + 
        geom_point(aes(fill=..count..), stat="bin", bins = 30, size = 2.5, color = "olivedrab") + 
        ggtitle("") +
        xlab("") + ylab("Articles") + 
        theme_minimal() + 
        theme(legend.position = "none")
    }
  } else if(chart == "bar_1"){
    EpiBib_AU <- dplyr::count(EpiBib_data, AU)
    EpiBib_AU <- dplyr::arrange(EpiBib_AU, desc(n))
    EpiBib_AU$AU <- factor(EpiBib_AU$AU, levels = unique(EpiBib_AU$AU)[order(EpiBib_AU$n)])
    if(title == TRUE){
      ggplot(data = EpiBib_AU[2:10,], aes(x = n, y = AU, n, fill = AU)) +
        geom_col() + 
        xlab("Articles") + ylab("Authors") + 
        ggtitle("Most Productive Authors") +
        scale_fill_uchicago() +
        theme_minimal() + 
        theme(legend.position = "none")
    } else {
      ggplot(data = EpiBib_AU[2:10,], aes(x = n, y = AU, n, fill = AU)) +
        geom_col() + 
        xlab("Articles") + ylab("Authors") + 
        ggtitle("") +
        scale_fill_uchicago() +
        theme_minimal() + 
        theme(legend.position = "none")
    }
  } else if(chart == "bar_2"){
    EpiBib_AUCO <- dplyr::count(EpiBib_data, AU_CO)
    EpiBib_AUCO <- dplyr::arrange(EpiBib_AUCO, desc(n))
    EpiBib_AUCO$AU_CO <- factor(EpiBib_AUCO$AU_CO, levels = unique(EpiBib_AUCO$AU_CO)[order(EpiBib_AUCO$n)])
    if(title == TRUE){
      ggplot(data = EpiBib_AUCO[1:9,], aes(x = n, y = AU_CO, fill = AU_CO)) +
        geom_col() + 
        xlab("Aarticles") + ylab("Countries") + 
        ggtitle("Most productive countries") +
        scale_fill_uchicago() +
        theme_minimal() + 
        theme(legend.position = "none")
    } else {
      ggplot(data = EpiBib_AUCO[1:9,], aes(x = n, y = AU_CO, fill = AU_CO)) +
        geom_col() + 
        xlab("Aarticles") + ylab("Countries") + 
        ggtitle("") +
        scale_fill_uchicago() +
        theme_minimal() + 
        theme(legend.position = "none")
    }
  } else {
    stop("invalid arguments")
  }
}