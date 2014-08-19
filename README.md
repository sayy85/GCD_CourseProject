##ReadMe!

This ReadMe! document describes how the script **run_analysis.R** works

The run_analysis.R script is a solution to Getting and Cleaning Data Course Project. The script will work as long as it is placed in the working directory which contains Samsung data.

The aim of the script is to:  
1. Merge the training and the test sets to create one data set.  
2. Extract only the measurements on the mean and standard deviation for each measurement.   
3. Use descriptive activity names to name the activities in the data set  
4. Appropriately label the data set with descriptive variable names.   
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.   

###1. Reading the data

The script read the data from UCI HAR Dataset folder placed in the working directory. The following files are read into R:  
- 'UCI HAR Dataset/train/X_train.txt' - training data set  
- 'UCI HAR Dataset/test/X_test.txt' - test data set     
- 'UCI HAR Dataset/features.txt' - names of variables (columns)  
- 'UCI HAR Dataset/train/y_train.txt' - IDs of activities for train dataset  
- 'UCI HAR Dataset/test/y_test.txt' - IDs of activities (rows) for test dataset    
- 'UCI HAR Dataset/activity_labels.txt' - labels of activities (rows)  
- 'UCI HAR Dataset/train/subject_train.txt' - IDs of subjects for training dataset    
- 'UCI HAR Dataset/test/subject_test.txt' - IDs of subjects for test dataset  

###2. Naming rows and columns

After reading the data, the training and test dataset is labelled with respective row/column names. The labels provided in the original data files are considered to be *descriptive names*, as requested in the assignment.
Two additional columns are added to both train and test data set that determine activity and subject IDs 

###3. Merging test and train data set

The test and train dataset are merged by placing one over another.

###4. Extracting mean and SD

Variables with means and SDs are extracted from the merged dataset

###5. Output dataset

The means and sds are averaged accross activities and subjects. This table is an output dataset which is written to a text file.
