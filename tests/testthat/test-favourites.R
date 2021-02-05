test_that("foavourite functions work", {
  

  # No Erros-------------------------------------------------------------------------
  expect_error(fav_colours(),NA)
  expect_error(fav_themes(),NA)
  expect_error(fav_shiny_renderDataTable_options(),NA)
  
  
  # Correct Output -------------------------------------------------------------------------
  expect_type(fav_colours(), "character")
  expect_type(fav_themes(), "character")
  expect_true(assertthat::is.string(fav_shiny_renderDataTable_options()))
  
  
})
