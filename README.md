# Portfolio Management System
This portoflio management system aims to manage risk by using following methodologies:

-**Efficient Frontier using simulated portfolios**

-**Hierarchial Risk Parity**

-**Risk Neutral Portfolio against S&P500**

## Initial extraction of data, data cleaning and preperation
1.Select five random US stocks: **{BYD, S, KO, ELF, COCO}** and benchmark: **S&P500**

2.Download the data (Aug 21 to Aug 23) from YahooFinance (BYD.csv, KO.csv...)
   
3.Extract the closing price columns from each of the dataset

4.Merge the dataset into one 

5.Calculate simple/log returns

6.Calculate the variance covariance matrix and continue with following methodologies

# Findings
## Efficient Frontier using Simulated Portfolios
**Parameters for portfolio at maximum sharpe ratio:**
|                    | BYD    | COCO   | ELF    | KO     | S     |
|--------------------|--------|--------|--------|--------|-------|
| Weight allocation: | 10.24% | 10.38% | 57.83% | 20.78% | 0.78% |

|                        |       |
|------------------------|-------|
| Number of Portfolios:  | 500   |
| Risk Free Rate:        | 4.27% |
| Annualized Return:     | 85%   |
| Annualized Volatility: | 31%   |




![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/84bf182a-81c6-4bae-b2b7-ac0855266edd)


## Risk Neutral Portfolio against S&P500
Calculating risk neutral portfolio using **cvxpy optimizer** by creating a setup of minimization that the sum of the constituents (weighted) betas must add up to 0, in order to achieve market neutrality.

Formula to calculate the **beta**:
$$\beta_{spxprice,i} = \sigma_{i, spxprice} / \sigma_{spxprice}^2$$

![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/9e1446e8-6b9c-4825-8246-31263c82829e)

![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/07fbb80b-9a40-4e3c-8932-d31ea9e328e5)

## Risk Parity
**Weight allocation**:


 BYD        | COCO       | ELF        | KO       | S          
------------|------------|------------|----------|------------
 0.17191521 | 0.13620398 | 0.14523945 | 0.459502 | 0.08713936 


**Portfolio (ex-ante) annualized volatility is: 5.13%**

**Single constituent's volatility is: 1.71%**

## File reference
BYD, KO, S, ELF, COCO.csv - raw datasets

Efficient_Frontier_using_Simulated_Portfolios.ipynb - Efficient Frontier methodology

Risk Parity.ipynb - Risk Parity methodology

Risk Neutral Portfolio.ipynb - Risk Neutral methodology using cvxpy optimizer

Special thanks for @FilippoGuerrieri26 for providing cvxpy optimizer setup template

