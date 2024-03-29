
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EpiBibR

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/warint/EpiBibR.svg?branch=master)](https://travis-ci.org/warint/EpiBibR)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/warint/EpiBibR?branch=master&svg=true)](https://ci.appveyor.com/project/warint/EpiBibR)
<!-- badges: end -->

# Overview

EpiBibR is **updated daily**. It stands for “epidemiology-based bibliography for R.” The R
package is under the MIT License and as such is a free resource based on
the open science principles (reproducible research, open data, open
code). The resource may be used by researchers, whose domain is
scientometrics, but also by researchers from other disciplines. For
instance, the scientific community in Artificial Intelligence and Data
Science may use this package to accelerate new research insights about
covid-19. The package follows the methodology put in place by the Allen
Institute and its partners to create the CORD-19 dataset with some
differences. The latter is accessible through downloads of sub-sets or
through a REST API. The data provide important information such as
authors, methods, data, and citations to make it easier for researchers
to find relevant contributions to their research questions. Our package
proposes 22 features for the 180,000 references (on April 30, 2022) and
access to the data has been made as easy as possible in order to
integrate efficiently in almost any researcher’s pipeline.

Through this package, a researcher can connect the data to her analysis
based on the R language. With this workflow in mind, a researcher can
save time on collecting data, and can use a very accessible language to
perform complex analytical tasks, be it R or Python for instance.
Indeed, it is usual that researchers use multiple languages (functional
or not) to produce certain outputs. This workflow opens these data to
analyses from the largest spectrum of potential options, enhancing
multidisciplinary approaches applied to these data (biostatistics,
bibliometrics, text mining, etc.).

The goal of this package in this emergency context is to limit the
references to the medical domain, hence limiting ourselves to the Pubmed
repository, but then to leverage the methodologies used across different
disciplines. As we will address this point latter, a further extension
could be to add references from other disciplines to not only benefit
from the wealth of methodologies but also from their own theories and
concepts. For instance, to assess the spread of the disease, the
literature - and theories - from researchers in demography would
certainly be relevant.

# Functionality

The references were collected via PubMed, a free resource that is
developed and maintained by the National Center for Biotechnology
Information (NCBI), at the U.S. National Library of Medicine (NLM),
located at the National Institutes of Health (NIH). PubMed includes over
30 million citations from biomedical literature.

More specifically, to collect our references, we adopted the procedure
used by the Allen Institute for AI for their CORD-19 project. We apply a
similar query on PubMed: “COVID-19” OR Coronavirus OR “Corona virus” OR
“2019-nCoV” OR “SARS-CoV” OR “MERS-CoV” OR “Severe Acute Respiratory
Syndrome” OR “Middle East Respiratory Syndrome” to build our own
bibliographic data.

To navigate through our dataset, EpiBibR relies on a set of search
arguments: author, author’s country of affiliation, keyword in the
title, keyword in the abstract, year and the name of the journal. Each
of them can truly help scientists and R users to filter references and
find the relevant articles.

In an effort to simplify the workflow between our package and the
research methodologies, the format of our dataframe has been designed to
integrate with different data pipelines, notably to facilitate the use
of the R package Bibliometrix with our data (Aria and Cuccurullo 2017).

## Shiny App : EpiBibR ExploR

<img src="man/figures/shiny.png" />

For people less comfortable with R and to allow more people to have
access to our package, we have also developed a Shiny
application.Through the same logic present in our package, researchers
can retrieve data from our epidemiology-based bibliography.

EpiBibR EploR is available [\[here\]](https://warin.ca/shiny/epibibr/)

## Features

<center>
Table 1. Features accessible through the package.
</center>

| Field Tags | Descriptions                        | Field Tags | Descriptions                    |
|------------|-------------------------------------|------------|---------------------------------|
| AU         | Authors                             | ISSN       | Source Code                     |
| TI         | Document Title                      | VOL        | Volume                          |
| AB         | Abstract                            | ISSUE      | Issue Number                    |
| PY         | Year                                | LT         | Language                        |
| DT         | Document Type                       | C1         | Author Address                  |
| MESH       | Medical Subject Headings Vocabulary | RP         | Reprint Address                 |
| TC         | Times Cited                         | ID         | PubMed ID                       |
| SO         | Publication Name (or Source)        | DE         | Authors’ Keywords               |
| J9         | Source Abbreviation                 | UT         | Unique Article Identifier       |
| JI         | ISO Source Abbreviation             | AU\_CO     | Author’s Country of Affiliation |
| DI         | Digital Object Identifier (DOI)     | DB         | Bibliographic Database          |

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

EpiBibR allows you to search bibligraphic references using several
arguments : Author, author’s country of origin, keywords in the title,
keywords in the abstract, year and source name. We have also created a
new function that synthesizes our previous ones. You can follow the
procedure through our [Practical
Guide](https://warint.github.io/EpiBibR/articles/vignette.html) and
access to [reproducible bibliometric
material](https://warint.github.io/EpiBibR/articles/reproducibleMaterial.html)

## Bibliometric Analysis

The *bibliometrix* package allows a thorough bibliometric analysis using
R. Our EpiBibR data have been designed to integrate easily with the
*bibliometrix* package. A shinyapp is also available `biblioshiny()`.
This package has been used extensively for various exercises mobilizing
massive amounts of data.

## Cite ‘epiBibR’

Open access to the article explaining EpibibR
\[<a href="https://www.jmir.org/2020/8/e19615/" target="_blank">here</a>\]

Please cite as:

Warin T,
<a href="https://www.jmir.org/2020/8/e19615/" target="_blank">“Global Research on Coronaviruses: An R Package”</a>,
J Med Internet Res 2020;22(8):e19615, DOI: 10.2196/19615, PMID:
32730218, PMCID: 7423387

``` r
@Article{info:doi/10.2196/19615,
author="Warin, Thierry",
title="Global Research on Coronaviruses: An R Package",
journal="J Med Internet Res",
year="2020",
month="Aug",
day="11",
volume="22",
number="8",
pages="e19615",
issn="1438-8871",
doi="10.2196/19615",
url="http://www.jmir.org/2020/8/e19615/",
url="https://doi.org/10.2196/19615",
url="http://www.ncbi.nlm.nih.gov/pubmed/32730218"
}
```

## Acknowledgements

The author would like to thank the Center for Interuniversity Research
and Analysis of Organizations (CIRANO, Montreal) for its support, as
well as Thibault Senegas, Marine Leroi and Martin Paquette. The usual
caveats apply.
