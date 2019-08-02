# Peer-graded Assignment: 
# Getting and Cleaning Data Course Project
# RG Willhoft, 2019

library(dplyr)

# Load data from the UCI HAR Dataset

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = " ", stringsAsFactors = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors = FALSE)

# Read training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measurements_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Add variable to activity indicating that this is a "training" activity
#   Since the activities are in upper case, I decided to use an uppercase
#   string for TRAIN (the training set) and TEST (the test set)
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

# Give the data names
names(subject_data) <- c("subject")
names(measurements_data) <- features[,2]

# Select only the measurements that are means or standard deviations (std)
#   There were some measurements that were calculations done with means (such as
#   "angle(tBodyGyroMean,gravityMean)"), it was decided that these did not fit the 
#   specification and were not included.
means_std_data <- measurements_data[,grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", names(measurements_data), value = TRUE)]
# Clean up the measurements (variable) names
#   It was decided to leave the names in camal-case to make it easier to read the names
#   The dashes ("-" and parentheses ("(" and ")" were removed - leaving these in makes it much
#   harder when using tools suchs as plyr and dplyr
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

# Create data set with means

data_means <- data %>%
  select(-set) %>%                  # Remove the information on TRAINING or TEST
  group_by(activity, subject) %>%   
  summarize_all(mean)

# The following code will create separate means for the training and test data
# data_means <- data %>%
#   group_by(set, activity, subject) %>%   
#   summarize_all(mean)

# Write two data sets to files

save( data, file = "analysis_data.Rda")
save( data_means, file = "analysis_data_means.Rda")
