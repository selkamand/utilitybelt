test_that("save_RDS works", {
  my_new_object <- "my_new_object"
  rds_file_preexisting.path = system.file("filesfortesting/save_RDS/my_object.rds", package = "utilitybelt")
  rds_file_newfile.path = paste0(system.file("filesfortesting/save_RDS", package = "utilitybelt"), "/my_new_object.rds")
  
  #Ensure filesystem is set up as expected
  unlink(rds_file_newfile.path)
  
  expect_error(
    save_RDS(object = my_new_object, file = rds_file_preexisting.path, force_overwrite = FALSE),
    "exists"
    )
  
  expect_error(
    save_RDS(object = my_new_object, file = rds_file_newfile.path, force_overwrite = FALSE),
    NA
    )
  
  expect_error(
    save_RDS(object = my_new_object, file = rds_file_newfile.path, force_overwrite = FALSE),
    "exists"
  )
  
  expect_error(
    save_RDS(object = my_new_object, file = rds_file_newfile.path, force_overwrite = TRUE),
    NA
  )
  
  expect_true(file.exists(rds_file_newfile.path))
  
  expect_equal(readRDS(rds_file_newfile.path), my_new_object)
  
})
