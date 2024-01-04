
<!-- README.md is generated from README.Rmd. Please edit that file -->

# statline

<!-- badges: start -->
<!-- badges: end -->

The goal of statline is to provide a dashboard to easily search the
[statline](https://opendata.cbs.nl/statline/#/CBS/) database.

In my opinion the statline website does not offer effective tools to
search the database. Therefore I have created this package that contains
a shiny dashboard. The dashboard uses the [CBS
api](https://cran.r-project.org/web/packages/cbsodataR/vignettes/cbsodata.html)
to present an overview of all datasets available. The dashboard allows
to enter search terms on different fields. It also allows to select
specific years or publication frequency to narrow down the search
results.

This work is based on earlier work done as a project at
[VNG](https://vng.nl/). This repository can be considered as a fork of
that earlier work, the code of which is published at
[Gitlab](https://gitlab.com/commondatafactory/datascience/statline-dashboard).

## Installation

The package ‘statline’ can be installed from GitHub as:

``` r

# Install the development version from GitLab
devtools::install_github("reidhin/statline_dashboard")
```

After installation the package can be executed by the command
`run_app()`, see example below.

## Example

You can start the dashboard by:

``` r
library(statline)

# Launch the dashboard
run_app()
```

## Project structure

    ├── app.R                         <- Script to correctly start the app in shinyapps.io
    ├── DESCRIPTION                   <- Project description
    ├── inst
    │   └── dashboard
    │       └── www                   <- Folder with style-files, javascript and favicon
    ├── LICENSE.md                    <- License
    ├── man                           <- Help-files with explanation of all functions in this package
    │   └── run_app.Rd
    ├── NAMESPACE
    ├── NEWS.md
    ├── R
    │   ├── run_app.R                 <- main function that starts the (dashboard) app
    │   ├── ui.R                      <- functions for the user interface
    │   └── util_modals.R             <- functions for the modals
    ├── README.md
    ├── README.Rmd                    <- readme file with explanation on this package
    ├── rsconnect                     <- Folder with files needed to publish the app on shinyapps.io
    └── statline.Rproj

## Licentie

<a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.nl"><img alt="Creative Commons-Licentie" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />Dit
werk valt onder een
<a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.nl">Creative
Commons Naamsvermelding-NietCommercieel-GelijkDelen 4.0
Internationaal-licentie</a>.
