#' @title S3 generic
#' @param linreg_obj an object
#' @param data another object
#' @export

# generic
pred <- function(linreg_obj, data) {UseMethod("pred")}

#' @title Predict Response using \code{linreg} Model
#' @description An S3 function to return modelled response values from observations of 
#' independent variables using a \code{linreg} model
#' @param linreg_obj an object of class \code{linreg}
#' @param data set to NULL by default, returning values fitted by the model on the training dataset;
#' when a non-trivial dataset is provided as input that is similar to the training dataset, the function
#' returns predicted response values for the input
#' @return a vector containing the modelled response values
#' @export

# s3 method
pred.linreg <- function(linreg_obj, data = NULL) {
  
  # if no data is provided for prediction, simply return training predictions (fitted values)
  if (is.null(data)) {return(linreg_obj$fitted_values)}
  
  # check class of data input
  if (class(data) != "data.frame") stop("Data must be input in the data.frame format")
  
  # check all required variables are available for prediction
  if (!all(linreg_obj$all_vars[-1] %in% colnames(data))) {
    stop("Data for prediction must have all the predictors in the model")
  }
  
  # check if independent variables (viz. all_vars[-1]) are neither numeric nor factor, if so print an error message
  indep_var_classes <- sapply(linreg_obj$all_vars[-1], function(x) {class(data[, x])})
  indep_var_classes_unique <- unique(indep_var_classes)
  
  if(!all(indep_var_classes %in% c("factor", "numeric", "single", "double"))) {
    stop("Independent variables can only either be numeric or factor types")
  }
  
  # extract independent variables, viz. all_vars[-1]
  X <- data[, linreg_obj$all_vars[-1], drop=FALSE]
  
  # get design matrix
  add_intercept <- names(linreg_obj$coefficients[1]) == "(Intercept)"
  factor_indep_vars <- names(indep_var_classes[indep_var_classes == "factor"])
  X <- model.matrix(X, factor_indep_vars, add_intercept)
  
  # return predictions
  return(as.vector(X %*% linreg_obj$coefficients))
  
  }