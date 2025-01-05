The SAS 2.0 model powers the analysis in the updated project, "Predicting the Stock Market: How Regression Can Be Applied to Achieve a Parsimonious Model," aligning directly with the Predicting the Stock Market 2.0 PowerPoint presentation. The model explores relationships between SPX, the response variable, and six predictor variables: Microsoft (MSFT), EUR/USD, 10-Year Treasury Yield, Tesla (TSLA), Bitcoin, and Gold Futures. Using stepwise regression with AIC/BIC criteria, the final parsimonious model retained five significant predictors and resulted in the multiple regression equation:

SPX = -424.03 + 9.13 * MSFT + 1105.62 * EUR/USD + 159.50 * Ten_Year_Yield - 0.35 * TSLA + 0.51 * Gold_Futures.

This enhanced model achieved an Adjusted R² of 0.9744, up from 0.9664 prior to model refinement, indicating high explanatory power while maintaining parsimony.

Outlier diagnostics identified some small set of observations as significant outliers. This was flagged based on DFFITS, which exceeded the critical threshold of ±0.3333. Other points also exceed Cook’s Distance critical value of 0.89. Removal of these outliers led to significant improvements in residual diagnostics. Post-removal, the histogram of residuals showed a closer alignment to normality, scatter plots exhibited random distribution, and assumptions of normality, independence, and homoscedasticity were satisfied.

The use of Variance Inflation Factors (VIF) confirmed the absence of multi-collinearity, with all predictors showing VIF values well below the threshold of 10. This ensured that the regression coefficients were stable and reliable.

To validate the model, the dataset was split into training and test sets. The Mean-Squared Prediction Error (MSPR = 1027.44) closely matched the Mean Squared Error (MSE = 1452.99) from the training data, confirming the model's robustness and resistance to overfitting. Signs on the parameter estimates remained consistent between the training and test datasets, further supporting the model’s predictive reliability.

This SAS 2.0 analysis highlights the power of stepwise selection, advanced diagnostics, and rigorous validation in creating a nuanced yet interpretable financial forecasting model. By striking a balance between complexity and predictive performance, it provides actionable insights into market behavior.

