#setwd("C:/Users/braia/OneDrive - INSTITUTO TECNOLOGICO METROPOLITANO - ITM/Programs/R/GPR")

library(RGPR)

data <- readGPR(dsn="LINE00.DT1")
plot(data)