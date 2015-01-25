# This script creates a Tidy Data Set based on measurements found in the data
# collected from the accelerometers from the Samsung Galaxy S smartphone.  The
# tidy dataset represents the averages of each mean and standard deviation variables
# found in the training and test data grouped by activity and subject.
#
# The algorithm to achieve this is the following:
# 1) Read in both training and test tables using read.table
# 2) add the subject and activity columns into their respective tables
# 3) merge the training and test data sets
# 4) group the data sets by subject and activity
# 5) Assign meaningfull names to the activities
# 6) Compute the average of each feature (variable) for each activity and subject
# 7) Assign meaningful column names
#
# The accelerometer data can be found in directory: "UCI HAR Dataset" which is the
# default value of the parameter accelDataDir in the function run_analysis.
#
# One additional data file was created that represents the column names and the
# subset of columns used in the analysis, and can be found in the "UCI HAR Dataset"
# directory called "featuresSubset.txt"
#
# The resulting Tidy Data Set is saved in the file AccelTidyData.txt in your
# working directory
#
# Function run_analysis
# paramter: dataDir: directory containing the "UCI HAR Dataset
#                       - default value "UCI HAR Dataset" in working directory
# output file: "tidydata.txt"
# returns: tidydata table
library(dplyr)
run_analysis <- function(dataDir="UCI HAR Dataset") {
    # First read in all the data needed
    
    # read the training data
    trainData <- read.table(paste(dataDir, "train", "X_train.txt", sep = "/"))
    
    # read the test data
    testData <- read.table(paste(dataDir, "test", "X_test.txt", sep = "/"))

    # read the training subjects data
    trainSubjects <- read.table(
        paste(dataDir, "train", "subject_train.txt", sep = "/"))
    
    # read the test subjects data
    testSubjects <- read.table(
        paste(dataDir, "test", "subject_test.txt", sep = "/"))
    
    # read the training activity data
    trainActivity <- read.table(
        paste(dataDir, "train", "y_train.txt", sep = "/"))
    
    # read the test activity data
    testActivity <- read.table(
        paste(dataDir, "test", "y_test.txt", sep = "/"))
        
    # read the features subset table
    features <- read.table(
        paste(dataDir, "featuresSubset.txt", sep = "/"))
    
    # read the activities
    activities <- read.table(
        paste(dataDir, "activity_labels.txt", sep = "/"))
    
    # subset the training data containing only mean and std deviation features
    trainData <- trainData[, features[,1]]
    
    # subset the test data containing only mean and std deviation features
    testData <- testData[, features[,1]]    
        
    # create a dplyr data.table of the training data set, add the Activity and 
    # Subject variable and order so activity and Subjects are the first columns    
    trainData2 <- tbl_dt(trainData) %>%
        mutate(Activity = trainActivity[1], Subject = trainSubjects[1]) %>%
        select(Activity, Subject, 1:ncol(trainData))
    rm(trainData)
    
    # create a dplyr data.table of the test data set, add the Activity and 
    # Subject variable and order so activity and Subjects are the first columns
    testData2 <- tbl_dt(testData) %>%
        mutate(Activity = testActivity[1], Subject = testSubjects[1]) %>%
        select(Activity, Subject, 1:ncol(testData))
    rm(testData)
    
    # merge the two data sets togther, group by the Activity and subject, sort
    # the data by activity, then subject, and finally take the average of
    # each variable for each activity and each subject
    tidydata <- rbind_list(trainData2, testData2) %>%
        group_by(Activity, Subject) %>%
        arrange(Activity, Subject) %>%
        summarise_each(funs(mean))
    
    # change the activity factor values to descriptive names
    tidydata$Activity <- factor(tidydata$Activity, 1:6, labels = activities[,2])
    
    # now name all the features with their descriptive names
    setnames(tidydata, old = 3:ncol(tidydata), new = as.character(features[,2]))
    
    # save the Tidy Table, which can be read back with the read.table() function
    print("Saving file tidydata.txt in your working directory")
    write.table(tidydata, "tidydata.txt", row.names=FALSE)
    
    tidydata
}