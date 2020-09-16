% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linreg.R
\name{linreg}
\alias{linreg}
\title{Linear Regression}
\usage{
linreg(formula, data, qr_method = FALSE, ...)
}
\arguments{
\item{formula}{an object of class "formula" (or one that can be coerced to that class):
a symbolic description of the model to be fitted. The details of model specification are
given under ‘Details’.}

\item{data}{a data frame containing the variables in the model}

\item{qr_method}{a boolean; TRUE forces linreg to use QR decomposition for the regression}

\item{...}{additional arguments to be passed to the \code{model.matrix} function, see 'Details'}
}
\value{
lm returns an object of class "linreg".
The function summary prints a summary table of the results. The generic accessor functions
coefficients, effects, fitted.values and residuals extract various useful features of the
value returned by linreg.
An object of class "linreg" is a list containing at least the following components:
\item{call}{the matched call}
\item{coefficients}{a named vector of coefficients}
\item{fitted_values}{the fitted mean values}
\item{residuals}{the residuals, that is response minus fitted values}
\item{df}{the residual degrees of freedom}
\item{residual_variance}{estimated value of the variance of the residuals}
\item{t_values}{t-statistics of the independent variables, that is coefficients/standard-error}
\item{p_values}{p-values for the two-sided t-test with null that coefficients are each zero}
}
\description{
The 'linreg' function allows for the linear regression of a dependent variable on
a set of independent variables and see regression coefficients, residuals, and other statistics
}
\details{
Models for \code{linreg} are specified symbolically. A typical model has the form \code{response ~ terms} 
where response is the (numeric) response vector and terms is a series of terms which specifies a 
linear predictor for response. A terms specification of the form \code{first + second} indicates
all the terms in first together with all the terms in second with duplicate terms removed. Specifications
of the form \code{first:second} or \code{first*second} are recognised exactly the same way as 
\code{first+second}. Additional arguments passed via ..., if provided, will force the linear model will have no intercept.
}
\examples{
data("iris")
linreg(Petal.Length ~ Species, iris)
}
\references{
\href{https://en.wikipedia.org/wiki/Linear_regression}{Linear Regression}
\href{https://en.wikipedia.org/wiki/QR_decomposition}{QR decomposition of a Matrix}
\href{https://genomicsclass.github.io/book/pages/qr_and_regression.html}{Linear Regression with QR decomposition}
}