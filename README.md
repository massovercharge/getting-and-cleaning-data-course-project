## Getting and Cleaning Data Project

Github repository for Getting and Cleaning Data Course Project

### Project overview
This project revolves around the notions of getting and cleaning data. Thus, the goal of the project is to make a tidy dataset which can be easily coupled to downstream data processing. A version of the data set used here along with a description can be found by going to [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The current assignment is solved using the statistical language R.

### Assignment
The project includes four files in total
* This README.md
* The tidy_data.txt (which is created by run_analysis.R)
* A CodeBook.md file describing the variables and processing steps performed
* An R script called run_analysis.R which performes the analysis described here:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please note that the run_analysis.R will perform the analysis in the currently defined working directory by default. If this is not practical beware that you will need to chnage the working directory manually.