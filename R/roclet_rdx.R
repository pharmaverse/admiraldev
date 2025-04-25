#' Roclet Extending the Standard rd Roclet
#'
#' This roclet extends the standard `rd` roclet by allowing
#' - to add permitted values and default values to the `@param` tag and
#' - to add a caption and a description to examples.
#'
#' The following tags are supported:
#'
#' - `@permitted`: Permitted values for the argument. Permitted value description
#'     which are used for several arguments/functions can be stored in
#'     `inst/roxygen/rdx_meta.R`. For example:
#'     ```
#'     list(
#'       rdx_permitted_values = list(
#'         mode = "`\"first\"`, `\"last\"`",
#'         msg_type = "`\"none\"`, `\"message\"`, `\"warning\"`, `\"error\"`"
#'       )
#'     )
#'     ```
#'     The reference to the permitted values is done by specifying the name of
#'     the list element in square brackets, e.g., `@permitted [mode]`.
#' - `@default`: Default value for the argument. By default the default value
#'   from the function formals is displayed. This can be overwritten by using
#'   the `@default` tag.
#'
#' - `@examplesx`: This tag can be used to mark the beginning of the examples
#'    section but doesn't affect the output, i.e., it can be omitted.
#'
#' - `@caption`: Caption for the example. The caption is displayed as a subsection
#'   in the examples section. The caption can be followed by an arbitrary number
#'   of `@info` and `@code` tags.
#' - `@info`: Description of the example.
#' - `@code`: Code of the example.
#'
#'      By default, any warning or error issued by the example code causes the
#'      building of the documentation to fail. If this is expected, the condition
#'      can be added to the `expected_cnds` option of the `@code` tag. E.g.,
#'      ```
#'      @code [expected_cnds = "warning"]
#'      ```
#'
#' To use the roclet call `roxygen2::roxygenise(roclets =
#' "admiral::rdx_roclet")` or add to the `DESCRIPTION` file:
#' ```
#' Roxygen: list(markdown = TRUE, roclets = c("collate", "namespace", "admiraldev::rdx_roclet"))
#' ```
#'
#' For more information on roxygen2 roclets see the [Extending
#' roxygen2](https://roxygen2.r-lib.org/articles/extending.html).
#'
#' @keywords documentation
#'
#' @export
#'
#' @caption Using the custom tags
#' @info The id `char_scalar` used for the `@permitted` tag is defined in
#'   `man/roxygen/rdx_meta.R`.
#'
#'   See [demo_fun()] for a rendered version of the `Rd` code generated in the
#'   example.
#' @code
#' roxygen2::roc_proc_text(
#'   rdx_roclet(),
#'   c(
#'     "#' A Demo Function",
#'     "#'",
#'     "#' This function is used to demonstrate the custom tags of the `rdx_roclet()`.",
#'     "#'",
#'     "#' @param x An argument",
#'     "#' @param number A number",
#'     "#' @permitted A number",
#'     "#' @param letter A letter",
#'     "#' @permitted [char_scalar]",
#'     "#' @default The first letter of the alphabet",
#'     "#' @examplesx",
#'     "#' @caption A simple example",
#'     "#' @info This is a simple example showing the default behaviour.",
#'     "#' @code demo_fun(1)",
#'     "#' @caption An example with a different letter",
#'     "#' @info This example shows that the `letter` argument doesn't",
#'     "#'   affect the output. ",
#'     "#' @code demo_fun(1, letter = \"b\")",
#'     "demo_fun <- function(x, number = 1, letter = \"a\") 42"
#'   ))
rdx_roclet <- function() {
  out <- roclet("rdx")
  # keep the standard roclet_rd class to allow standard processing
  class(out) <- c("roclet_rdx", "roclet_rd", "roclet")
  out
}

#' @export
roclet_process.roclet_rdx <- function(x, blocks, env, base_path) {
  # read metadata for permitted values
  if (file.exists("./man/roxygen/rdx_meta.R")) {
    # nolint next
    rdx_permitted_values <- source("./man/roxygen/rdx_meta.R")$value$rdx_permitted_values
  } else {
    rdx_permitted_values <- NULL
  }
  # pre-process blocks to
  # - move @permitted and @default tags into @param tags and add defaults from function call
  # - transform @caption, @info and @code tags into @examplex tags
  blocks <- blocks %>%
    map(transform_param, rdx_permitted_values = rdx_permitted_values) %>%
    map(transform_examplesx)
  # call standard processing of rd roclet
  NextMethod()
}

#' Process `@permitted` and `@default` tags
#'
#' This function processes the `@permitted` and `@default` tags and moves them
#' into the `@param` tag. The default value is taken from the function call if
#' not specified.
#'
#' @param block A block of roxygen tags of one function
#'
#' @param rdx_permitted_values A list of permitted values
#'
#'   The name of the list item can be referenced in the `@permitted` tag by
#'   specifying the name in square brackets, e.g., `@permitted [mode]`.
#'
#' @returns The block with the transformed tags
#'
#' @keywords internal
transform_param <- function(block, rdx_permitted_values) {
  # extract default values from the function definition
  if (length(block$call) >= 3) {
    defaults <- block$call[[3]][[2]]
  } else {
    defaults <- list()
  }
  # process tags: @param tags are stored temporarily in act_param until the
  # contents from the @permitted and @default tags is processed
  tags <- block$tags
  out_tags <- list()
  act_param <- list()
  for (i in seq_along(tags)) {
    if (tags[[i]]$tag == "param") {
      if (length(act_param) > 0) {
        out_tags <- c(out_tags, list(get_param_tag(act_param, defaults)))
      }
      act_param <- list(tag = tags[[i]], permitted = NULL, default = NULL)
    } else if (tags[[i]]$tag == "permitted") {
      if (!is.na(tags[[i]]$val$ref)) {
        ref_resolved <- rdx_permitted_values[[tags[[i]]$val$ref]]
        if (is.null(ref_resolved)) {
          warn_roxy_tag(
            tags[[i]],
            message = paste(
              "The id {.val {tags[[i]]$val$ref}} couldn't be found in",
              "{.file man/roxygen/rdx_meta.R}"
            )
          )
          ref_resolved <- tags[[i]]$val$ref
        }
        if (!is.null(ref_resolved)) {
          temp_tag <- tags[[i]]
          temp_tag$raw <- ref_resolved
          ref_resolved <- tag_markdown(temp_tag)$val
        }
        tags[[i]]$val$ref <- ref_resolved
      }
      act_param$permitted <- tags[[i]]$val %>%
        discard(is.na) %>%
        paste(collapse = " ")
    } else if (tags[[i]]$tag == "default") {
      act_param$default <- tags[[i]]$val
    } else {
      if (length(act_param) > 0) {
        out_tags <- c(out_tags, list(get_param_tag(act_param, defaults)))
        act_param <- list()
      }
      if (tags[[i]]$tag != "param") {
        out_tags <- c(out_tags, list(tags[[i]]))
      }
    }
  }
  block$tags <- out_tags
  block
}

#' Get the content of the `@param` tag
#'
#' This function adds the permitted values and the default value to the
#' description of the `@param` tag. They are added as a definition list
#' (`\describe{}`).
#'
#' @param act_param The content of the argument description to format
#'
#'   A list with three named elements is expected:
#'
#'   - `tag`: The `@param` tag
#'   - `permitted`: The permitted values
#'   - `default`: The default value
#'
#' @param defaults A list of default values from the function call
#'
#' @returns The formatted `@param` tag
#'
#' @keywords internal
get_param_tag <- function(act_param, defaults) {
  tag <- act_param$tag
  if (is.null(act_param$default)) {
    default_value <- defaults[[tag$val$name]]
    if (is_missing(default_value)) {
      default_value <- "none"
    } else {
      default_value <- paste0(
        "\\code{",
        paste0(expr_deparse(default_value, width = 80), collapse = "\n"),
        "}"
      )
    }
    act_param$default <- default_value
  }
  tag$val$description <- paste0(
    tag$val$description,
    "\n\n\\describe{\n",
    if_else(
      !is.null(act_param$permitted),
      paste0("\\item{Permitted values}{", act_param$permitted, "}\n"),
      ""
    ),
    "\\item{Default value}{", act_param$default, "}\n}"
  )
  tag
}

#' Transform `@caption`, `@info` and `@code` tags into `@examplex` tags
#'
#' @param block A block of roxygen tags of one function
#'
#' @returns The block with the transformed tags
#'
#' @keywords internal
transform_examplesx <- function(block) {
  # process tags: @examplex tags are stored temporarily in act_example until the
  # contents from the @caption, @info, and @code tags is processed
  tags <- block$tags
  out_tags <- list()
  act_example <- list()
  example_env <- new_environment(parent = global_env())
  for (i in seq_along(tags)) {
    if (tags[[i]]$tag == "caption") {
      if (length(act_example) > 0) {
        if (!"caption" %in% names(act_example)) {
          act_example$caption <- NA_character_
        }
        out_tags <- c(
          out_tags,
          list(roxy_tag("examplex", "generated", val = act_example))
        )
      }
      act_example <- list(caption = tags[[i]]$val, contents = NULL)
    } else if (tags[[i]]$tag == "info") {
      act_example$contents <- paste(act_example$contents, tags[[i]]$val, sep = "\n\n")
    } else if (tags[[i]]$tag == "code") {
      act_example$contents <- paste(
        act_example$contents,
        paste(
          "\\if{html}{\\out{<div class=\"sourceCode r\">}}\\preformatted{",
          execute_example(
            tags[[i]]$val$code,
            expected_cnds = tags[[i]]$val$options$expected_cnds,
            env = example_env
          ) %>%
            str_replace_all("\\%", "\\\\%"),
          "}\\if{html}{\\out{</div>}}",
          sep = ""
        ),
        sep = "\n\n"
      )
    } else {
      if (length(act_example) > 0) {
        out_tags <- c(
          out_tags,
          list(roxy_tag("examplex", "generated", val = act_example))
        )
        act_example <- list()
      }
      if (tags[[i]]$tag != "examplesx") {
        out_tags <- c(out_tags, list(tags[[i]]))
      }
    }
  }
  block$tags <- out_tags
  block
}

#' Execute Example Code
#'
#' This function executes the example code and captures the output and messages.
#' If the example code issues an unexpected message, an error is issued.
#'
#' @param code The example code
#'
#'   The code is expected to be a character vector of R code lines.
#'
#' @permitted A character vector

#' @param expected_cnds Expected conditions
#'
#' @permitted A character vector
#'
#' @param env The environment in which to evaluate the example code
#'
#' @permitted An environment
#'
#' @returns A character vector of the input code and the output and messages
#'   created by the code. Output and messages are prefixed by `"#>"`.
#'
#' @keywords internal
#'
#' @caption Execute Example Code
#' @code [expected_cnds = "admiraldev-unexpected_cnd"]
#' admiraldev:::execute_example("1 + 1")
#'
#' admiraldev:::execute_example("log(-1)")
#'
#' admiraldev:::execute_example("log(-1)", expected_cnds = "warning")
execute_example <- function(code, expected_cnds = NULL, env = caller_env()) {
  expr_list <- parse_code(code)
  result <- NULL
  for (expr in expr_list) {
    srcref <- expr$srcref
    result <- c(result, srcref)
    if (expr$eval) {
      return_value <- capture_output(
        !!expr$expr,
        srcref = srcref,
        expected_cnds = expected_cnds,
        env = env
      )
      if (!is.null(return_value)) {
        result <- c(result, paste("#>", return_value))
      }
    }
  }
  paste(result, collapse = "\n")
}

#' Parse Code
#'
#' The function parses the code and returns a list of expressions and source
#' references.
#'
#' @param code The code to parse
#'
#' @permitted A character vector
#'
#' @returns A list of expressions and source references
#'
#' Each item of the list is a list with the following elements:
#' - `expr`: The expression
#' - `srcref`: The source reference
#' - `eval`: A logical indicating whether the expression should be evaluated,
#'   i.e., it is not a comment or an empty line.
#'
#' @keywords documentation
#'
#' @export
#'
#' @examples
#' parse_code("1+1\n2*2")
#'
#' parse_code(c("# sum:", "sum(\n  1, #first\n  2\n)"))
parse_code <- function(code) {
  expr_list <- parse(text = code, keep.source = TRUE)
  out <- list()
  wholesrcref <- as.character(attr(expr_list, "wholeSrcref"))
  whole_i <- 1
  for (i in seq_along(expr_list)) {
    srcref <- as.character(attr(expr_list, "srcref")[[i]])
    while (wholesrcref[[whole_i]] != srcref[[1]]) {
      out <- c(
        out,
        list(list(expr = NULL, srcref = wholesrcref[[whole_i]], eval = FALSE))
      )
      whole_i <- whole_i + 1
    }
    out <- c(
      out,
      list(list(expr = expr_list[[i]], srcref = srcref, eval = TRUE))
    )
    whole_i <- whole_i + length(srcref)
  }
  out
}

admiraldev_environment$capture_output_call_nr <- 0

#' Capture Output and Messages
#'
#' The function captures both output and expected messages from an R expression.
#' If the expression results in an unexpected message, an error is issued.
#'
#' @param expr An R expression to evaluate
#'
#' @permitted An unquoted R expression
#'
#' @param srcref The source reference of the expression
#' @param expected_cnds A character vector of expected conditions
#'
#'   If the expression issues a condition of a class that is in this vector, the
#'   condition is ignored but added to the return value.
#'
#'   Otherwise, an error is issued.
#'
#' @param env The environment in which to evaluate the expression
#'
#' @return A character vector of captured output and messages
#'
#' @keywords documentation
#'
#' @export
#'
#' @caption Capture Output and Messages
#' @code [expected_cnds = "admiraldev-unexpected_cnd"]
#' capture_output(1 + 1)
#'
#' capture_output(log(-1))
#'
#' capture_output(log(-1), expected_cnds = "warning")
capture_output <- function(expr, srcref = NULL, expected_cnds = NULL, env = caller_env()) {
  # warnings need to be issued immediately, otherwise they are not caught
  local_options(warn = 1, width = 80)
  code <- enexpr(expr)
  cnds <- list()
  admiraldev_environment$capture_output_call_nr <- admiraldev_environment$capture_output_call_nr + 1
  result <- NULL
  # execute the expression and capture all messages
  # conditions can't be muffled as those from cli would be incomplete then
  # thus they are sunk into a temporary file to avoid that they are displayed
  temp_file <- tempfile(fileext = ".txt")
  con <- file(temp_file, "w")
  old_con <- sink.number(type = "message")
  sink(con, type = "message") # nolint
  try(
    withCallingHandlers(
      result <- withVisible(eval(code, envir = env)),
      condition = function(cnd) {
        cnds <<- c(cnds, list(list(
          cond = cnd,
          call_nr = admiraldev_environment$capture_output_call_nr
        )))
      }
    ),
    silent = TRUE
  )
  if (old_con > 2) {
    sink(getConnection(old_con), type = "message") # nolint
  } else {
    sink(type = "message") # nolint
  }
  close(con)
  # check if any of the conditions are unexpected
  messages <- NULL
  for (cnd_ext in cnds) {
    # ignore all conditions not belonging to the current call of capture_output()
    if (cnd_ext$call_nr != admiraldev_environment$capture_output_call_nr) next
    cnd <- cnd_ext$cond
    message <- capture_message(try(rlang::cnd_signal(cnd)))
    # ignore empty messages, e.g., from cli
    if (length(message) == 0) next
    if (is.null(srcref)) {
      srcref <- expr_deparse(code)
    }
    if ((is.null(expected_cnds) || !any(class(cnd) %in% expected_cnds))) {
      admiraldev_environment$capture_output_call_nr <-
        admiraldev_environment$capture_output_call_nr - 1
      cli_abort(
        c(
          "The expression",
          paste(">", srcref),
          "issued an unexpected condition:",
          cnd$message,
          cnd$body,
          paste(
            "If this is expected, add any of the classes {.val {class(cnd)}} to",
            "the argument {.arg expected_cnds}."
          )
        ),
        class = "admiraldev-unexpected_cnd"
      )
    } else {
      messages <- c(messages, message)
    }
  }
  admiraldev_environment$capture_output_call_nr <- admiraldev_environment$capture_output_call_nr - 1
  if (is.null(result)) {
    messages
  } else if (result$visible) {
    # print the results and capture output and messages to cover the case that
    # print methods issue messages like for admiral::duplicates
    temp_file <- tempfile(fileext = ".txt")
    con <- file(temp_file, "w")
    # withr can't be used here because it doesn't support writing to the same
    # connection for both output and messages.
    sink(con) # nolint
    old_con <- sink.number(type = "message")
    sink(con, type = "message") # nolint
    print(result$value)
    sink() # nolint
    if (old_con > 2) {
      sink(getConnection(old_con), type = "message") # nolint
    } else {
      sink(type = "message") # nolint
    }
    close(con)
    result <- readLines(temp_file)
    c(result, messages)
  } else {
    messages
  }
}

#' Captures Messages Preserving the Message Redirection
#' @param expr An R expression to evaluate
#' @returns A character vector of captured messages
#' @keywords internal
capture_message <- function(expr) {
  # warnings need to be issued immediately, otherwise they are not caught
  local_options(warn = 1)
  temp_file <- tempfile(fileext = ".txt")
  con <- file(temp_file, "w")
  old_con <- sink.number(type = "message")
  sink(con, type = "message") # nolint
  try(eval(expr))
  if (old_con > 2) {
    sink(getConnection(old_con), type = "message") # nolint
  } else {
    sink(type = "message") # nolint
  }
  close(con)
  readLines(temp_file)
}

#' @export
roxy_tag_parse.roxy_tag_examplesx <- function(x) {
  x
}

#' @export
roxy_tag_parse.roxy_tag_examplex <- function(x) {
  tag_markdown(x)
}

#' @export
roxy_tag_rd.roxy_tag_examplex <- function(x, base_path, env) {
  rd_section("examplex", x$val)
}

#' @export
merge.rd_section_examplex <- function(x, y, ...) {
  stopifnot(identical(class(x), class(y)))
  rd_section(
    x$type,
    list(
      caption = c(x$value$caption, y$value$caption),
      contents = c(x$value$contents, y$value$contents)
    )
  )
}

#' @export
format.rd_section_examplex <- function(x, ...) {
  paste0(
    "\\section{Examples}{\n",
    paste0(
      if_else(
        is.na(x$value$caption),
        x$value$contents,
        paste0("\\subsection{", x$value$caption, "}{", x$value$contents, "}")
      ),
      collapse = "\n"
    ),
    "}\n"
  )
}

#' @export
roxy_tag_parse.roxy_tag_caption <- function(x) {
  tag_markdown(x)
}

#' @export
roxy_tag_parse.roxy_tag_info <- function(x) {
  tag_markdown(x)
}

#' @export
roxy_tag_parse.roxy_tag_code <- function(x) {
  raw_parsed <- str_match(
    str_remove(x$raw, "\\n+$"),
    "(?:\\[(.*)\\] *)?((?:.|\n)+)?"
  )[, 2:3]
  x$val <- list(
    options = eval(parse_expr(paste0("list(", raw_parsed[[1]], ")"))),
    code = str_remove(raw_parsed[[2]], "^\n")
  )
  if (!("expected_cnds" %in% names(x$val$options))) {
    x$val$options$expected_cnds <- "message"
  }
  x
}

#' @export
roxy_tag_parse.roxy_tag_permitted <- function(x) {
  raw_parsed <- str_match(
    str_remove(x$raw, "\\n+$"),
    "(?:\\[(.*)\\] *)?((?:.|\n)+)?"
  )[, 2:3]
  x_text <- x
  if (is.na(raw_parsed[[2]])) {
    x_text$val <- raw_parsed[[2]]
  } else {
    x_text$raw <- raw_parsed[[2]]
    x_text <- tag_markdown(x_text)
  }
  x$val <- list(
    ref = raw_parsed[[1]],
    text = x_text$val
  )
  x
}

#' @export
roxy_tag_parse.roxy_tag_default <- function(x) {
  tag_markdown(x)
}
