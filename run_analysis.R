##This Script has all the requirements to tidy this dataset.
#1. We have to download the dataset by the course activity given website.
# I had create a folder for this activity and unzipped it inside, then i had set
#the UCI HAR Dataset folder as my working directory, to facilitate my work.

#2. Assigning each data to variables
features <- features.txt # The features selected for this database come from the
                         #accelerometer and gyroscope 3-axial raw signals 
                         #tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt #List of activities performed when the 
                                  #corresponding measurements were taken and its
                                  #codes (labels)
subject_test <- test/subject_test.txt #contains test data of 9/30 volunteer test
                                      #subjects being observed
x_test <- test/X_test.txt #contains recorded features test data
y_test <- test/y_test.txt #contains test data of activities’code labels
subject_train <- test/subject_train.txt #contains train data of 21/30 volunteer 
                                        #subjects being observed
x_train <- test/X_train.txt #contains recorded features train data
y_train <- test/y_train.txt #contains train data of activities’code labels


#3. Merging training and test sets to create one dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, X, Y)

#4. Extracting only the Mean end Standard Deviations values
TidyData <- Merged_Data %>% select(subject, code, contains("mean"),
                                   contains("std"))

#5. Using the descriptive ativity names in the tidy dataset
TidyData$code <- activities[TidyData$code, 2]

#6. Labeling the data set
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData),
                      ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#7. Creating a second data set from step 4, with e average for each variable.
FinalData <- TidyData %>%
      group_by(subject, activity) %>%
      summarise_all(funs(mean))
FinalData$activity <- as.factor(FinalData$activity)
write.table(FinalData, "FinalData.txt", row.name=FALSE)


