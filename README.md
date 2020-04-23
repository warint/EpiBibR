
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EpiBibR

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/warint/EpiBibR.svg?branch=master)](https://travis-ci.com/warint/EpiBibR)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/warint/EpiBibR?branch=master&svg=true)](https://ci.appveyor.com/project/warint/EpiBibR)
<!-- badges: end -->

EpiBibR is an R package to easily access bibliographic data on Covid-19
and other medical references. In this global crisis, knowledge and open
data can have an impact. In this regard, our team thought it could be
significant to make available more than 28 000 references (journal
articles,letter,news) through R.

The references were collected via
[PubMed](https://www.ncbi.nlm.nih.gov/pubmed/), a free resource that is
developed and maintained by the National Center for Biotechnology
Information (NCBI), at the U.S. National Library of Medicine (NLM),
located at the National Institutes of Health (NIH). PubMed includes over
30 million citations from biomedical literature.

More specifically, to retrieve our references, we adopted the procedure
used by the Allen Institute for AI for their
[CORD-19](https://pages.semanticscholar.org/coronavirus-research)
project. We apply the same query on PubMed (“COVID-19” OR Coronavirus OR
“Corona virus” OR “2019-nCoV” OR “SARS-CoV” OR “MERS-CoV” OR “Severe
Acute Respiratory Syndrome” OR “Middle East Respiratory Syndrome” ) to
build our own bibliographic data.

To navigate through our bibliographic data, EpiBibR has numerous search
arguments: author, author’s country of origin, keyword in the title,
keyword in the abstract, year and the name of the journal. Each of them
can truly help scientists and R users to filter references and find the
relevant articles.

In an effort to rally our package with the open source community, the
format of our dataframe has been designed to facilitate the use of the R
package [Bibliometrix](https://bibliometrix.org/) on our data.

# Practical usage

## Quick start

First, install EpiBibR:

``` r
devtools::install_github("warint/EpiBibR")
```

Next, call EpiBibR to make sure everything is installed correctly.

``` r
library(EpiBibR)
```

## Data Summary

| Field Tag | Description                         |
| --------- | ----------------------------------- |
| AU        | Authors                             |
| TI        | Document Title                      |
| AB        | Abstract                            |
| PY        | Year                                |
| DT        | Document Type                       |
| MESH      | Medical Subject Headings Vocabulary |
| TC        | Times Cited                         |
| SO        | Publication Name (or Source)        |
| J9        | Source Abbreviation                 |
| JI        | ISO Source Abbreviation             |
| DI        | Digital Object Identifier (DOI)     |
| ISSN      | Source Code                         |
| VOL       | Volume                              |
| ISSUE     | Issue Number                        |
| LT        | Language                            |
| C1        | Author Address                      |
| RP        | Reprint Address                     |
| ID        | PubMed ID                           |
| DE        | Authors’ Keywords                   |
| UT        | Unique Article Identifier           |
| AU\_CO    | Author’s Country of Origin          |
| DB        | Bibliographic Database              |

## How-To

EpiBibR allows you to search bibligraphic references using several
arguments : Author, author’s country of origin, author + year, keywords
in the title, keywords in the abstract, year and source name.

### Retrieve bibliographic data

To get the entire bibliographic dataframe contaning around 28 000
references, use the `EpiBib_reference` function

``` r
EpiBib_data <- EpiBib_references()
```

### Search by author

It can be truly helpful to search references by the name of the author.
For example, we will search all the articles writtin by Philippe Colson.

``` r
colson_articles <- EpiBib_author("Colson")
```

### Search by author’s country of origin.

``` r
canada_articles <- EpiBib_country("canada")
```

### Search by author and year

``` r
yang2019 <- EpiBib_AU_YE(author = "yang", year = 2019)
```

### Search by keywords in title

``` r
covid_articles <- EpiBib_title("covid")
```

### Search by keywords in the abstract

``` r
coronavirus_articles <- EpiBib_abstract("coronavirus")
```

### Search by year

``` r
A2020_articles <- EpiBib_year(2020)
```

### Search by source

``` r
bio_articles <- EpiBib_source("bio")
```

# What to do after using EpiBibR

## Read the Article

Many are available on [Stat](https://www.statnews.com/tag/coronavirus/)
or you can read articles through
[PubMed](https://www.ncbi.nlm.nih.gov/pubmed)

## Bibliometric Analysis

Bibliometrix package allows an easy bibliometric analysis on R. Our
EpiBib data have been designed to make it easier to use. A shinyapp is
also available `biblioshiny()`

Here are some examples:

``` r
# Bibliographic plot summary
MM<-EpiBib_references()
```

``` r
plot(x = results, k = 10, pause = FALSE)
```

``` r
ggplot(p1, aes(Year, value, fill = variable, colour=variable)) +
  geom_point(aes(fill = variable, colour=variable), size =1,show.legend = FALSE) +
  geom_line(aes(fill = variable, colour=variable), size= 1)+
  theme(legend.position = "none")+
  ggtitle("Author's Keywords Usage Evolution Over Time")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_color_uchicago()+
  scale_fill_uchicago()+
  theme_hc()
```

<img src="man/figures/README-unnamed-chunk-17-1.png" width="100%" />

## Copyrights

Information that is created by or for the US government on this site is
within the public domain. Public domain information on the National
Library of Medicine (NLM) Web pages may be freely distributed and
copied. However, it is requested that in any subsequent use of this
work, NLM be given appropriate acknowledgment.

NOTE: This site contains resources which incorporate material
contributed or licensed by individuals, companies, or organizations that
may be protected by U.S. and foreign copyright laws. These include, but
are not limited to PubMed Central (PMC) (see PMC Copyright Notice),
Bookshelf (see Bookshelf Copyright Notice), OMIM (see OMIM Copyright
Status), and PubChem. All persons reproducing, redistributing, or making
commercial use of this information are expected to adhere to the terms
and conditions asserted by the copyright holder. Transmission or
reproduction of protected items beyond that allowed by fair use (PDF) as
defined in the copyright laws requires the written permission of the
copyright owners."
<https://www.ncbi.nlm.nih.gov/home/about/policies/#copyright>
