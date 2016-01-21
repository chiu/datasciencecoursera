source('complete.R')
# # 
# # print("q5")
# # cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
# # print(cc$nobs)
# # 
# # print("q6 :What value is printed at end of the following code?")
# # 
# # cc <- complete("specdata", 54)
# # print(cc$nobs)
# # 
# # print("q7 :")
# # set.seed(42)
# # cc <- complete("specdata", 332:1)
# # use <- sample(332, 10)
# # print(cc[use, "nobs"])
# # 
# # #cleaer workspace
# # rm(list = ls())
# # 
# # source("corr.R")
# # cr <- corr("specdata")                
# # cr <- sort(cr)                
# # set.seed(868)                
# # out <- round(cr[sample(length(cr), 5)], 4)
# # print(out)
# # 
# print("q9")
# cr <- corr("specdata", 129)                
# cr <- sort(cr)                
# n <- length(cr)                
# set.seed(197)                
# out <- c(n, round(cr[sample(n, 5)], 4))
# print(out)
# 
# print("q10")
# cr <- corr("specdata", 2000)                
# n <- length(cr)                
# cr <- corr("specdata", 1000)                
# cr <- sort(cr)
# print(c(n, round(cr, 4)))

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
cc <- as.data.frame.matrix(cc)
cc[use, "nobs"]

