#' @keywords internal
#' @importFrom dplyr across arrange desc filter group_by
#'   if_else mutate n pull rename select starts_with
#'   ungroup n_distinct summarise tibble %>%
#'
#' @importFrom rlang := abort as_label as_string caller_env
#'   current_env .data enexpr env expr expr_deparse
#'   exprs f_lhs f_rhs global_env is_named is_call
#'   is_expression is_formula is_integerish is_logical
#'   is_missing is_symbol new_environment parse_expr
#'   set_names sym syms warn %||%
#'
#' @importFrom utils capture.output
#'
#' @importFrom purrr discard map map2 map_chr map_lgl
#'   keep list_flatten every
#'
#' @importFrom roxygen2 rd_section roclet roclet_process roxy_tag
#'   roxy_tag_parse roxy_tag_rd tag_markdown
#'   warn_roxy_tag
#'
#' @importFrom stringr str_c str_detect str_extract str_match
#'   str_remove str_remove_all str_replace_all str_subset
#'
#' @importFrom lubridate date days is.instant ymd years hours
#'   minutes parse_date_time
#'
#' @importFrom tidyselect contains vars_select
#'
#' @importFrom lifecycle deprecate_warn deprecated deprecate_stop
#'   deprecate_soft
#'
#' @importFrom cli ansi_collapse cli_abort cli_div
#'
#' @importFrom glue glue glue_collapse
#'
#' @importFrom withr local_options
#'
"_PACKAGE"
