# RTB marketing strategy 
## Coding 

- CTR prediction
    - Data preparation
        1) Preprocessing
        2) Split ??????????????????????
    - Model Fitting
        1) logistic regression 
    - Prediction
    - Evaluation ??????????????????????
    - Interpretion : Logit.R file
        1) coefficient 
        2) whatever logistic interpretion
    - save 
        * Fitted values are saved in Output
        
<br>

- Return 1 
    - Data preparation
        1) Weight on Conversion based on Goal
        2) X (Web visit, Collateral view, Product view, Form complete)
        3) Y ($\alpha$ Web visit + $\beta$ collateral view + $\gamma$ product view + $\delta$ Form complete)
    - Fit model : weighted sum model
        * *This is just multi-criteria decision making (simple linear combination)*
    - save
        * Fitted values are saved in Output
    
<br> 

- Return 2 
    - Data preparation
        1) Aggregation per duration as X (Video completes, Social likes, Social shares)
        2) Y : CTR on dates or <u>sum of conversion</u>
    - Model Fitting
        1) linear regression (Return2.R)
    - Interpretion
        1) fixed effect!  (gen penal data is advance param.)
        2) coefficient 
        3) whatever we could do
    - save
        * Fitted values are saved in Output
        
<br>

- Optimization
    - load all components from Output folder
    - linear programming
        - winning function * CTR prediction * (R1 + R2)
        - limited budget plan
    - Marketing Strategy 
    
## Presentation : Interpretion focused.
1. Problem statement (2m)
2. Data explanation and preprocessing (2m)
3. CTR prediction (5m)  **logistic interpretion**
5. Return 2 (5m)  **regression interpretion**
4. Return 1 (2m)
6.  Optimization (2m) Briefly 
7. Marketing strategy (2m) 

## requirements
- gurobi
- pickle
