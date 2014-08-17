## Coursera - Johns Hopkins University - Getting and Cleaning Data project - MJT 2014 2014-08-17 #########
## Code Book 

## Source files
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Processing Steps

1. train/* and test/* datasets were unioned and activity and subject keys merged in.
2. column names were applied from features.txt and cleaned for readability by removing punctionation.
3. columns were filtered on a select set of metrics, and only 'standard devaition' and 'mean' measures were used.
4. a summary per activity and subject was produced (HAR.txt).


## Result file (WearableComputing.txt)

Background:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

HAR.txt contains the following 26 columns

1           activity
Values range 1:6
-1 WALKING
-2 WALKING_UPSTAIRS
-3 WALKING_DOWNSTAIRS
-4 SITTING
-5 STANDING
-6 LAYING

2            subject
Volunteers values range from 1:30

3       tBodyAccstdX
4       tBodyAccstdY
5       tBodyAccstdZ
-time signal;body signal; body acceleration;standard deviation;X,Y & Z axial

6   tGravityAccmeanX
7   tGravityAccmeanY
8   tGravityAccmeanZ
-time signal;gravity signal;body accelereration;mean value;X,Y & Z axial

9    tGravityAccstdX
10   tGravityAccstdY
11   tGravityAccstdZ
-time signal;gravity signal;body acceleration;standard deviation;X,Y & Z axial

12  tBodyAccJerkstdX
13  tBodyAccJerkstdY
14  tBodyAccJerkstdZ
-time signal;body signal; body acceleration;jerk signal;standard deviation;X,Y & Z axial

15 tBodyGyroJerkstdX
16 tBodyGyroJerkstdY
17 tBodyGyroJerkstdZ
-time signal;body signal;gyroscope measure;jerk signal;standard deviation;X,Y & Z axial

18     fBodyAccmeanX
19     fBodyAccmeanY
20     fBodyAccmeanZ
-frequency domain signal;body acceleration;mean value;X,Y & Z axial

21      fBodyAccstdX
22      fBodyAccstdY
23      fBodyAccstdZ
-frequency domain signal;body acceleration;standard deviation;X,Y & Z axial

24  fBodyAccJerkstdX
25  fBodyAccJerkstdY
26  fBodyAccJerkstdZ
-frequency domain signal;body acceleration;jerk signal;standard deviation;X,Y & Z axial




