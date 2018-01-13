context("Replace the lists in the shot-table ")

test_that("no element is a list",{
  shot <- LIST_OF_TABLE$Shots
  expect_equal(class(shot[,x_co][1]),"list")

 })
