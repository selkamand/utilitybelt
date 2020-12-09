test_that("df_sum_last_column works", {
  testthat::expect_equal(df_sum_last_column(mtcars), expected = 90)
  
  test_df = data.frame(first_col=LETTERS[1:5], second_col=rep(5, times=5))
  testthat::expect_equal(df_sum_last_column(test_df), expected = 25)
  
  test2_df = data.frame(first_col=rep(5, times=5), second_col=LETTERS[1:5])
  testthat::expect_error(df_sum_last_column(test2_df))
  
  test3_vector = 1:5
  testthat::expect_error(df_sum_last_column(test3_vector))
})
