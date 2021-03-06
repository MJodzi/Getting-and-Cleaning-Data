# CodeBook for Course Project

This document describes the coding insite the Course Project `run_analysis.R`


## Data Source

To download the data you are able to fo to 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data is focused around the Samsung Galaxy S smartphone's accelerometers and the data they collect. For more details Coursera gives
the following site: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Coding

There are a few self-assigned objects/ functions in the `run_analysis.R` code, they include:

`y_test` - this includes the data included in the Test folder titled "Y Test"

`subject_test` - this includes the data included in the Test folder titled "Subject Test"

`x_test` - this includes the data included in the Test folder titled "X Test"

`y_train` - this includes the data included in the Train folder titled "Y Train"

`subject_train` - this includes the data included in the Train folder titled "Subject Train"

`x_train` - this includes the data included in the Train folder titled "X Train"

`features_txt` - this includes the data included in the "Features.txt" file

`features_mean_stnd` - this finds the mean and standard deviation for the Features segment

`descriptive_colnames` - this is the shorthand used for changing the format for the column names

`tidy_data` - this is used when creating the final "tidyData.txt"


## Prompt

The following points were what the R file was meant to solve:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
