##########################################################################################################
## Coursera - Johns Hopkins University - Getting and Cleaning Data project - MJT 2014 2014-08-17 #########
##########################################################################################################
fnMain = function(foldername) ## fnMain is the main function containing other functions
{
    cols <- NA
    cleanCols <- NA
    colSubset <- NA
    folderpath <-paste(foldername,"\\",sep="")
    dfTrain <- NA
    dfTest <- NA
  
  readcsv<- function(file) {
    filepath <- paste(folderpath,file,sep="")
    read.csv(filepath, header = FALSE, sep = "", skip = 0)
  }
  
  loadCols <- function() {
    print ("Columns")
    cols <- readcsv("features.txt") # read column names from features.txt file
    cleanCols <<- gsub("[\\(\\)\\,\\-]","",cols[,2]) # clean column names - by excluding "(",")","-",","

    colSubset <<- sort( # identify position of selected mean/std columns for filtering
      c( grep('tBodyAcc\\-(mean\\(\\-|std){1}'        ,cols[,2] )
         ,grep('fBodyAcc\\-(mean\\(|std){1}'          ,cols[,2] )
         ,grep('tGravityAcc\\-(mean\\(|std){1}'       ,cols[,2] )
         ,grep('tBodyGyr\\-(mean\\(|std){1}'          ,cols[,2] )
         ,grep('fBodyGyr\\-(mean\\(\\-|std){1}'       ,cols[,2] )
         ,grep('tBodyAccJerk\\-(mean\\(\\-|std){1}'   ,cols[,2] )
         ,grep('fBodyAccJerk\\-(mean\\(\\-|std){1}'   ,cols[,2] )
         ,grep('tBodyGyroJerk\\-(mean\\(\\-|std){1}'  ,cols[,2] )))
  }
  
  getMetrics <- function(mfile,sfile,afile) {
    metrics          <- readcsv(mfile) # load metrics
    subject          <- readcsv(sfile) # load subject
    activity         <- readcsv(afile) # load activity
    
    if (is.na(cols) | is.na(cleanCols) | is.na(colSubset))
      loadCols() # extract columns if not already present
    
    colnames(metrics)  <- cleanCols          # apply clean names
    metrics            <- metrics[,colSubset]  # exclude columns
    metrics$activity   <- activity[,1]       # add activity column
    metrics$subject    <- subject[,1]        # add subject column
    
    metrics    
    
  } 

  getMerged_TrainTest <- function() {
    if (is.na(dfTest))
      dfTest    <<- getMetrics("test\\X_test.txt","test\\subject_test.txt","test\\y_test.txt")

    if (is.na(dfTrain))
      dfTrain   <<- getMetrics("train\\X_train.txt","train\\subject_train.txt","train\\y_train.txt")
    
    merged = rbind(dfTest,dfTrain) ## combine training and test datasets
    merged
  }
  
  getAverage_TrainTest <- function() {
    
    m<- getMerged_TrainTest()
    avg <- aggregate(m,by=list(m$activity, m$subject), FUN=mean, na.rm=TRUE)
    avg$subject  <- NULL # remove duplicate subject
    avg$activity <- NULL # remove duplicate activity
    
    colnames(avg)[1] <- "activity" # rename aggregate generated activity
    colnames(avg)[2] <- "subject" # rename aggregate generated subject
    avg    
    
  }
  
  list(getMerged_TrainTest=getMerged_TrainTest,getMetrics=getMetrics,getAverage_TrainTest=getAverage_TrainTest,readcsv=readcsv) # functions to expose
  
}
################################################################################################################
## The code below shows two ways (instantiate and static) to generate the tidy data set from the functions above
################################################################################################################
## 1. Instantiate 'fnMain' like an OO class and call functions
f<- fnMain("UCI HAR Dataset");a<- f$getAverage_TrainTest()
write.table(a,"WearableComputing.txt",sep=",",row.name=FALSE,col.names=TRUE)
##f$getMetrics("test\\X_test.txt","test\\subject_test.txt","test\\y_test.txt") ## example only
##f$getMerged_TrainTest() ## example only
#################################################################################################################
## 2. Call static-like functions on 'fnMain' directly
write.table(fnMain("UCI HAR Dataset")$getAverage_TrainTest()
            ,"WearableComputing.txt",sep=",",row.name=FALSE,col.names=TRUE)
##fnMain("UCI HAR Dataset\\")$getMetrics("train\\X_train.txt","train\\subject_train.txt","train\\y_train.txt") ##example only
##fnMain("UCI HAR Dataset")$getAverage_TrainTest() ## example only
#################################################################################################################