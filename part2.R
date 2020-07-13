library(datasets)
toothdata <- ToothGrowth
str(toothdata)
head(toothdata)
tail(toothdata)

toothdata$dose <- as.factor(toothdata$dose)
g1 <- ggplot(toothdata, aes(x=dose, y=len,fill=dose)) +  geom_boxplot() + facet_grid(.~ supp) 
g1 <- g1 + labs(title = "Tooth Growth by Dose", x = "Dose", y = "Tooth Growth")
g1

g2 <- ggplot(toothdata, aes(x=supp, y=len,fill = supp)) +  geom_boxplot() 
g2 <- g2 + labs(title = "Tooth Growth by Supp", x = "Supp", y = "Tooth Growth")
g2


VC_data <- subset(toothdata, supp == "VC")
VC_mean <- tapply(VC_data$len, VC_data$dose, mean) 
VC_var <- tapply(VC_data$len, VC_data$dose, var)
VC_sd <- tapply(VC_data$len, VC_data$dose, sd)

OJ_data <- subset(toothdata, supp == "OJ")
OJ_mean <- tapply(OJ_data$len, OJ_data$dose, mean)
OJ_var <- tapply(OJ_data$len, OJ_data$dose, var) 
OJ_sd <- tapply(OJ_data$len, OJ_data$dose, sd) 
