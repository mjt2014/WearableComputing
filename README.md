##########################################################################################################
##############################run_analysis.R##############################################################
##########################################################################################################
## Coursera - Johns Hopkins University - Getting and Cleaning Data project - MJT 2014 2014-08-17 #########
##########################################################################################################

It is assumed that the data has already been downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and unzipped into a folder called "UCI HAR Dataset" in the working directory.

##########################################################################################################
The run_analysis.R file contains the following 6 functions for 

1. fnMain() 
This is the root function containing all other functions and variables for caching data.
It accepts the folder (eg."UCI HAR Dataset") path as a parameter.
It can either be instantiated with its child functions, or have its functions called as static functions. (See below)

fnMain can be instantiated as an OO class and functions subsequently called:
eg. 
> f<- Main("UCI HAR Dataset")
> f$getSummary_TrainTest()

OR

Can be treated as a static class/function:
eg.
> fnMain("UCI HAR Dataset")$getSummary_TrainTest()

2. readcsv()
Wrapper function for the R base read.csv function passing in attributes. It accepts the filename and optionally the parent folder as a parameter (eg. "test\\subject_test.txt"), but also uses the root folderpath property from fnMain.

3. loadCols()
- Retrieves the column names of the metrics from the features.txt file and stores in the 'cols' property of fnMain.
- Cleans the filenames to remove punctuation to make them more readable, and stores in the 'cleanCols' property of fnMain.
- Filters the columns to those 'std' and 'mean' metrics, and stores in the 'colSubset' property of fnMain.

4. getMetrics()
- Retieves data from the metrics (x_*.txt), subject (subject_*.txt) and activity (y_*.txt) files.
- Applies the cleaned metric column names from the vector supplied in loadCols().
- Adds in 'subject' and 'activity' columns.

5. getMerged_TrainTest()
- Calls the getMetrics function passing in Test and Train filenames
- Unions the resulting data frames
- Caches Test and Train data frames so they don't need to be extracted from the csv files when fnMain is instantiated.

6. getAverage_TrainTest()
- Applies an average calculation per activity and subject to the data frame retrieved from the getMerged_TrainTest().function.

##########################################################################################################
