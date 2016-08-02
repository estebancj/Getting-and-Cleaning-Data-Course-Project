# Execution steps

Script called run_analysis.R do following steps in order to preprocess data:
* Download the UCI HAR Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Load the train,test and subject parts of UCI HAR Dataset using read.table command.
* Merge the training and test dataset together using rbind command.
* Extract the features names of the whole dataset (using read.table command) and then apply a grep command to filter the names.
	* Obtain a subset of data Set that contain information about mean and standard deviation.
	* Extract the feature names of the mean and standard deviation metrics and add to data Set.
* Extract the activity names using read.table command.
* Replace activity number of column dataset with the activity names previously extracted.
* Appropriately labels the data set with descriptive variable names(activity and subject).
* Combine all datasets (train,test and subject) using cbind command.
* Obtain a tidy data set with the average of each variable for each activity and each subject of the combines dataset(previous step).

# Dataset Variables 
* testA: X_test file in UCI HAR Dataset.
* testB: y_test file in UCI HAR Dataset.
* trainA: X_train in UCI HAR Dataset.
* trainB: y_train in UCI HAR Dataset.
* subjectTrain: subject_train in UCI HAR Dataset.
* subjectTest: subject_test in UCI HAR Dataset.
* features: features file in UCI HAR Dataset.
* activities: activity_labels file in UCI HAR Dataset.
* dataSetA: trainA and testA combined.
* dataSetB: trainB and testB combined.
* dataSetSubject: subjectTrain and subjectTest combined.
* datasets: dataSetA, dataSetB and  dataSetSubject combined.

# Normal Variables 
* metrics: The position (column number) of the mean and standard deviation metrics on features file.
* tidyData:  Independent tidy data set with the average of each variable for each activity and each subject.
