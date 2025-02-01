#' Aggregate tests by a grouping variable
#'
#' Counts test results by a grouping variable (`Created Date`, by default) and
#' adds some useful columns
#'
#' @param data A [data.frame()] or [tibble()].
#' @param by A string matching one of the column names of `data`;
#' the default is  `"Created Date"`.
#' @return an object of the same type as `data`,
#' with the following columns added:
#'
#' * `n tests`
#' * `n with results`
#' * `n positive`
#' * `% positive`
#' * `period`
#'
#' The output will be arranged in ascending order of the variable
#' identified by the `by` argument;
#' that is, it will be arranged in chronological order of `Created Date`,
#' by default.
#'
#' @export
#'
#' @importFrom dplyr filter group_by summarize mutate arrange if_else
aggregate_tests = function(
    data,
    by = "Created Date")
{

  agg_data =
    data |>
    dplyr::group_by(across(all_of(by))) |>
    dplyr::summarize(
      .groups = "drop",
      `n tests` = sum(.data$n_tests, na.rm = TRUE),
      `n with results` =
        sum(.data$n_tests * (.data$Result %in% c("Negative", "Positive")),
            na.rm = TRUE),
      `n positive` = sum(.data$n_tests * (.data$Result == "Positive"), na.rm = TRUE)
    ) |>
    dplyr::mutate(
      `% positive` = .data$`n positive` / .data$`n with results` * 100
    ) |>
    dplyr::arrange(across(all_of(by))) |>
    dplyr::mutate(
      "period" =
        dplyr::if_else(
          .data$`Created Date` <= "2021-08-15",
          "baseline",
          "in session"))

  return(agg_data)
}
