#if not install "plyr" then install the module
if (!require("plyr")) {
  install.packages(plyr)
}

#load plyr module 
library(plyr)

#------Merges the training and the test sets to create one data set----

#load the test and trainng parts of UCI HAR Dataset
testA <- read.table("./UCI HAR Dataset/test/X_test.txt")
testB <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainA <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainB <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#merge the training and test dataset together(A,B and subject) 
dataSetA <- rbind(trainA, testA)
dataSetB <- rbind(trainB, testB)
dataSetSubject<- rbind(subjectTrain, subjectTest)
#---------------------------------------------------------------------

#------Extracts only the measurements on the mean and standard deviation for each measurement----

#extract the features names of the whole dataset
features <- read.table("./UCI HAR Dataset/features.txt")
#extract the position (column number) of the mean and standard deviation metrics
metrics <-grep(".*Mean.*|.*Std.*",x = features[, 2], ignore.case=TRUE)
#obtain a subset of dataSetA that contain information about mean and standard deviation
dataSetA <- dataSetA[,metrics]
#extract the feature names of the mean and standard deviation metrics on dataSetA  and add to dataSetA
names(dataSetA) <- features[metrics, 2]
#eliminate extra symbols like [ ] ( ) , and extra spaces
names(dataSetA) <- gsub('[-()]', ' ', names(dataSetA))
names(dataSetA) <- gsub('\\s+', ' ', names(dataSetA))
names(dataSetA) <- gsub(',', '', names(dataSetA))
#-----------------------------------------------------------------------------------------------

#------Uses descriptive activity names to name the activities in the data set-------

#extract the activity names for activity_labels.txt
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
#remplace activity number with the activity names
dataSetB[, 1] <- activities[dataSetB[, 1], 2]
#-----------------------------------------------------------------------------------

#------Appropriately labels the data set with descriptive variable names-----------
#rename columns
names(dataSetB) <- "activity"
names(dataSetSubject) <- "subject"
#-----------------------------------------------------------------------------------

#------creates a tidy data set with the average of each variable for each activity and each subject-----------
#combine all datasets (A,B and Subject)
datasets <- cbind(dataSetA, dataSetB, dataSetSubject)

# independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- ddply(datasets, .(subject, activity), function(x) colMeans(x[, 1:86]))
#-------------------------------------------------------------------------------------------------------------

#write file
write.table(tidyData, "./tidyData.txt", row.name=FALSE)




