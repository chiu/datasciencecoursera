some_data <- read.csv("hw1_data.csv", header=TRUE)
first_2_rows <- some_data[1:2,]
first_2_rows

# question 15
row_47 <- some_data[47,]
print(row_47)


#question 16 how many missing values are in ozone
ozone_column <- some_data$Ozone
print(ozone_column)
num_na_ozone <- length(which(is.na(ozone_column)))

#question 17

mean