# scgElectionsNZ (development version 0.0.1)

### Overview
This is the initial release of scgElectionsNZ, an R package designed to provide comprehensive data and analytical tools 
for New Zealand’s general election results from 1996 to 2023. This development version marks the first step in offering 
a robust resource for political scientists, researchers, students, and anyone interested in the intricacies of New 
Zealand's electoral processes.

### Major Features
**Datasets Introduced:**<br>
This version includes several key datasets:

* **`summary`:** National-level overall results by party. 
* **`turnout`:** Electorate and ballot type-specific turnout and informal vote details.
* **`vote_type`:** Validity and type of votes by electorate and ballot.
* **`party_votes`:** Party votes at the electorate level.
* **`candidate_votes`:** Candidate votes at the electorate level.
* **`majority`:** Winning candidates and their margins of victory at the electorate level.
* **`split_electorate`:** Electorate-level split-ticket voting data (2005 - 2023).
* **`split_total`:** National-level split-ticket voting data (2005 - 2023).
* **`preMMP_results`:** National-level results from 1890 to 1993, before MMP.
* **`historic_turnout`:** National-level turnout data from 1879 to 2023.

**Helper Functions:**<br>
A set of functions to enhance data handling and analysis:

* **`add_data()`:** Augments datasets with regional or electorate type information.
* **`update_names()`:** Standardises electorate names for consistent analysis across years or 
condense unsuccessful party names into "Other" for easier analysis.

**Documentation and Examples:**<br>
Comprehensive documentation and examples have been provided for each dataset and 
function, making it easier for users to understand and utilise the package effectively.

### Improvements and Bug Fixes
* **Data Accuracy:** Implementation of rigorous checks to ensure the accuracy and reliability of the datasets.
* **Performance Optimisation:** Enhancements made to improve the performance of data processing and analysis functions.

### Future Plans
* **Known Data Issues:** Addressing discrepancies in raw split voting files and updating `split_electorate` and `split_total` datasets accordingly.
* **Data Improvements:** Enhancing the quality of internal datasets that feed into the helper functions and including special characters in the datasets.
* **Additional Datasets:** Addition of `results_by_booths` for Party and Candidate Votes, including Advanced voting, to align `candidate_votes` with `party_votes`.
* **By-Election and Referendum Data:** Inclusion of detailed datasets on by-elections and referendums to provide a more comprehensive electoral analysis.
* **New Functions:** Development of new functions such as `amend_boundary`, `plot_parliament`, and `plot_cartogram` for advanced analysis and visualisation.
* **CRAN Release:** Plans for releasing the package on CRAN to widen accessibility.