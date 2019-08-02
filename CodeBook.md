# Human Activity Recognition Using Smartphones Dataset

## Tidy Data Sets for Measurement Means and Standard Deviations

RG Willhoft

August 1, 2019

---

# Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# Data Sets

The following two data sets are created by the `run_analysis.R` program.

## `data` data set

This data set provides the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.

There are 10299 observations in the data set, 7352 from the traning set and 2947 from the test set. The variables within this data set are described below.

### [,1] - set variable

The `set` variable indicates if the observation is from the training or test data set:

- TRAIN - training set
- TEST - test set

### [,2] - activity variable

The `activity` variable indicates the action that the volunteer was doing during this observation. The values are:

- WALKING
- WALKING\_UPSTAIRS
- WALKING\_DOWNSTAIRS
- SITTING
- STANDING 
- LAYING

### [,3] - subject variable

The `subject` is a numerical indication (1-30) of the volunteer performating the activity.

### Measurement Data

The variable names are based heavily on the original data. The following can help in determining the various values:

- Domain
  - t - time domain
  - f - frequency domain
- Measurement Object
  - Body - measurements of the subject's body
  - Gravity - measurements of the environment
- Measurement Device
  - Acc - Accelerameter
  - Gyro - Gyroscope
  - Mag - Magnetic compass
- Measurement Type
  - (no indication) - Velocity
  - Acc - Acceration
  - Jerk - Jerk (dAcceration/dt)
- Summary
  - Mean - Mean of measurements
  - Std - Standard deviation of measurements
- Direction (if applicable)

| column(s) |                      | measurement(s)     |                    | 
| --------- | -------------------- | ------------------ | ------------------ | 
| [,4:6]    | tBodyAccMeanX        | tBodyAccMeanY      | tBodyAccMeanZ      |
| [,7:9]    | tBodyAccStdX         | tBodyAccStdY       | tBodyAccStdZ       |
| [,10:12]  | tGravityAccMeanX     | tGravityAccMeanY   | tGravityAccMeanZ   |
| [,13:15]  | tGravityAccStdX      | tGravityAccStdY    | tGravityAccStdZ    | 
| [,16:18]  | tBodyAccJerkMeanX    | tBodyAccJerkMeanY  | tBodyAccJerkMeanZ  |    
| [,19:21]  | tBodyAccJerkStdX     | tBodyAccJerkStdY   | tBodyAccJerkStdZ   |     
| [,22:24]  | tBodyGyroMeanX       | tBodyGyroMeanY     | tBodyGyroMeanZ     |      
| [,25:27]  | tBodyGyroStdX        | tBodyGyroStdY      | tBodyGyroStdZ      |        
| [,28:30]  | tBodyGyroJerkMeanX   | tBodyGyroJerkMeanY | tBodyGyroJerkMeanZ |   
| [,31:33]  | tBodyGyroJerkStdX    | tBodyGyroJerkStdY  | tBodyGyroJerkStdZ  |    
| [,34]     | tBodyAccMagMean      |
| [,35]     | tBodyAccMagStd       |
| [,36]     | tGravityAccMagMean   |
| [,37]     | tGravityAccMagStd    |
| [,38]     | tBodyAccJerkMagMean  | 
| [,39]     | tBodyAccJerkMagStd   | 
| [,40]     | tBodyGyroMagMean     |
| [,41]     | tBodyGyroMagStd      |
| [,42]     | tBodyGyroJerkMagMean | 
| [,43]     | tBodyGyroJerkMagStd  |  
| [,44:46]  | fBodyAccMeanX        | fBodyAccMeanY      | fBodyAccMeanZ      |
| [,47:49]  | fBodyAccStdX         | fBodyAccStdY       | fBodyAccStdZ       |
| [,50:52]  | fBodyAccJerkMeanX    | fBodyAccJerkMeanY  | fBodyAccJerkMeanZ  |
| [,53:55]  | fBodyAccJerkStdX     | fBodyAccJerkStdY   | fBodyAccJerkStdZ   |
| [,56:58]  | fBodyGyroMeanX       | fBodyGyroMeanY     | fBodyGyroMeanZ     |        
| [,59:61]  | fBodyGyroStdX        | fBodyGyroStdY      | fBodyGyroStdZ      |     
| [,62]     | fBodyAccMagMean      |
| [,63]     | fBodyAccMagStd       |
| [,64]     | fBodyAccJerkMagMean  | 
| [,65]     | fBodyAccJerkMagStd   |
| [,66]     | fBodyGyroMagMean     | 
| [,67]     | fBodyGyroMagStd      |
| [,68]     | fBodyGyroJerkMagMean |
| [,69]     | fBodyGyroJerkMagStd  |

## `data_means` data set

The `data_means` is an independent tidy data set with the mean of each variable for each activity and each subject. There are 180 observations, 6 activities for each of the 30 volunteers. The data is very similar to the `data` data set, but without the `set` variable. The table below summarizes it:

| column(s) |                      | measurement(s)     |                    | 
| --------- | -------------------- | ------------------ | ------------------ | 
| [,1]      | activity             |
| [,2]      | subject              |
| [,2:5]    | tBodyAccMeanX        | tBodyAccMeanY      | tBodyAccMeanZ      |
| [,6:8]    | tBodyAccStdX         | tBodyAccStdY       | tBodyAccStdZ       |
| [,9:11]   | tGravityAccMeanX     | tGravityAccMeanY   | tGravityAccMeanZ   |
| [,12:14]  | tGravityAccStdX      | tGravityAccStdY    | tGravityAccStdZ    | 
| [,15:17]  | tBodyAccJerkMeanX    | tBodyAccJerkMeanY  | tBodyAccJerkMeanZ  |    
| [,18:20]  | tBodyAccJerkStdX     | tBodyAccJerkStdY   | tBodyAccJerkStdZ   |     
| [,21:23]  | tBodyGyroMeanX       | tBodyGyroMeanY     | tBodyGyroMeanZ     |      
| [,24:26]  | tBodyGyroStdX        | tBodyGyroStdY      | tBodyGyroStdZ      |        
| [,27:29]  | tBodyGyroJerkMeanX   | tBodyGyroJerkMeanY | tBodyGyroJerkMeanZ |   
| [,30:32]  | tBodyGyroJerkStdX    | tBodyGyroJerkStdY  | tBodyGyroJerkStdZ  |    
| [,33]     | tBodyAccMagMean      |
| [,34]     | tBodyAccMagStd       |
| [,35]     | tGravityAccMagMean   |
| [,36]     | tGravityAccMagStd    |
| [,37]     | tBodyAccJerkMagMean  | 
| [,38]     | tBodyAccJerkMagStd   | 
| [,39]     | tBodyGyroMagMean     |
| [,40]     | tBodyGyroMagStd      |
| [,41]     | tBodyGyroJerkMagMean | 
| [,42]     | tBodyGyroJerkMagStd  |  
| [,43:45]  | fBodyAccMeanX        | fBodyAccMeanY      | fBodyAccMeanZ      |
| [,46:48]  | fBodyAccStdX         | fBodyAccStdY       | fBodyAccStdZ       |
| [,49:51]  | fBodyAccJerkMeanX    | fBodyAccJerkMeanY  | fBodyAccJerkMeanZ  |
| [,52:54]  | fBodyAccJerkStdX     | fBodyAccJerkStdY   | fBodyAccJerkStdZ   |
| [,55:57]  | fBodyGyroMeanX       | fBodyGyroMeanY     | fBodyGyroMeanZ     |        
| [,58:60]  | fBodyGyroStdX        | fBodyGyroStdY      | fBodyGyroStdZ      |     
| [,61]     | fBodyAccMagMean      |
| [,62]     | fBodyAccMagStd       |
| [,63]     | fBodyAccJerkMagMean  | 
| [,64]     | fBodyAccJerkMagStd   |
| [,65]     | fBodyGyroMagMean     | 
| [,66]     | fBodyGyroMagStd      |
| [,67]     | fBodyGyroJerkMagMean |
| [,68]     | fBodyGyroJerkMagStd  |


# References

Article:

http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Site for the original data:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## License

Use of this dataset in publications must be acknowledged by referencing the following publication

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.