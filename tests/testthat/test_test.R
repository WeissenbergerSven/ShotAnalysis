context("Replace the lists in the shot-table ")

test_that("no element is a list",{
  shot <- LIST_OF_TABLE$Shots
  expect_equal(class(shot[,idShots][1]),"numeric")
  expect_equal(class(shot[,fidShooters][1]),"numeric")
  expect_equal(class(shot[,shot][1]),"integer")
  expect_equal(class(shot[,disktype][1]),"character")
  expect_equal(class(shot[,shottimestamp][1]),c("POSIXct", "POSIXt"))
  expect_equal(class(shot[,x_co][1]),"numeric")
  expect_equal(class(shot[,y_co][1]),"numeric")
  expect_equal(class(shot[,teiler][1]),"numeric")
  expect_equal(class(shot[,winkel][1]),"numeric")
  expect_equal(class(shot[,full][1]),"integer")
  expect_equal(class(shot[,shot][1]),"integer")
  
 })
