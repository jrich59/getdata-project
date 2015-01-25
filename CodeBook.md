
This summary is based on the 
[UCI Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) (UCI HAR), 
which measured daily living activity for 30 subjects carrying a waist-mounted smartphone with embedded inertial sensors performing activities of daily living (ADL)

### Experimental Design and Background:  
The UCI HAR experiment was designed to measure human activity in their daily living and to summarize these findings into useful features and measurements for further analysis. 30 subjects performed 6 activities, while wearing a Samsung Galaxy S2 on their waist. Using the accelerometer and gyroscope, 3-axial linear accelerations and 3-axial angular velocitys were measured at a constant rate of 50Hz.  Several time and frequency domain signals were computed based on these raw signals, and a vector of features were derived from these signal measurements.  Subjects were randomly broken up into two sets, 70% in the training set and 30% in the test set. A more complete summary of the UCI HAR experiment itself can be found in the file "README.txt" in the dataset itself (the directory "UCI HAR Dataset"). 

For the purpose of this summary, I am only interested in the mean and standard deviation features of each signal type measured. The two datasets were combined into one dataset, and then were averaged for each activity and each subject to create a tidy dataset.  A more complete summary of the UCI HAR experiment itself can be found in the file "README.txt" in the dataset itself (the directory "UCI HAR Dataset").

### Raw data: 
The raw data and original feature set was obtained from the UCI HAR Dataset.  In this data set, sensor data was preprocessed using a noise filter sampled in fixed-width sliding windows (128 samples over 2.56 seconds overlapping 50%).  The sensor acceleration data was broken up into its gravitational and body motion components using a butterworth low-pass filter.  A vector of features was created by calculating variables from the frequency and time domain.  

* All The signal measurements were based on The raw 3-axial time signals from the accelerometer and gyroscope, filtered using noise filters that produced the signals (tAcc-XYZ and tGyro-XYZ).  The signals derived from these are described below:
    + The accelaration signal was seperated into body and gravitational signals (tBodyAcc-XYZ) and (tGravityAcc-XYZ) using low pass filters.  
    + The jerk signals (tBodyAccJerk-XYZ) and (tBodyAccGyroJerk-XYZ) were obtained from the body linear acceleration and angular velocity in time.
    + Magnitude signals of the 3 dimensional jerk signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
    + A Fast Fourier Transform (FFT) was applied to some of the above signals to produce the frequency domain signals (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag)
    
The signals were further processed into features of each signal, including the mean and standard deviation (the two features we are interested in for this summary).  Finally the features were normalized and bounded between the values of -1 and 1.

The data was generated from 30 subjects between the age of 19 and 48 performing six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING and LAYING).  The data from the 30 subjects was broken into a training dataset and a test dataset,  where 70% of the subjects were in the training set, and 30% were in the test data set.

For more information and details about the UCI-HAR dataset please refer to the file "features_info.txt" in the dataset directory "UCI HAR Dataset"

### Processed Data:
The features we are interested in for this analysis, are only the mean and standard deviation over a single window sample for each signal type described above.  I did not include the mean frequency or angle features as these are not just means and standard deviations of the signals themselves.  The subset of features I was interested in were saved in the file "featuresSubset.txt"" stored in the dataset directory, and used to specify the subset of features used when creating the tidy dataset.  The training and test data tables were merged together and each feature was averaged for each subject and activity.  Since the values in the original dataset were normalized between -1 and 1 there is no unit of measurement for the features.

The resulting summary dataset contains the following features:

* __Subject__: coded as a factor (1 - 30)
* __Activity__: 6 activities coded as a factor with the following values:
    + WALKING
    + WALKING_UPSTAIRS
    + WALKING_DOWNSTAIRS
    + SITTING
    + STANDING
    + LAYING       
* The 66 signal features.  For each signal the average was taken for each activity and subject, hence each cell in the resulting summary table specifies an average for a particular feature, subject and activity.  Only the Mean and Standard Deviation of each signal type was used from the original dataset, and are coded as: Mean and Std for the mean and standard deviation respectively.  X, Y, Z values represent the 3-axial directions.  Features are either in the time domain or frequency domain using a fast-fourier transform.
    + Average X,Y,Z body acceleration and gravitational signal features in the time domain.
        + __TimeBodyAccMeanAvgX__ - Average X mean in the time domain for the body acceleration 
        + __TimeBodyAccMeanAvgY__ - Average Y mean in the time domain for the body acceleration
        + __TimeBodyAccMeanAvgZ__ - Average Z mean in the time domain for the body acceleration
        + __TimeBodyAccStdAvgX__ - Average X standard deviation in the time domain for the body acceleration
        + __TimeBodyAccStdAvgY__ - Average Y standard deviation in the time domain for the body acceleration
        + __TimeBodyAccStdAvgZ__ - Average Z standard deviation in the time domain for the body accelearation
        + __TimeGravityAccMeanAvgX__ - Average X mean in the time domain for the gravitational acceleration
        + __TimeGravityAccMeanAvgY__ - Average Y mean in the time domain for the gravitational acceleration
        + __TimeGravityAccMeanAvgZ__ - Average Z mean in the time domain for the gravitaional acceleration
        + __TimeGravityAccStdAvgX__ - Average X standard deviation in the time domain for the gravitational acceleration
        + __TimeGravityAccStdAvgY__ - Average Y standard deviation in the time domain for the gravitational acceleration
        + __TimeGravityAccStdAvgZ__ - Average Z standard deviation in the time domain for the gravitational acceleration
    + Average X,Y,Z Jerk signal features based on linear acceleration in the time domain
        + __TimeBodyAccJerkMeanAvgX__ - Average X mean in the time domain for the body linear acceleration Jerk signal
        + __TimeBodyAccJerkMeanAvgY__ - Average Y mean in the time domain for the body linear acceleration Jerk signal
        + __TimeBodyAccJerkMeanAvgZ__ - Average Z mean in the time domain for the body linear acceleration Jerk signal
        + __TimeBodyAccJerkStdAvgX__ - Average X standard deviation in the time domain for the body linear acceleration Jerk signal
        + __TimeBodyAccJerkStdAvgY__ - Average Y standard deviation in the time domain for the body linear acceleration Jerk signal
        + __TimeBodyAccJerkStdAvgZ__ - Average Z standard deviation in the time domain for the body linear acceleration Jerk signal   
    + Average X,Y,Z gyroscope angular velocity signal features in the time domain
        + __TimeBodyGyroMeanAvgX__ - Average X mean in the time domain for the gyroscope angular velocity signal
        + __TimeBodyGyroMeanAvgY__ - Average Y mean in the time domain for the gyroscope angular velocity signal
        + __TimeBodyGyroMeanAvgZ__ - Average Z mean in the time domain for the gyroscope angular velocity signal
        + __TimeBodyGyroStdAvg__ - Average X standard deviation in the time domain for the gyroscope angular velocity signal
        + __TimeBodyGyroStdAvgY__ - Average Y standard deviation in the time domain for the gyroscope angular velocity  signal
        + __TimeBodyGyroStdAvgZ__ - Average Z standard deviation in the time domain for the gyroscope angular velocity signal
    + Average X,Y,Z Jerk signals based on the angular velocity in the time domain.
        + __TimeBodyGyroJerkMeanAvgX__ - Average X mean in the time domain for the body angular velocity Jerk signal
        + __TimeBodyGyroJerkMeanAvgY__ - Average Y mean in the time domain for the body angular velocity Jerk signal
        + __TimeBodyGyroJerkMeanAvgZ__ - Average Z mean in the time domain for the body angular velocity Jerk signal
        + __TimeBodyGyroJerkStdAvgX__ - Average X standard deviation in the time domain for the body angular velocity Jerk signal
        + __TimeBodyGyroJerkStdAvgY__ - Average Y standard deviation in the time domain for the body angular velocity Jerk signal
        + __TimeBodyGyroJerkStdAvgZ__ - Average Z standard deviation in the time domain for the body angular velocity Jerk signal
    + Average magnitude signals of the three dimensional signals in the time domain, calculated using the Euclidean norm
        + __TimeBodyAccMagMeanAvg__ - Average magnitude mean of the three dimensional body accelerations in the time domain
        + __TimeBodyAccMagStdAvg__ - Average magnitude standard deviation of the three dimensional body acceleration in the time domain
        + __TimeGravityAccMagMeanAvg__ - Average magnitude mean of the three dimensional gravity acceleration in the time domain
        + __TimeGravityAccMagStdAvg__ - Average magnitude standard deviation of the three dimensional gravity acceleration in the time domain
        + __TimeBodyAccJerkMagMeanAvg__ - Average magnitude mean of the three dimensional linear acceleration body Jerk signals in the time domain
        + __TimeBodyAccJerkMagStdAvg__ - Average magnitude standard deviation of the three dimensional linear accelaration body Jerk signals in the time domain
        + __TimeBodyGyroMagMeanAvg__ - Average magnitude mean of the three dimensional gyroscope body angular velocities in the time domain
        + __TimeBodyGyroMagStdAvg__ - Average magnitude standard deviation of the three dimensional body angular velocities in the time domain
        + __TimeBodyGyroJerkMagMeanAvg__ - Average magnitude mean of the three dimensional angular velocity body Jerk signals in the time domain
        + __TimeBodyGyroJerkMagStdAvg__ - Average magnitude standard deviation of the three dimensional angular velocity body Jerk signals in the time domain
    + Average X,Y,Z body acceleration signal features in the frequency domain.
        + __FreqBodyAccMeanAvgX__ - Average X mean in the frequency domain for the body acceleration
        + __FreqBodyAccMeanAvgY__ - Average Y mean in the frequency domain for the body acceleration
        + __FreqBodyAccMeanAvgZ__ - Average Z mean in the frequency domain for the body acceleration
        + __FreqBodyAccStdAvgX__ - Average X standard deviation in the frequency domain for the body acceleration
        + __FreqBodyAccStdAvgY__ - Average Y standard deviation in the frequency domain for the body acceleration
        + __FreqBodyAccStdAvgZ__ - Average Z standard deviation in the frequency domain for the body accleration
    + Average X,Y,Z Jerk signal features based on linear acceleration in the frequency domain
        + __FreqBodyAccJerkMeanAvgX__ - Average X mean in the frequency domain for the body linear acceleration Jerk signal
        + __FreqBodyAccJerkMeanAvgY__ - Average Y mean in the frequency domain for the body linear acceleration Jerk signal
        + __FreqBodyAccJerkMeanAvgZ__ - Average Z mean in the frequency domain for the body linear acceleration Jerk signal
        + __FreqBodyAccJerkStdAvgX__ - Average X standard deviation in the frequency domain for the body linear acceleration Jerk signal
        + __FreqBodyAccJerkStdAvgY__ - Average Y standard deviation in the frequency domain for the body linear acceleration Jerk signal
        + __FreqBodyAccJerkStdAvgZ__ - Average X standard deviation in the frequency domain for the body linear acceleration Jerk signal
    + Average X,Y,Z gyroscope angular velocity signal features in the frequency domain
        + __FreqBodyGyroMeanAvgX__ - Average X mean in the frequency domain for the gyroscope angular velocity signal
        + __FreqBodyGyroMeanAvgY__ - Average Y mean in the frequency domain for the gyroscope angular velocity signal
        + __FreqBodyGyroMeanAvgZ__ - Average Z mean in the frequency domain for the gyroscope angular velocity signal
        + __FreqBodyGyroStdAvgX__ - Average X mean in the frequency domain for the gyroscope angular velocity signal
        + __FreqBodyGyroStdAvgY__ - Average Y mean in the time domain for the gyroscope angular velocity signal 
        + __FreqBodyGyroStdAvgZ__ - Average Z mean in the time domain for the gyroscope angular velocity signal
    + Average magnitude signals of the three dimensional signals in the frequency domain, calculated using the Euclidean norm
        + __FreqBodyAccMagMeanAvg__ - Average magnitude mean of the three dimensional body accelerations in the frequency domain
        + __FreqBodyAccMagStdAvg__ - Average magnitude standard deviation of the three dimensional body accelerations in the frequency domain
        + __FreqBodyAccJerkMagMeanAvg__ - Average magnitude mean of the three dimensional linear acceleration body Jerk signals in the frequency domain
        + __FreqBodyAccJerkMagStdAvg__ - Average magnitude standard deviation of the three dimensional linear acceleration body Jerk signals in the frequency domain
        + __FreqBodyGyroMagMeanAvg__ - Average magnitude mean of the three dimensional gyroscope body angular velocities in the frequency domain
        + __FreqBodyGyroMagStdAvg__ - Average magnitude standard deviation of the three dimensional gyroscope body angular velocities in the frequency domain
        + __FreqBodyGyroJerkMagMeanAvg__ - Average magnitude mean of the three dimensional angular velocity body Jerk signals in the frequency domain
        + __FreqBodyGyroJerkMagStdAvg__ - Average magnitude standard deviation of the three dimensional angular velocity body Jerk signals in the frequency domain