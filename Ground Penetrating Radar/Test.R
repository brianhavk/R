#setwd("C:/Users/braia/OneDrive - INSTITUTO TECNOLOGICO METROPOLITANO - ITM/Programs/R/GPR")

library(RGPR)

data <- readGPR(dsn="Datasets/DAT_0096_A1.rd3")
plot(data)
#ploty(data)

########## Time0 Estimation (step by step) ##########
tfb <- firstBreak(data, w=20, method="coppens", thr=0.05)
plot(pos(data), tfb, pch=20, ylab="first wave break",xlab="position (m)")

t0 <- firstBreakToTime0(tfb, data)
time0(data) <- t0   # set time0
plot(data[, 15], xlim=c(0, 100))  # plot the 15th trace of the GPR-line
abline(v=tfb[15], col="blue")  # first wave break time

########## Time0 Estimation (direct) ##########
data <- estimateTime0(data, w=20, method="coppens", thr=0.05, FUN=mean)
plot(data[, 15], xlim=c(0, 100))  # plot the 15th trace of the GPR-line
abline(v=tfb[15], col="blue")  # first wave break time
