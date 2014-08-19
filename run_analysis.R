##The script is a solution to Getting and Cleaning Data Course Project:
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##
##The script assumes it is placed in the working directory and that the working directory
##contains UCI HAR Dataset folder with the data to be read.

run_analysis<-function(){
  #set file paths
  train_dataSet_path='UCI HAR Dataset/train/X_train.txt' 
  test_dataSet_path='UCI HAR Dataset/test/X_test.txt' 
  columnNames_path='UCI HAR Dataset/features.txt'
  train_rowIds_path='UCI HAR Dataset/train/y_train.txt'
  test_rowIds_path='UCI HAR Dataset/test/y_test.txt'
  rowLabels_path='UCI HAR Dataset/activity_labels.txt'
  train_subject_path='UCI HAR Dataset/train/subject_train.txt'
  test_subject_path='UCI HAR Dataset/test/subject_test.txt'
  
  #read the data
  df_train<-read.table(train_dataSet_path)
  df_test<-read.table(test_dataSet_path)
  columnNames<-read.table(columnNames_path)
  train_rowIds<-read.table(train_rowIds_path)
  test_rowIds<-read.table(test_rowIds_path)
  rowLabels<-read.table(rowLabels_path)
  train_subject<-read.table(train_subject_path)
  test_subject<-read.table(test_subject_path)
  
  #name rows and columns
  colnames(df_train)<-columnNames$V2
  colnames(df_test)<-columnNames$V2
  df_train=cbind(train_rowIds,train_subject,df_train)
  df_test=cbind(test_rowIds,test_subject,df_test)
  colnames(df_train)[1:2]<-c('activity','subject')
  colnames(df_test)[1:2]<-c('activity','subject')
  df_train$activity<-factor(df_train$activity,levels=rowLabels$V1,labels=rowLabels$V2)
  df_test$activity<-factor(df_test$activity,levels=rowLabels$V1,labels=rowLabels$V2)
  
  #merge train and test data set
  df<-rbind(df_train,df_test)
  #rm(df_train,df_test)
  
  #extract mean and sd
  sub_index1<-grepl('mean',colnames(df)) | grepl('std',colnames(df))
  sub_index2<-grepl('meanFreq()',colnames(df))
  sub_index=as.logical(sub_index1-sub_index2)
  sub_index[1:2]=TRUE
  df<-df[,sub_index]
  
  #create a data set with the average of each variable for each activity and each subject
  df2<-aggregate(df[,3:ncol(df)],list(df$activity,df$subject),FUN=mean)
  colnames(df2)[1:2]<-c('activity','subject')
  
  write.table(df2,'GCD_solution.txt',row.name=FALSE)
}