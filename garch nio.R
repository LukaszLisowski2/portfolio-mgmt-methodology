library(quantmod)
library(xts)
library(PerformanceAnalytics)
library(rugarch)

getSymbols("NIO",
           from = "2020-10-28",
           to = "2021-10-28")
returns <- CalculateReturns(NIO$NIO.Close)
returns[-1]
hist(returns)
chartSeries(returns, theme = 'white')



sd(return)
sqrt(252)* sd(returns["2021"])

chart.RollingPerformance(R = returns["2021-10-28::2021-10-28"],
                         width = 4,
                         FUN = "sd.annualized",
                         scale = 252,
                         main = "NIO's monthly rolling volatility")

spec2 <- ugarchspec(mean.model=list(armaOrder=c(0,0)), 
                    variance.model = list(model = "sGARCH"),  
                    distribution.model = "norm")
accurate_returns = na.omit(returns)
model <- ugarchfit(spec = spec2, data = accurate_returns)
model

specfinal <- spec2
setfixed(specfinal) <- as.list(coef(model))


forecast2020 <- ugarchforecast(data = accurate_returns["/2020-06"],
                               fitORspec = specfinal,
                               n.ahead = 252)
forecast2021 <- ugarchforecast(data = accurate_returns["/2021-10"],
                               fitORspec = specfinal,
                               n.ahead = 252)
par(mfrow = c(2,1))
plot(sigma(forecast2020))
plot(sigma(forecast2021))


sim <- ugarchpath(spec = specfinal,
                  m.sim = 5,
                  n.sim = 1*252,
                  rseed = 123)                               

plot.zoo(fitted(sim))
plot.zoo(sigma(sim))


pricesforecast <- 39.31*apply(fitted(sim), 2, 'cumsum') + 39.31
matplot(pricesforecast, type = 'l', lwd = 3)
