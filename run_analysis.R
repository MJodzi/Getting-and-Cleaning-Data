

## Part 0
## Begin by setting your working dorectory to the file downloaded.
setwd("~/UCI HAR Dataset")


## Part 1: Merge the training and the test sets to create one data set.

## To start, we need to read the data and label it accordingly. Once we have read the data 
## we will merge the data files.
y_test <- read.table("test/y_test.txt", col.names="label")
subject_test <- read.table("test/subject_test.txt", col.names="subject")
x_test <- read.table("test/X_test.txt")
y_train <- read.table("train/y_train.txt", col.names="label")
subject_train <- read.table("train/subject_train.txt", col.names="subject")
x_train <- read.table("train/X_train.txt")

## (to merge the files into one table use rbind and cbind)
data <- rbind(cbind(subject_test, y_test, x_test),
              cbind(subject_train, y_train, x_train))


## Part 2: Extract only the measurements on the mean and standard deviation 
## for each measurement.

## Next, we will read the features.txt and pull out the mean and deviation.
features_txt <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features_mean_stnd <- features_txt[grep("mean\\(\\)|std\\(\\)", features_txt$V2), ]

data_mean_stnd <- data[, c(1, 2, features_mean_stnd$V1+2)]


## Part 3: Use descriptive activity names to name the activities in the data set.

## Next, we read the text file (activity_labels.txt).
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data_mean_stnd$label <- labels[data_mean_stnd$label, 2]


## Part 4: Appropriately labels the data set with descriptive variable names.

## Here, we clean the data and make it easier to read.
descriptive_colnames <- c("subject", "label", features_mean_stnd$V2)

descriptive_colnames <- tolower(gsub("[^[:alpha:]]", "", descriptive_colnames))

colnames(data_mean_stnd) <- descriptive_colnames


## Part 5: From the data set in step 4, create a second, independent tidy 
## data set with the average of each variable for each activity and each subject.

tidy_data <- aggregate(data_mean_stnd[, 3:ncol(data_mean_stnd)],
                       by=list(subject = data_mean_stnd$subject, 
                               label = data_mean_stnd$label),
                       mean)

write.table(format(tidy_data, scientific=T), "tidyData.txt",
            row.names=F, col.names=F, quote=2)


