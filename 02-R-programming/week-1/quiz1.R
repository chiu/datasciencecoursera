# question 8 2016
x <- list(2, "a", "b", TRUE)



some_data <- read.csv("hw1_data.csv", header=TRUE)
first_2_rows <- some_data[1:2,]
first_2_rows

#new question 14
last_2_rows <- tail(some_data)
print(last_2_rows)
# question 15
row_47 <- some_data[47,]
print(row_47)


#question 16 how many missing values are in ozone
ozone_column <- some_data$Ozone
print(ozone_column)
num_na_ozone <- length(which(is.na(ozone_column)))

#question 17

mean_ozone <- mean(na.omit(ozone_column))

# Question 18
library(data.table)
some_data_table <- data.table(some_data)
# special_ozone <- some_data_table[,.(solar_mean = mean(Solar.R)), by = .(Ozone > 31 & Temp > 90)]
# trial_2 <- subset(some_data, Ozone > 31 & Temp > 90, select=Solar.R)
# trial_2

trial_3 <- subset(some_data_table, subset=Ozone>31 & Temp > 90, select=Solar.R)
answer_q18 <- mean(trial_3$Solar.R)

#Question 19 mean of temp when month is 6
answer_19 <- subset(some_data_table, subset = Month == 6 )
answer_19_2 <- mean(answer_19$Temp)

#Question 20
answer_20 <- subset(some_data_table, subset = Month == 5)

#answer
answer_20_2 <- max(answer_20$Ozone,na.rm=TRUE)
