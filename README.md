scgElectionsNZ <a href="https://sarahcgall.github.io/scgElectionsNZ/"><img src="man/figures/logo.png" align="right" height="138" alt="" /></a>
================
<!-- badges: start -->
[![Release](https://img.shields.io/badge/Release-development%20version%200&#46;0&#46;1-1c75bc)](https://github.com/sarahcgall/scgElectionsNZ/blob/master/NEWS.md)
[![R-CMD-check](https://github.com/sarahcgall/scgElectionsNZ/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sarahcgall/scgElectionsNZ/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/sarahcgall/scgElectionsNZ/graph/badge.svg?token=KRX0FWHUAO)](https://codecov.io/gh/sarahcgall/scgElectionsNZ)
<!-- badges: end -->

## Overview

`scgElectionsNZ` is an R package providing comprehensive data and tools for analyzing New Zealand’s general election 
results from 1996 to 2023. It offers a unique insight into the dynamics of the electoral process in New Zealand, 
presented through a variety of datasets and functions.

#### Datasets Included:

* [`summary`](https://sarahcgall.github.io/scgElectionsNZ/reference/summary.html): National-level overall results by party.
* [`turnout`](https://sarahcgall.github.io/scgElectionsNZ/reference/turnout.html): Electorate and ballot type-specific turnout and informal vote details.
* [`vote_type`](https://sarahcgall.github.io/scgElectionsNZ/reference/vote_type.html): Validity and method of votes by electorate and ballot.
* [`party_votes`](https://sarahcgall.github.io/scgElectionsNZ/reference/party_votes.html): Party votes at the electorate level.
* [`candidate_votes`](https://sarahcgall.github.io/scgElectionsNZ/reference/candidate_votes.html): Candidate votes at the electorate level.
* [`majority`](https://sarahcgall.github.io/scgElectionsNZ/reference/majority.html): Winning candidates and their margins of victory at the electorate level.
* [`split_electorate`](https://sarahcgall.github.io/scgElectionsNZ/reference/split_electorate.html): Electorate-level split-ticket voting data (2005 - 2023).
* [`split_total`](https://sarahcgall.github.io/scgElectionsNZ/reference/split_total.html): National-level split-ticket voting data (2005 - 2023).
* [`preMMP_results`](https://sarahcgall.github.io/scgElectionsNZ/reference/preMMP_results.html): National-level results from 1890 to 1993, before MMP.
* [`historic_turnout`](https://sarahcgall.github.io/scgElectionsNZ/reference/turnout_historic.html): National-level turnout data from 1879 to 2023.

## Installation

To install the development version of `scgElectionsNZ`, use:

``` r
# Install the development version from GitHub
devtools::install_github("sarahcgall/scgElectionsNZ")
```

## Usage
`scgElectionsNZ` includes several helper functions to enhance data analysis:

* [`add_data()`](https://sarahcgall.github.io/scgElectionsNZ/reference/add_data.html): Enhances datasets with regional or electorate type information.
* [`update_names()`](https://sarahcgall.github.io/scgElectionsNZ/reference/update_names.html): Standardises electorate names for consistent analysis across years or condense unsuccessful party names into "Other" for easier analysis.

Example usage:
``` r
library(scgElectionsNZ)

# Load a dataset
df <- scgUtils::get_data("majority")

# Add additional data
df <- add_data(df, output="regions")
df <- add_data(df, output="type")

# Standardise names
df <- update_names(df, output = "electorate")
df <- update_names(df, output = "party")

```

Explore detailed examples and dataset descriptions in the 
[package documentation](https://sarahcgall.github.io/scgElectionsNZ/reference/index.html).

## Data Sources and Disclaimer
#### Data Sources
The datasets in the `scgElectionsNZ` package are meticulously curated from the official results sourced from the [New Zealand Electoral Commission](https://electionresults.govt.nz/).
These datasets offer a comprehensive view of New Zealand's electoral outcomes and are crucial for in-depth analysis and research in political science, electoral studies, and related fields.

#### Disclaimer
While the utmost care has been taken to ensure the accuracy and reliability of the data, the New Zealand Electoral Commission 
was not involved in the development of this package and thus does not bear responsibility for any errors or omissions in the datasets. 
Users of `scgElectionsNZ` should note that the package's creators have independently compiled, processed, and presented the data. 
Any discrepancies or inaccuracies found within the datasets do not reflect on the official records maintained by the Electoral Commission.

#### Currency of Data
The data included in this package are up-to-date as of 3 December 2023. Users should be aware that subsequent electoral 
events or data revisions by the Electoral Commission after this date may not be reflected in the current version of `scgElectionsNZ`.

## Future Additions and Updates
Planned future additions include by-election and referendum results and enhanced datasets like `results_by_booths`. 
Upcoming functional updates will focus on visualising election results specific to New Zealand and making boundary
adjustments for better comparative analysis.

## Feedback and Contributions
Suggestions and contributions are welcome. For any proposed additions, amendments, or feedback, please [create an issue](https://github.com/sarahcgall/scgElectionsNZ/issues).

## Related Packages
Check out [`scgUtils`](https://sarahcgall.github.io/scgUtils) for additional functions and visualisation tools.
