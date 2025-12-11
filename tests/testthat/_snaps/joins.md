# anti_join Test 1: works without warning on attribute mismatch

    Code
      anti_join(x, y, by = "id")
    Output
      # A tibble: 1 x 2
           id val_x
        <dbl> <chr>
      1     3 x3   

# inner_join Test 2: works without warning on attribute mismatch

    Code
      inner_join(x, y, by = "id")
    Output
      # A tibble: 2 x 3
           id val_x val_y
        <dbl> <chr> <chr>
      1     1 x1    y1   
      2     2 x2    y2   

# left_join Test 3: works without warning on attribute mismatch

    Code
      left_join(x, y, by = "id")
    Output
      # A tibble: 3 x 3
           id val_x val_y
        <dbl> <chr> <chr>
      1     1 x1    y1   
      2     2 x2    y2   
      3     3 x3    <NA> 

