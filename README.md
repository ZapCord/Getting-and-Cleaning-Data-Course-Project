# Getting-and-Cleaning-Data-Course-Project
Cleans a dataset provided by Coursera's "Getting and Cleaning Data Course" related to smartphone activity data.

The only script to run is run_analysis.R.
Since this was not made into a function, merely copy and
paste the entire script into an R environment to return 2 datasets.

The first dataset is named "x", and has rows related to
the subject and the activity performed for the smartphone data.
The columns are related to means and standard deviations (std)
of the various features collected. This dataset has multiple trials per subject and activity.

The second dataset is named "new_x", where each row is now the
average of the various features based on the subject and activity performed, such that each subject and activity is not repeated.
