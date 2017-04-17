# Getting and Cleaning Data Project

An auto-generated codebook is made when the run_analysis.R script is run, this is called "CodeBookAuto.R", and it contains the variable names of "tidy_data.R" along with a summary of the variables.

## Source data description
The description included under this headline was sourced from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A citation is included under "Citation".

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Citation:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

## Variable description
Column names describe the variables by a series of discrete descriptive factors. They appear in the order presented in `Table 1` from top to bottom. Each of the measurements are associated with a subject and an activity, see `Table 2` for an overview.

**Table 1**

Variable name   | Description/value                       | Type    
----------------|-----------------------------------------|---------
`dimension`     | frequency or time                       | factor  
`source`        | Body, BodyBody or gravity               | factor  
`type`          | Accelerometer or Gyroscope              | factor
`jerk`          | Jerk or non-Jerk (can be jerk or not)   | factor
`magnitude`     | Mag or non-Mag (can be Mag or not)      | factor
`method`        | mean or std (standard deviation)        | factor
`axis`          | X, Y, Z or non                          | factor

Each of the features are associated with a subject and an activity, the columns containing this information is described in `Table 2`.

**Table 2**

Variable name | Description       | Type    | value
--------------|-------------------|---------|-------------
`activityID`  | identifier        | int     | 1-6
`activity`    | descriptive label | factor  | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
`subjectID`   | identifier        | int     | 1-30



## Transformations

The following steps are performed by the run_analysis.R script. The current script assumes that the data is available in .zip format from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The data is extracted to the current working directory and so is the resulting tidy_data.txt file.

### 1. Merges the training and the test sets to create one data set.
In the first processing step the training and test data sets are merged. The subject and activity data is merged by row, and the resulting data frame is merged with the features data by columns to make the rows identifiable by activity and subject. The subject column is named "subject" and activity is named "activity". The features are named using the "features.txt" file. The object containing all merged data is called "all_data".


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
In this step mean and standard deviation features are extracted by searching the column names for "mean" and "std", next the new object is created based on these columns and the subject and activity identifiers. This object is named "subset_data".

### 3. Uses descriptive activity names to name the activities in the data set
Based on the numeric activity identifiers a column of descriptive names are added from the "activity_labels.txt" file.

### 4. Appropriately labels the data set with descriptive variable names.
The original feature names are written in a shot hand nomenclature. In this step the short hand names are written out in full except for std which is merely changed to capital letters (STD) to increase readability. No punctuation, brackets or alike was changed. Here is an overview of the changes:
* Acc is changed to Accelerometer
* Gyro is changed to Gyroscope
* Mag is changed to Magnitude
* mean is changed to Mean
* std is changed to STD
* f is written out to Frequency (strings beginning with "f")
* t is written out to Time (strings beginning with "t")

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Based on the subset_data object a mean is calculated for all features for each subject and activity, and saved to a new object called "tidy_data" the data is then written to the working directory as "tidy_data.txt" with tap separation.

## Measurements contained in "tidy_data.txt"

All the measurements presented in "tidy_data.txt" is a mean of the original data set for all aticivity and subjects (column 4-89). The values are numeric and contained between -1 and 1. Column 1-3 are activity and subject identifiers as described in `Table 2`.

 [1] "subjectID"                                             
 [2] "activity"                                              
 [3] "activityID"   
 [4] "TimeBodyAccelerometer-Mean()-X"                        
 [5] "TimeBodyAccelerometer-Mean()-Y"                        
 [6] "TimeBodyAccelerometer-Mean()-Z"                        
 [7] "TimeBodyAccelerometer-STD()-X"                         
 [8] "TimeBodyAccelerometer-STD()-Y"                         
 [9] "TimeBodyAccelerometer-STD()-Z"                         
[10] "TimeGravityAccelerometer-Mean()-X"                     
[11] "TimeGravityAccelerometer-Mean()-Y"                     
[12] "TimeGravityAccelerometer-Mean()-Z"                     
[13] "TimeGravityAccelerometer-STD()-X"                      
[14] "TimeGravityAccelerometer-STD()-Y"                      
[15] "TimeGravityAccelerometer-STD()-Z"                      
[16] "TimeBodyAccelerometerJerk-Mean()-X"                    
[17] "TimeBodyAccelerometerJerk-Mean()-Y"                    
[18] "TimeBodyAccelerometerJerk-Mean()-Z"                    
[19] "TimeBodyAccelerometerJerk-STD()-X"                     
[20] "TimeBodyAccelerometerJerk-STD()-Y"                     
[21] "TimeBodyAccelerometerJerk-STD()-Z"                     
[22] "TimeBodyGyroscope-Mean()-X"                            
[23] "TimeBodyGyroscope-Mean()-Y"                            
[24] "TimeBodyGyroscope-Mean()-Z"                            
[25] "TimeBodyGyroscope-STD()-X"                             
[26] "TimeBodyGyroscope-STD()-Y"                             
[27] "TimeBodyGyroscope-STD()-Z"                             
[28] "TimeBodyGyroscopeJerk-Mean()-X"                        
[29] "TimeBodyGyroscopeJerk-Mean()-Y"                        
[30] "TimeBodyGyroscopeJerk-Mean()-Z"                        
[31] "TimeBodyGyroscopeJerk-STD()-X"                         
[32] "TimeBodyGyroscopeJerk-STD()-Y"                         
[33] "TimeBodyGyroscopeJerk-STD()-Z"                         
[34] "TimeBodyAccelerometerMagnitude-Mean()"                 
[35] "TimeBodyAccelerometerMagnitude-STD()"                  
[36] "TimeGravityAccelerometerMagnitude-Mean()"              
[37] "TimeGravityAccelerometerMagnitude-STD()"               
[38] "TimeBodyAccelerometerJerkMagnitude-Mean()"             
[39] "TimeBodyAccelerometerJerkMagnitude-STD()"              
[40] "TimeBodyGyroscopeMagnitude-Mean()"                     
[41] "TimeBodyGyroscopeMagnitude-STD()"                      
[42] "TimeBodyGyroscopeJerkMagnitude-Mean()"                 
[43] "TimeBodyGyroscopeJerkMagnitude-STD()"                  
[44] "FrequencyBodyAccelerometer-Mean()-X"                   
[45] "FrequencyBodyAccelerometer-Mean()-Y"                   
[46] "FrequencyBodyAccelerometer-Mean()-Z"                   
[47] "FrequencyBodyAccelerometer-STD()-X"                    
[48] "FrequencyBodyAccelerometer-STD()-Y"                    
[49] "FrequencyBodyAccelerometer-STD()-Z"                    
[50] "FrequencyBodyAccelerometer-MeanFreq()-X"               
[51] "FrequencyBodyAccelerometer-MeanFreq()-Y"               
[52] "FrequencyBodyAccelerometer-MeanFreq()-Z"               
[53] "FrequencyBodyAccelerometerJerk-Mean()-X"               
[54] "FrequencyBodyAccelerometerJerk-Mean()-Y"               
[55] "FrequencyBodyAccelerometerJerk-Mean()-Z"               
[56] "FrequencyBodyAccelerometerJerk-STD()-X"                
[57] "FrequencyBodyAccelerometerJerk-STD()-Y"                
[58] "FrequencyBodyAccelerometerJerk-STD()-Z"                
[59] "FrequencyBodyAccelerometerJerk-MeanFreq()-X"           
[60] "FrequencyBodyAccelerometerJerk-MeanFreq()-Y"           
[61] "FrequencyBodyAccelerometerJerk-MeanFreq()-Z"           
[62] "FrequencyBodyGyroscope-Mean()-X"                       
[63] "FrequencyBodyGyroscope-Mean()-Y"                       
[64] "FrequencyBodyGyroscope-Mean()-Z"                       
[65] "FrequencyBodyGyroscope-STD()-X"                        
[66] "FrequencyBodyGyroscope-STD()-Y"                        
[67] "FrequencyBodyGyroscope-STD()-Z"                        
[68] "FrequencyBodyGyroscope-MeanFreq()-X"                   
[69] "FrequencyBodyGyroscope-MeanFreq()-Y"                   
[70] "FrequencyBodyGyroscope-MeanFreq()-Z"                   
[71] "FrequencyBodyAccelerometerMagnitude-Mean()"            
[72] "FrequencyBodyAccelerometerMagnitude-STD()"             
[73] "FrequencyBodyAccelerometerMagnitude-MeanFreq()"        
[74] "FrequencyBodyBodyAccelerometerJerkMagnitude-Mean()"    
[75] "FrequencyBodyBodyAccelerometerJerkMagnitude-STD()"     
[76] "FrequencyBodyBodyAccelerometerJerkMagnitude-MeanFreq()"
[77] "FrequencyBodyBodyGyroscopeMagnitude-Mean()"            
[78] "FrequencyBodyBodyGyroscopeMagnitude-STD()"             
[79] "FrequencyBodyBodyGyroscopeMagnitude-MeanFreq()"        
[80] "FrequencyBodyBodyGyroscopeJerkMagnitude-Mean()"        
[81] "FrequencyBodyBodyGyroscopeJerkMagnitude-STD()"         
[82] "FrequencyBodyBodyGyroscopeJerkMagnitude-MeanFreq()"    
[83] "Angle(TimeBodyAccelerometerMean,Gravity)"              
[84] "Angle(TimeBodyAccelerometerJerkMean),GravityMean)"     
[85] "Angle(TimeBodyGyroscopeMean,GravityMean)"              
[86] "Angle(TimeBodyGyroscopeJerkMean,GravityMean)"          
[87] "Angle(X,GravityMean)"                                  
[88] "Angle(Y,GravityMean)"                                  
[89] "Angle(Z,GravityMean)"    