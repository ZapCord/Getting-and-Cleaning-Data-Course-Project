## Tony Johnson
## 8/28/2020
## Getting and cleaning data project
## where data is from activities monitored from smartphones

## data.table.fread is used because it is faster
## and uses less memory than read.table
library(data.table)

## read in the features.txt to find the relevant features
## namely, means and standard deviations
feature_columns <- fread("features.txt")
names(feature_columns) = c("column.number","measurement")
mean_columns <- grep("mean",feature_columns$measurement)
std_columns <- grep("std",feature_columns$measurement)

mean_column_names<-tolower(feature_columns$measurement[mean_columns])
std_column_names<-tolower(feature_columns$measurement[std_columns])
## read in activity labels for number to text correspondence
activities <- fread("activity_labels.txt")
names(activities) <- c("number","activity")
## read in subjects for subject to observation correspondence
subjects_test <- fread("subject_test.txt")
subjects_train <- fread("subject_train.txt")


## read in the data_sets
## measurements are columns in x sets.
## observations are rows in x sets.
## observation correlated activities for x sets are defined in y sets

x_test_set <- fread("X_test.txt")
y_test_set <- fread("Y_test.txt")

x_train_set <- fread("X_train.txt")
y_train_set <- fread("y_train.txt")

## combine the test sets and train sets
## in overall sets, first 2947 observations is test set
## then the next 7352 observations is train set
## the y set is the activity corresponding to those observations
x <- rbind(x_test_set, x_train_set)
y <- as.data.frame(rbind(y_test_set, y_train_set))

subjects<-rbind(subjects_test, subjects_train)
names(subjects)<-"subject"

## changing y's activity numbers into actual activities
names(y)<-"activity"
y<-activities$activity[match(y$activity,activities$number)]


## make overall set by selecting only mean and std columns
x <- x %>% select(mean_columns,std_columns)
names_for_x<-c(mean_column_names,std_column_names)
names(x)<- names_for_x

## add in subject number and activity to the left of the data
x<-cbind(y,x)
x<-cbind(subjects,x)

names(x)[2]<-"activity"

## create a second dataset with the mean and std variables
## with averages based on subject and activity
## the new dataset is in tibble form b/c of ease of use
new_x <- x %>% group_by(subject, activity) %>% summarise_if(is.numeric, mean)
