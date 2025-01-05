The SAS code drives the analysis in the project "Predicting the Stock Market: How Regression Can Be Applied to Achieve a Parsimonious Model," focusing on predicting the SPX index using seven predictors: Bitcoin, EUR/USD, 10-Year Treasury Yield, Microsoft, Tesla, ES Futures, and Gold Futures. Through stepwise regression, the model systematically included variables with p-values below 0.15 and excluded those above 0.30, leading to a final model with EUR/USD and ES Futures as the most significant predictors. This approach balanced simplicity and predictive power, yielding an exceptional Adjusted R² of 0.9999.

Outliers were carefully addressed through influential diagnostics. Observation 180 was identified as an outlier across multiple measures: a Studentized Residual of -25.8227 (far exceeding the critical value of ±3.7461), a DFFITS value of -0.49129 (beyond its threshold of ±0.2357), and a Cook's D value that remained below its critical threshold of 0.7912. Removing this outlier significantly improved the model's residual diagnostics. Post-removal, residuals followed a random scatter pattern, the histogram showed near-normal distribution, and residual assumptions, including normality, independence, and constant variance, were satisfied.

Multi-collinearity was evaluated using Variance Inflation Factors (VIF), with all predictors showing values well below the critical threshold of 10, confirming that no linear dependence existed among the variables. This ensured robust and reliable coefficient estimates.

The final regression equation, SPX = 150.48 - 103.20 * EUR/USD + 0.995 * ES Futures, was validated by splitting the data into training and test sets. Both subsets retained similar parameter estimates and Adjusted R² values, confirming the model's robustness and resistance to overfitting. By addressing outliers, leveraging stepwise selection, and rigorously checking influential diagnostics and multi-collinearity, this project successfully transformed complex financial data into a parsimonious yet highly accurate predictive model, demonstrating the power of statistical techniques for market forecasting.






