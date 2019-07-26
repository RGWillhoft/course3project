# Load data from the UCI HAR Dataset
# RG Willhoft, 2019

library(plyr)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = " ", stringsAsFactors = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors = FALSE)
# TBD - Need to clean these feature names?

# Read training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measurements_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Add variable to activity indicating that this is a "training" activity
activity_train <- cbind("TRAIN", activity_train)
names(activity_train) <- c("set", "activity")

# Read test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measurements_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Add variable to activity indicating that this is a "test" activity
activity_test <- cbind("TEST", activity_test)
names(activity_test) <- c("set", "activity")

# Combine training and test data
subject_data <- rbind(subject_train, subject_test)
measurements_data <- rbind(measurements_train, measurements_test)
activity_data <- rbind(activity_train, activity_test)

# Give it some good names
names(subject_data) <- c("subject")

names(measurements_data) <- features[,2]
means_std_data <- measurements_data[,grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", names(measurements_data), value = TRUE)]
names(means_std_data) <- sub("-[Mm]ean\\(\\)", "Mean", names(means_std_data))
names(means_std_data) <- sub("-[Ss]td\\(\\)", "Std", names(means_std_data))
names(means_std_data) <- sub("\\(\\)", "", names(means_std_data))
names(means_std_data) <- sub("-", "", names(means_std_data))
names(means_std_data) <- sub("BodyBody", "Body", names(means_std_data))

# Put in the activity descriptions
activity_data <- mutate(activity_data, activity = activity_labels[activity,2])

# Make into one dataset
data <- cbind(activity_data, subject_data, means_std_data)

data$set <- as.factor(data$set)
data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)

