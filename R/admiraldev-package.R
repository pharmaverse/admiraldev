#' @keywords internal
#' @importFrom dplyr across arrange bind_rows case_when desc ends_with filter
#'   full_join group_by if_else mutate n pull rename row_number select slice
#'   starts_with transmute ungroup n_distinct union distinct summarise coalesce
#'   bind_cols na_if tibble %>%
#' @importFrom rlang := abort arg_match as_label as_name as_string call2
#'   caller_env call_name current_env .data enexpr env eval_bare eval_tidy expr
#'   expr_deparse expr_interp expr_label exprs f_lhs f_rhs global_env is_named
#'   missing_arg is_bare_formula is_call is_character is_expression is_formula
#'   is_integerish is_logical is_missing is_symbol new_environment parse_expr
#'   parse_exprs set_names sym syms type_of warn %||%
#' @importFrom utils capture.output str
#' @importFrom purrr discard map map2 map_chr map_lgl reduce walk keep map_if
#'   transpose list_flatten every modify_at modify_if reduce compose
#' @importFrom roxygen2 rd_section roclet roclet_process roxy_tag roxy_tag_parse
#'   roxy_tag_rd tag_markdown warn_roxy_tag
#' @importFrom stringr str_c str_detect str_extract str_glue str_match
#'   str_remove str_remove_all str_replace str_replace_all str_trim str_to_lower
#'   str_subset str_to_title str_to_upper
#' @importFrom lubridate as_datetime ceiling_date date days duration floor_date is.Date is.instant
#'             time_length %--% ymd ymd_hms weeks years hours minutes
#' @importFrom tidyr drop_na nest pivot_longer pivot_wider unnest
#' @importFrom tidyselect all_of contains vars_select
#' @importFrom lifecycle deprecate_warn deprecated deprecate_stop deprecate_soft
#' @importFrom cli cli_abort cli_div
#' @importFrom glue glue glue_collapse
#' @importFrom withr local_options
"_PACKAGE"
