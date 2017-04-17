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

  
* "TimeBodyAccelerometer-Mean()-X"                        
* "TimeBodyAccelerometer-Mean()-Y"                        
* "TimeBodyAccelerometer-Mean()-Z"                        
* "TimeBodyAccelerometer-STD()-X"                         
* "TimeBodyAccelerometer-STD()-Y"                         
* "TimeBodyAccelerometer-STD()-Z"                         
* "TimeGravityAccelerometer-Mean()-X"                     
* "TimeGravityAccelerometer-Mean()-Y"                     
* "TimeGravityAccelerometer-Mean()-Z"                     
* "TimeGravityAccelerometer-STD()-X"                      
* "TimeGravityAccelerometer-STD()-Y"                      
* "TimeGravityAccelerometer-STD()-Z"                      
* "TimeBodyAccelerometerJerk-Mean()-X"                    
* "TimeBodyAccelerometerJerk-Mean()-Y"                    
* "TimeBodyAccelerometerJerk-Mean()-Z"                    
* "TimeBodyAccelerometerJerk-STD()-X"                     
* "TimeBodyAccelerometerJerk-STD()-Y"                     
* "TimeBodyAccelerometerJerk-STD()-Z"                     
* "TimeBodyGyroscope-Mean()-X"                            
* "TimeBodyGyroscope-Mean()-Y"                            
* "TimeBodyGyroscope-Mean()-Z"                            
* "TimeBodyGyroscope-STD()-X"                             
* "TimeBodyGyroscope-STD()-Y"                             
* "TimeBodyGyroscope-STD()-Z"                             
* "TimeBodyGyroscopeJerk-Mean()-X"                        
* "TimeBodyGyroscopeJerk-Mean()-Y"                        
* "TimeBodyGyroscopeJerk-Mean()-Z"                        
* "TimeBodyGyroscopeJerk-STD()-X"                         
* "TimeBodyGyroscopeJerk-STD()-Y"                         
* "TimeBodyGyroscopeJerk-STD()-Z"                         
* "TimeBodyAccelerometerMagnitude-Mean()"                 
* "TimeBodyAccelerometerMagnitude-STD()"                  
* "TimeGravityAccelerometerMagnitude-Mean()"              
* "TimeGravityAccelerometerMagnitude-STD()"               
* "TimeBodyAccelerometerJerkMagnitude-Mean()"             
* "TimeBodyAccelerometerJerkMagnitude-STD()"              
* "TimeBodyGyroscopeMagnitude-Mean()"                     
* "TimeBodyGyroscopeMagnitude-STD()"                      
* "TimeBodyGyroscopeJerkMagnitude-Mean()"                 
* "TimeBodyGyroscopeJerkMagnitude-STD()"                  
* "FrequencyBodyAccelerometer-Mean()-X"                   
* "FrequencyBodyAccelerometer-Mean()-Y"                   
* "FrequencyBodyAccelerometer-Mean()-Z"                   
* "FrequencyBodyAccelerometer-STD()-X"                    
* "FrequencyBodyAccelerometer-STD()-Y"                    
* "FrequencyBodyAccelerometer-STD()-Z"                    
* "FrequencyBodyAccelerometer-MeanFreq()-X"               
* "FrequencyBodyAccelerometer-MeanFreq()-Y"               
* "FrequencyBodyAccelerometer-MeanFreq()-Z"               
* "FrequencyBodyAccelerometerJerk-Mean()-X"               
* "FrequencyBodyAccelerometerJerk-Mean()-Y"               
* "FrequencyBodyAccelerometerJerk-Mean()-Z"               
* "FrequencyBodyAccelerometerJerk-STD()-X"                
* "FrequencyBodyAccelerometerJerk-STD()-Y"                
* "FrequencyBodyAccelerometerJerk-STD()-Z"                
* "FrequencyBodyAccelerometerJerk-MeanFreq()-X"           
* "FrequencyBodyAccelerometerJerk-MeanFreq()-Y"           
* "FrequencyBodyAccelerometerJerk-MeanFreq()-Z"           
* "FrequencyBodyGyroscope-Mean()-X"                       
* "FrequencyBodyGyroscope-Mean()-Y"                       
* "FrequencyBodyGyroscope-Mean()-Z"                       
* "FrequencyBodyGyroscope-STD()-X"                        
* "FrequencyBodyGyroscope-STD()-Y"                        
* "FrequencyBodyGyroscope-STD()-Z"                        
* "FrequencyBodyGyroscope-MeanFreq()-X"                   
* "FrequencyBodyGyroscope-MeanFreq()-Y"                   
* "FrequencyBodyGyroscope-MeanFreq()-Z"                   
* "FrequencyBodyAccelerometerMagnitude-Mean()"            
* "FrequencyBodyAccelerometerMagnitude-STD()"             
* "FrequencyBodyAccelerometerMagnitude-MeanFreq()"        
* "FrequencyBodyBodyAccelerometerJerkMagnitude-Mean()"    
* "FrequencyBodyBodyAccelerometerJerkMagnitude-STD()"     
* "FrequencyBodyBodyAccelerometerJerkMagnitude-MeanFreq()"
* "FrequencyBodyBodyGyroscopeMagnitude-Mean()"            
* "FrequencyBodyBodyGyroscopeMagnitude-STD()"             
* "FrequencyBodyBodyGyroscopeMagnitude-MeanFreq()"        
* "FrequencyBodyBodyGyroscopeJerkMagnitude-Mean()"        
* "FrequencyBodyBodyGyroscopeJerkMagnitude-STD()"         
* "FrequencyBodyBodyGyroscopeJerkMagnitude-MeanFreq()"    
* "Angle(TimeBodyAccelerometerMean,Gravity)"              
* "Angle(TimeBodyAccelerometerJerkMean),GravityMean)"     
* "Angle(TimeBodyGyroscopeMean,GravityMean)"              
* "Angle(TimeBodyGyroscopeJerkMean,GravityMean)"          
* "Angle(X,GravityMean)"                                  
* "Angle(Y,GravityMean)"                                  
* "Angle(Z,GravityMean)"    