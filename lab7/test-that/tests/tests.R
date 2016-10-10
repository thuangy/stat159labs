# load the source code of the functions to be tested
source("../functions/range-value.R")

# context with one test that groups expectations
context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(range_value(x), 4)
  expect_length(range_value(x), 1)
  expect_type(range_value(x), 'double')
})

test_that("range works with NA values", {
  y <- c(1, 2, 3, 4, NA)
  expect_equal(range_value(y), NA_real_)
  expect_length(range_value(y), 1)
  expect_equal(range_value(y, na.rm=TRUE), 3)
  expect_length(range_value(y, na.rm=TRUE), 1)
})

test_that("range works with boolean values", {
  z <- c(TRUE, FALSE, TRUE)
  expect_equal(range_value(z), 1L)
  expect_length(range_value(z), 1)
  expect_type(range_value(z), 'integer')
})

test_that("range fails with array of characters", {
  w <- letters[1:5]
  expect_error(range_value(w))
})


# load source code for missing-values function
source("../functions/missing-values.R")

context("Test for missing value")

test_that("missing value has output of length 1", {
  a = c(1, 2, 3)
  b = c(1, 2, NA)
  expect_length(missing_values(a), 1)
  expect_length(missing_values(b), 1)
})

test_that("missing value output has type integer", {
  a = c(1, 2, 3)
  b = c(1, 2, NA)
  expect_type(missing_values(a), 'integer')
  expect_type(missing_values(b), 'integer')
})

test_that("missing value output is always greater than or equal to 0", {
  a = c(1, 2, 3)
  b = c(NA, NA, NA)
  expect_gte(missing_values(a), 0)
  expect_gte(missing_values(b), 0)
})

