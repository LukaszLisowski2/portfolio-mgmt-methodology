# Portfolio Management System
This portoflio management system aims to manage risk by using following methodologies:

-**Efficient Frontier using simulated portfolios**

-**Hierarchial Risk Parity**

-**Risk Neutral Portfolio against S&P500**

## Initial extraction of data, data cleaning and preperation
1.Select five random US stocks: {BYD, S, KO, ELF, COCO}

2.Download the data from YahooFinance (BYD.csv, KO.csv...) Dataset: August 2021 - August 2023
   
3.Extract the closing price columns from each of the dataset

4.Merge the dataset into one 

5.Calculate simple/log returns

6.Calculate the variance covariance matrix and continue with following methodologies

# Findings
## Efficient Frontier using Simulated Portfolios
**Parameters for portfolio at maximum sharpe ratio:**

Weight allocation: BYD - 10.24%, COCO - 10.38%, ELF - 57.83%, KO - 20.78%, S - 0.78%

Number of Portfolios:500

Risk Free Rate: 4.27% based on 10Y treasury yield
 
Annualized Return: 85%

Annualized Volatility: 31%

![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/84bf182a-81c6-4bae-b2b7-ac0855266edd)


## Risk Neutral Portfolio against S&P500
Calculating risk neutral portfolio using **cvxpy optimizer** by creating a setup of minimization that the sum of the constituents (weighted) betas must add up to 0, in order to achieve market neutrality.

Formula to calculate the beta:
$$\beta_{spxprice,i} = \sigma_{i, spxprice} / \sigma_{spxprice}^2$$

![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/9e1446e8-6b9c-4825-8246-31263c82829e)

![image](https://github.com/LukaszLisowski2/MyProjects/assets/78934435/07fbb80b-9a40-4e3c-8932-d31ea9e328e5)

## Risk Parity
Weight allocation:
BYD - 0.17191521, COCO - 0.13620398, ELF - 0.14523945, KO - 0.459502, S - 0.08713936


