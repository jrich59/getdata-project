# Getting and Cleaning Data Course Project

The purpose of the project was to create a tidy dataset that could be used for later analysis based on the OCI HAR dataset that measured daily living activity via inertial sensors in a Samsung Galaxy S smartphone.  The measurements contained groups of features representing different measurement types (see the file "CodeBook.md" for more details about the data itself).  The instructions for the project were to create an R script "run_analysis.R" that produces the tiny dataset with the following instructions: merge the test and training datasets together, extract only the measurements of the mean and standard deviation of each measurement in the dataset, labels the dataset variables with descriptive names, uses descriptive activity names to name the activities in the data set, and finally takes the average of of each variable for each activity and each subject producing the final tiny dataset.  We were then instructed to save the final dataset using the write.table() function using row.names=FALSE.

The run_anlysis().R script in this repository will generate the tidy dataset file "tidydata.txt" in the users working directory, using the following write.table() function call:
```
write.table(tidydata, "tidydata.txt", row.names=FALSE)
```
To read the table run the following (it assumes you are in the same directory as the file "tidydata.txt"):
```
tidydata <- read.table("tidydata.txt", header=TRUE)
tidydata
```

To generate the tiny data file above, set your working directory to the location of the file `run_analysis.R`.  You will notice that the OCI HAR dataset is included in the directory "UCI HAR Dataset" downloaded on January 15, at 9:28 PM PST from this downlaod location:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The script supports you moving the dataset somewhere else, since you can pass in the name of the directory containing the dataset to the function `run_analysis()`.  The dataset was slightly modified by adding a file called featuresSubset.txt to specify the subset of features from the original features that I was interested in, and more desciptive names.  So therefore it is important that you use the data found in this repo, and not the download above.  The script also assumes that you have the following package installed: dplyr.  The analysis can be run in the R console with the following code: (making sure your working directory is the same location as the script and the dataset is also in that directory).
```
source('run_analysis.R')
run_analysis()
```
Directions if you moved the dataset to another directory.  Say you moved it to the directory "/usr/home/yourname/getdata/OCI HAR Dataset", run the following:
```
source('run_analysis.R')
run_analysis(dataDir="/usr/home/yourname/getdata/OCI HAR Dataset")
```
In both cases it will save the file "tidydata.txt" in your working directory.


Below is the algorithm of the function "run_analysis():

1. Read the following data files into tables: 
    + "UCI HAR Dataset/train/X_train.txt" - table containing training feature measurements
    + "UCI HAR Dataset/test/X_test.txt" - table containing test feature measurements
    + "UCI HAR Dataset/train/subject_train.txt" - table containing subjects performing each feature measurement in the training set
    + "UCI HAR Dataset/test/subject_test.txt" - table containing subject performing each feature measurement in the test set
    + "UCI HAR Dataset/train/y_train.txt" - activity labels for each feature measurement in the training set
    + "UCI HAR Dataset/test/y_test.txt" - activity labels for each feature measurement in the training set
    + "UCI HAR Dataset/featuresSubset.txt" - table containing only the mean and standard deviation features used for subsetting and labeling the feature variables
    + "UCI Har Dataset/activity_labels.txt" - mapping of activity labels to descriptive activity names
2. Subset the training and test datasets to use only the features found in the featureSubset table
3. For both the training and datasets, using dplyr, add 2 variables "Activity" and "Subject", using mutate to combine the subject table and activity table, and make these the first to variables in the resulting tables.
4. Merge the two tables (training and test), group by the Activity and Subject factors, then summarize the rest of the features by computing the means of each group, producing a tidydata table.
5. Change the activity factor values to descriptive names in the tidydata table
6. Name all the features with their descriptive names in the tidydata table
7. Write the tidydata table to the file "tidydata.txt"
