# SAS 2.0 Model: Enhanced Stock Market Prediction

The **SAS 2.0 model** serves as the foundation for the updated project, *"Predicting the Stock Market: How Regression Can Be Applied to Achieve a Parsimonious Model."* This analysis is closely aligned with the accompanying *Predicting the Stock Market 2.0* PowerPoint presentation. The model focuses on exploring the relationships between the S&P 500 Index (**SPX**), the response variable, and six carefully chosen predictor variables: **Microsoft (MSFT)**, **EUR/USD exchange rate**, **10-Year Treasury Yield**, **Tesla (TSLA)**, **Bitcoin**, and **Gold Futures**. 

---

## **Stepwise Regression: Methodology and Final Model**

The SAS 2.0 analysis leverages stepwise regression to identify the most significant predictors from the initial set of variables. Stepwise selection combines forward and backward elimination techniques, applying AIC (Akaike Information Criterion) and BIC (Bayesian Information Criterion) to balance model fit and complexity.

### **Key Outcomes:**
- The stepwise process systematically eliminated irrelevant or redundant variables, leaving a refined, parsimonious model with five significant predictors.
- The resulting multiple regression equation is:

$$
\text{SPX} = -424.03 + 9.13 \cdot \text{MSFT} + 1105.62 \cdot \text{EUR/USD} + 159.50 \cdot \text{Ten-Year Yield} - 0.35 \cdot \text{TSLA} + 0.51 \cdot \text{Gold Futures}
$$
  
This equation quantifies how each predictor contributes to changes in the S&P 500 Index.

### **Performance Metrics:**
- The refined model achieved an **Adjusted $$\( R^2 \)$$ of 0.9744**, a notable improvement over the prior model's **Adjusted $$\( R^2 \)$$ of 0.9664**. This indicates that the model explains 97.44% of the variation in the S&P 500 Index, while avoiding unnecessary complexity.
- By focusing on significant predictors, the model maintained simplicity without sacrificing explanatory power, aligning with the principle of parsimony.

---

## **Outlier Diagnostics and Their Impact**

Outliers can distort regression models by introducing bias in parameter estimates and inflating error metrics. To address this, the SAS 2.0 analysis included comprehensive diagnostic techniques to identify and mitigate the influence of outliers.

### **Outlier Identification:**
- **DFFITS Diagnostic**: Observations with DFFITS values exceeding $$\( \pm 0.3333 \)$$ were flagged as significant outliers. These points had a disproportionate impact on the regression results.
- **Cook’s Distance**: Points with Cook’s Distance values greater than $$\( 0.89 \)$$ were identified as influential observations that warranted closer scrutiny.

### **Impact of Outlier Removal:**
- After removing the flagged outliers:
  - The **histogram of residuals** aligned more closely with a normal distribution, suggesting improved adherence to the normality assumption.
  - **Scatter plots** of residuals exhibited a random pattern, indicating that the assumptions of independence and homoscedasticity (constant variance) were satisfied.
- These improvements enhanced the model’s overall reliability and interpretability.

---

## **Addressing Multi-Collinearity**

Multi-collinearity occurs when predictor variables are highly correlated, leading to unstable regression coefficients and reduced interpretability. To assess and mitigate this issue, the SAS 2.0 analysis calculated **Variance Inflation Factors (VIF)** for all predictors.

### **Findings:**
- All predictors had VIF values well below the critical threshold of 10, confirming the absence of significant multi-collinearity.
- This ensured that each predictor contributed unique information to the model and that the regression coefficients were both stable and reliable.

---

## **Validation and Robustness**

Validation is critical to ensure that a model generalizes well to unseen data and avoids overfitting. The dataset was split into training and test sets to evaluate the model's predictive performance.

### **Validation Process:**
- The training set was used to estimate the regression coefficients, while the test set evaluated how well the model performed on new data.
- **Error Metrics**:
  - The **Mean-Squared Prediction Error (MSPR)** for the test set was $$\( 1027.44 \)$$.
  - The **Mean Squared Error (MSE)** for the training set was $$\( 1452.99 \)$$.
  - The close agreement between MSPR and MSE confirmed the model’s robustness and resistance to overfitting.

### **Consistency of Parameter Estimates:**
- The signs of the parameter estimates (positive or negative relationships) remained consistent between the training and test sets. This provided additional evidence of the model's reliability in capturing the underlying relationships between SPX and the predictors.

---

## **Key Takeaways**

The SAS 2.0 analysis demonstrates the power of modern regression techniques in financial forecasting. By integrating stepwise selection, rigorous outlier diagnostics, and robust validation, the analysis produced a model that balances simplicity and predictive performance. 

### **Highlights:**
1. **Parsimonious Model**: The final regression equation retained only the most impactful predictors, ensuring interpretability without sacrificing accuracy.
2. **Improved Diagnostics**: Addressing outliers and verifying assumptions (normality, independence, homoscedasticity) enhanced the model’s validity.
3. **Robust Validation**: The alignment of MSPR and MSE confirmed the model’s generalizability, while consistent parameter estimates reinforced its predictive reliability.

By refining the model to achieve both accuracy and parsimony, the SAS 2.0 analysis provides actionable insights into stock market behavior, showcasing a structured and interpretable approach to financial forecasting.


