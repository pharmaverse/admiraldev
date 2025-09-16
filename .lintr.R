library(lintr)

source("inst/lintr/linters.R")

linters <- admiral_linters()

exclusions <- list(
  "R/data.R" = Inf,
  "inst" = list(undesirable_function_linter = Inf),
  "R/assertions.R" = list(undesirable_function_linter = Inf),
  "vignettes" = list(undesirable_function_linter = Inf)
)
