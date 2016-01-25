library(datasets)
library(data.table)
data(iris)

iris_dt <- data.table(iris)

# q1
mean(iris_dt$Sepal.Length)

# q2
apply(iris[, 1:4], 2, mean)

# q3
data(mtcars)

q4 <- sapply(split(mtcars$hp, mtcars$cyl), mean)
abs_hp_diff <-  q4['8'] - q4['4']