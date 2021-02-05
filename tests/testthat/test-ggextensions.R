test_that("ggtheme functions work", {
  expect_s3_class(suppressWarnings(theme_axis_titles()), c("theme", "gg"), exact = TRUE)
  expect_s3_class(theme_axis_titles_cleveland(), c("theme", "gg"), exact = TRUE)
  expect_s3_class(theme_common_adjustments(), c("theme", "gg"), exact = TRUE)
  expect_s3_class(theme_no_legend_title(), c("theme", "gg"), exact = TRUE)
  expect_s3_class(theme_no_legend(), c("theme", "gg"), exact = TRUE)
})

test_that("geom functions work",{
  expect_s3_class(geom_crossbar_predefined(), c("LayerInstance","Layer","ggproto","gg" ))
  expect_s3_class(geom_barplot_counts(), c("LayerInstance","Layer","ggproto","gg" ))
})