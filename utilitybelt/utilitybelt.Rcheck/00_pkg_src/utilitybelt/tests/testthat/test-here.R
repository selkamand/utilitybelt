test_that("positiveControl_checkScriptsDeclareTheirLocation", {
  print(getwd())
  testthat::expect_true(checkScriptsDeclareTheirLocation("here_positive_control"))
})
