Data Dictionary - Smartphone Activity Data Project

Variables:
From the original: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Some signals are magnitudes from Euclidean norms of the signals.
"f" signals described FFT applied signals.
"XYZ" are the 3 different directions for signals.
Then, mean(): Mean value and std(): Standard deviation were estimated from the signals.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Data:
From: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
30 volunteers within 19-48 years old performed 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a smartphone on the waist. 3 axial linear acceleration, angular velocity were captured at 50 Hz and preprocessed using noise filters. Fixed width sliding windows were used to sample the signals.

Transformations to cleanup:

all files were put into the same directory for ease of use and then read using data.table fread function. Feature names with "mean" and "std" column positions were found from the features.txt file.

activity number correspondence was found from activity_labels.txt

subjects in the test and train set were found in subject_test.txt and subject_train.txt

The X test and train sets were then combined into a single x set.
The same was done with the y set which described the activity performed in the X observations. The activity numbers were then changed to the actual correlated activity.

The overall X set was then pared down using select for specifically the mean and std columns. The subject data and activity data was then cbind-ed to the left of the X set.

The subject and activity averaged data set was produced using group_by and summarise_if to return the means based on the grouped subject and activity.




