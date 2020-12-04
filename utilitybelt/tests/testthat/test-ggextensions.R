test_that("ggtheme functions work", {
  ggtheme_functions = c(theme_axis_titles, theme_axis_titles_cleveland)
  
  for (ggtheme_function in ggtheme_functions){
    expect_s3_class(ggtheme_function(), c("theme", "gg"), exact = TRUE)
  }
})
