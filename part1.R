## Part 1:
n <- 40 # sample size
lambda <- 0.2 # lambda for rexp 
times <- 1000 # number of simulations
quantile <- 1.96 # 95th % quantile to be used in Confidence Interval
set.seed(1) # set the seed value for reproducibility
Data <- matrix(rexp(n * times, rate = lambda), times)
Datamean <- rowMeans(Data) ## get the row mean of the matrix
samplemean <- mean(Datamean) ## get the mean value of the 1000 simulations
samplemean
theomean <- 1 / lambda 
theomean
samplevar <- var(Datamean)
samplevar
theovar  <- (1 / lambda)^2 / (n) 
theovar
disdata <- as.data.frame(Datamean)
library(ggplot2)
g <- ggplot(disdata, aes(x =Datamean))
g <- g + geom_histogram(aes(y=..density..), colour="black", fill = "light grey")
g <- g + labs(title = "Distribution of Simulation Samplemean", x = "Meanvalue of 1000 simulations", y = "Density")
g <- g + ylim(0, 0.6)
g <- g + geom_vline(aes(xintercept = samplemean, colour = "blue"))
g <- g + geom_vline(aes(xintercept = theomean, colour = "red"))
g <- g + stat_function(fun = dnorm, args = list(mean = samplemean, sd = sqrt(samplevar)), color = "blue", size = 1.0)
g <- g + stat_function(fun = dnorm, args = list(mean = theomean, sd = sqrt(theovar)), colour = "red", size = 1.0)
g

## Part 2
library(datasets)
toothdata <- ToothGrowth