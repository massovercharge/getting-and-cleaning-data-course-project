## Load required packages
library(data.table)
library(memisc)


if (!file.exists("UCI_HAR_Dataset.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2UCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip")
} 

if (!file.exists("UCI_HAR_Dataset")) { 
  unzip("UCI_HAR_Dataset.zip") 
}

## 0.0 Read test data

subject_test <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_test <- read.table("UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("UCI HAR Dataset/train/X_train.txt")

## 0.1 Read training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

## 1.1 Merge test and training data

subject <- do.call(rbind, list(subject_test, subject_train))
activity <- do.call(rbind, list(y_test, y_train))
features <- do.call(rbind, list(x_test, x_train))

## 1.2 Naming of variables

## The variable names of the features file are available from the features.txt file
feature_names <- read.table("UCI HAR Dataset/features.txt")
## Assign the variable names
colnames(features) <- feature_names[,2]

## Naming of subject and activity data
colnames(activity) <- "activityID"
colnames(subject) <- "subjectID"

## 1.3 Combine all data

all_data <- do.call(cbind, list(features, activity, subject))

## 2. Extract only mean and standard deviation
## Lookup indecies for variable names containing mean and std in string
indexAvgSTD <- grep(".*Mean.*|.*Std.*", colnames(all_data), ignore.case = T)
## The last and second to last column of all_data contains the subject and activity data
indexAvgSTD <- c(ncol(all_data)-1, ncol(all_data), indexAvgSTD)

## Assign selected rows to net object
subset_data <- all_data[,indexAvgSTD]

## 3. Use descriptive activity names for activities
## Read activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activityID", "activity")
## Add activity labels to subset_data
subset_data <- merge(subset_data, activity_labels, by="activityID")
## Move activity column in front with the activityID column
subset_data <- subset_data[,c(ncol(subset_data), 1:(ncol(subset_data)-1))]

## 4. Label the data set with descriptive variable names

colnames(subset_data) <- gsub("Acc", "Accelerometer", colnames(subset_data))
colnames(subset_data) <- gsub("angle", "Angle", colnames(subset_data))
colnames(subset_data) <- gsub("freq", "Frequency", colnames(subset_data))
colnames(subset_data) <- gsub("gravity", "Gravity", colnames(subset_data))
colnames(subset_data) <- gsub("Gyro", "Gyroscope", colnames(subset_data))
colnames(subset_data) <- gsub("Mag", "Magnitude", colnames(subset_data))
colnames(subset_data) <- gsub("mean", "Mean", colnames(subset_data))
colnames(subset_data) <- gsub("tBody", "TimeBody", colnames(subset_data))
colnames(subset_data) <- gsub("std", "STD", colnames(subset_data))
colnames(subset_data) <- gsub("^f", "Frequency", colnames(subset_data))
colnames(subset_data) <- gsub("^t", "Time", colnames(subset_data))

## 5. Create a second tidy data set with the avg of each variable for each activity and subject
## make subset_data a data table object to enable fast processing with the data.table package

subset_data <- data.table(subset_data)

# Make avg for all subjectID and activityID
tidy_data <- aggregate(. ~subjectID + activity, subset_data, mean)

# Write data to tab separated txt file
write.table(tidy_data, "tidy_data.txt", row.names = F, sep = "\t")


## Make code book
tidy_data_set <- data.set(tidy_data)
codebook_md <- codebook(tidy_data_set)
Write(codebook_md, file="CodeBookAuto.md")