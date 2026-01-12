# convert_dtm_to_dtc Test 3: Error is thrown if dtm is not in correct format

    Code
      convert_dtm_to_dtc("2022-04-05T15:26:14")
    Condition
      Error in `convert_dtm_to_dtc()`:
      ! Input `dtm` must be of class Date or POSIXct/POSIXt

# %or% Test 12: deprecation message if function is called

    Code
      input <- dplyr::tribble(~USUBJID, ~AVAL, "P01", 2, )
      result <- input %>% dplyr::select(-AVAL) %>% dplyr::mutate(AVAL = sqrt("4") %or%
        2)
    Message
      `%or%()` was deprecated in admiraldev 1.4.0.
      x This message will turn into a warning at the beginning of 2027.
      i See admiral's deprecation guidance: https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation
      i Please get in touch if you are using this function!

# valid_time_units Test 13: deprecation message if function is called

    Code
      result <- valid_time_units()
    Message
      `valid_time_units()` was deprecated in admiraldev 1.4.0.
      x This message will turn into a warning at the beginning of 2027.
      i See admiral's deprecation guidance: https://pharmaverse.github.io/admiraldev/dev/articles/programming_strategy.html#deprecation
      i Please get in touch if you are using this function!

