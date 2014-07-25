Getting & Cleaning Data
=======================

##Usage

Use the run_analysis.R script to create the tidy data output files. The Samsung dataset must be copied to the same working directory as the script without any change of the directory structure.

##Transformations

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set.
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Output

The scripts creates two files upon being run:

1. cleanData.txt file which has the tidy dataset as required by the project.
2. average.txt file which has the second, independent tidy data set with the average of each variable for each activity and each subject.