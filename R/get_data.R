#' Get NZ Election Datasets
#'
#' `get_data()` is a helper function for loading datasets. It provides the user with the ability to set
#' the name of the data frame within their own environment (e.g. df).
#'
#' @param ... A string, naming the desired dataset.
#'   Available datasets include:
#'   * `summary`: overall results at the national-level by party
#'   * `turnout`: turnout and informal vote by electorate and ballot type (candidate and party)
#'   * `vote_type`: valdidity and vote type by electorate and ballot type (candidate and party)
#'   * `party_votes`: party vote by electorate and party (electorate-level)
#'   * `candidate_votes`: candidate vote by electorate and party (electorate-level)
#'   * `majority`: winning candidate and margin of victory by electorate (electorate-level)
#'   * `split_total`: split-ticket voting (2005 - 2023 only) - the number of voters who cast
#'      their party vote for a different party to their candidate vote (national-level by party)
#'   * `preMMP_results`: overall results between 1890 and 1993 (prior to the introduction of MMP)
#'      (national-level by party)
#'   * `historic_turnout`: turnout between 1879 and 2023 (national-level by year)
#' @returns
#'   `get_data()` returns a data frame.
#'
#' @examples
#' df <- get_data("majority")
#' @export
get_data <- function(...) {
    e <- new.env()
    name <- utils::data(..., envir = e)[1]
    e[[name]]
}
