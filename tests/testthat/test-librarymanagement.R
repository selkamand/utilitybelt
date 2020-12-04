test_that("library quietload works", {
  expect_error(suppressWarnings(library_quietload(sdjkawdasdjklawdmlkawmw)))
  expect_error(suppressWarnings(library_quietload(base)), NA)
})

