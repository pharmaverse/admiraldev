# expr_c Test 1: deprecation message if function is called

    Code
      result <- expr_c(expr(USUBJID), expr(STUDYID))
    Message
      `expr_c()` was deprecated in admiraldev 1.6.0.
      i Please use `c()` instead.
      x This message will turn into a warning at the beginning of 2028.
      i See admiral's deprecation guidance: https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation

