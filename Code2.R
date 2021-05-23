#### 5.	(20 points) Partial least squares was used to model the yield of a chemical manufacturing process (Sect. 1.4). The data can be found in the AppliedPredictiveModeling package and can be loaded.

###The objective of this analysis is to find the number of PLS components that yields the optimal R2 value. PLS models with 1 through 10 components were each evaluated using five repeats of 10-fold cross-validation

PLS finds components that summarize the variation of the predictors while simultaneously
requiring these components to have maximum correlation with the response. PLS is a compromise between the objectives of predictor space dimension reduction and a predictive relationship with the response. PLS can be viewed as a supervised dimension reduction procedure;
PCR is an unsupervised procedure	

if 10-fold cross-validation was repeated five times, 50 different held-out sets would be
used to estimate model efficacy
```{r}
library(AppliedPredictiveModeling)
data(ChemicalManufacturingProcess)
```



###a.	Using the "one-standard error" method, what number of PLS components provides the most parsimonious model?

if two predictors are highly correlated, this implies that they are measuring the same underlying information. 
Removing one should not compromise the performance of the model and might lead to a more precise and interpretable model.

one-standard error of RMSE
```{r}
#A parsimonious model is a model that has the highest level of explanation/prediction with as few predictor variables (x) as possible. 
#The One Standard Error Rule can be used to compare models with different numbers of parameters in order to select the most parsimonious model with low error.
#To use, find model with minimum error, then select the simplest model whose mean falls within 1 standard deviation of the minimum




library(AppliedPredictiveModeling)
data(ChemicalManufacturingProcess)
library(caret)
chemical.df <- data.frame(ChemicalManufacturingProcess)
chemical.ZeroVar <- nearZeroVar(fingerprints.df, names = TRUE)
predictors <- dim(chemical.df)[2] - length(chemical.ZeroVar)
dat<-chemical.df
dat <- gamSim(1,n=400,dist="normal",scale=2)
b <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat,method="REML")
b
## only the first 3 smoothing parameters are candidates for
## increasing here...
V <- sp.vcov(b)[1:3,1:3] ## the approx cov matrix of sps
d <- diag(V)^.5          ## sp se.
## compute the log smoothing parameter step...
d <- sqrt(2*length(d))/d
sp <- b$sp ## extract original sp estimates
sp[1:3] <- sp[1:3]*exp(d) ## apply the step
## refit with the increased smoothing parameters...
b1 <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat,method="REML",sp=sp)
b;b1 ## compare fits






```



####b.	Compute the tolerance values for this example. If a 10 % loss in R2 is acceptable, then what is the optimal number of PLS components?
```{r}


##CODE






```
###c.	Several other models with varying degrees of complexity were trained and tuned and the results are presented in Figure below. 
If the goal is to select the model that optimizes R2, then which model(s) would you choose, and why?
  
  ```{r}
###CODE


install.packages("pls")
library(pls)
library(caret)




```


d.	Prediction time, as well as model complexity are other factors to consider when selecting the optimal model(s).
Given each model's prediction time, model complexity, and R2 estimates, which model(s) would you choose, and why?
  
  ```{r}

###CODE





```

library(AppliedPredictiveModeling)
data(ChemicalManufacturingProcess)
library(caret)
chemical.df <- data.frame(ChemicalManufacturingProcess)
chemical.ZeroVar <- nearZeroVar(fingerprints.df, names = TRUE)
predictors <- dim(chemical.df)[2] - length(chemical.ZeroVar)