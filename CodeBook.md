---
title: "CodeBook"
author: "Vitor"
date: "23/08/2020"
---

# GetAndCleanDataCourse  
This is the repository for the course's project  


## 1. Downloading the dataset  
We have to download the dataset by the course activity given website.  
I had create a folder for this activity and unzipped it inside, then i had set  
the UCI HAR Dataset folder as my working directory, to facilitate my work.  

## 2. Assigning each data to variables  
**features <- features.txt**  
The features selected for this database come from the accelerometer and  
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
**activities <- activity_labels.txt**  
List of activities performed when the  
corresponding measurements were taken and its codes (*labels*)  
**subject_test <- test/subject_test.txt**  
contains test data of 9/30 volunteer test subjects being observed  
**x_test <- test/X_test.txt**  
contains recorded features test data  
**y_test <- test/y_test.txt**  
contains test data of activities’code labels  
**subject_train <- test/subject_train.txt**  
contains train data of 21/30 volunteer subjects being observed  
**x_train <- test/X_train.txt**  
contains recorded features train data  
**y_train <- test/y_train.txt**  
contains train data of activities’code labels  

## 3. Merging training and test sets to create one dataset  
We create **X** and **Y**, by *rbind()* their respectives train and test files.  
Then we *rbind()* the subjects train and test, creating **Subject** and finally  
cbind() **Subject**, **X** and **Y**, calling it **Merged_Data**.  

## 4. Extracting only the Mean end Standard Deviations values  
**TidyData** is created by subsetting **Merged_Data**, selecting only columns:  
*subject*, *code* and the measurements on the *mean* and standard deviation  
(*std*) for each measurement.  

## 5. Using the descriptive ativity names in the tidy dataset  
Entire numbers in *code* column of the **TidyData** replaced with corresponding  
activity taken from second column of the *activities* variable  

## 6. Labeling the data set  
*code* column in **TidyData** renamed into *activities*  
All *Acc* in column’s name replaced by *Accelerometer*  
All *Gyro* in column’s name replaced by *Gyroscope*  
All *BodyBody* in column’s name replaced by *Body*  
All *Mag* in column’s name replaced by *Magnitude*  
All that starts with character f in column’s name replaced by *Frequency*  
All that starts with character t in column’s name replaced by *Time*  

## 7. Creating a second data set from step 4, with e average for each variable.  
**FinalData** is created by sumarizing **TidyData** taking the  
means of each variable for each activity and each subject, after groupped by  
subject and activity.  
Export **FinalData** into **FinalData.txt** file. 


