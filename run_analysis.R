# The purpose of this script is to take data collected from the accelerometers 
# from the Samsung Galaxy S smartphone and aggregate the data into a comprehensive, tidy 
# data set.

# Call needed libraries
library(dplyr)
library(utils)

# Set working directory
wd <- "C:/Users/charles.a.breeden/OneDrive - Accenture/Personal/Coursera/Getting Cleaning Data"
setwd(wd)

# Get the activity labels; associate an ID for each
activity <- read.csv("activity_labels.txt", header = FALSE, col.names = c("activity"))
activity$id <- seq.int(nrow(activity))

# Get the x, y and subject test tables
xtest <- read.delim2("X_test.txt", header = FALSE, sep = "", colClasses = "character")
ytest <- read.delim2("y_test.txt", header = FALSE, sep = "", colClasses = "numeric")
stest <- read.delim2("subject_test.txt", header = FALSE, sep = "", colClasses = "numeric")

# Convert x-values for test from character to numeric
for(i in 1:ncol(xtest)) {
     xtest[, i] <- as.numeric(xtest[, i])
}

# Get the x- and y-training tables
xtrain <- read.delim2("X_train.txt", header = FALSE, sep = "", colClasses = "character")
ytrain <- read.delim2("y_train.txt", header = FALSE, sep = "", colClasses = "numeric")
strain <- read.delim2("subject_train.txt", header = FALSE, sep = "", colClasses = "numeric")

# Convert x-values for training from character to numeric
for(i in 1:ncol(xtrain)) {
     xtrain[, i] <- as.numeric(xtrain[, i])
}

# Get the column names and create column filters for mean and std
mynames <- read.delim("features.txt", sep = "", header = FALSE, col.names = c("id", "feature"))
filter1 <- grep("mean()", mynames[, 2], fixed = TRUE)
filter2 <- grep("std()", mynames[, 2], fixed = TRUE)
filter <- sort(append(filter1, filter2))

# Combine the x-value test and training datasets and keep mean and std columns
xval <- rbind(xtest, xtrain)
xval2 <- xval[, filter]

# Combine the y-value test and training datasets and combine result into final dataset
yval <- rbind(ytest, ytrain)
yval <- merge(yval, activity, by.x = "V1", by.y = "id", sort = FALSE)
yval <- mutate(yval, V1 = NULL)

# Combine the subject test and training datasets 
sval <- rbind(stest, strain)

# Combine x-value, y-value and subject results into final dataset
finaldf <- cbind(sval, yval, xval2)
cnames <- append(c("subjectid", "activityid"), as.vector(mynames[filter, 2]))
names(finaldf) <- cnames
write.csv(finaldf, "finaldf.csv")

# Create an independent tidy data set with the average of each variable for each 
# activity and subject
summdf <- finaldf %>% group_by(subjectid, activityid) %>% summarize_all(funs(mean))
write.csv(summdf, "summdf.csv")