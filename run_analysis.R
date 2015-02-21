## Necesary Information for doing this assesment, is located into several files.
## There are several variables studied. From those variables we have several features derived.
## Variables are:
##	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
##	- Triaxial Angular velocity from the gyroscope. 
##	- A 561-feature vector with time and frequency domain variables. 
##	- Its activity label. 
##	- An identifier of the subject who carried out the experiment.
##
## Some of those vars are 3D variables. SO they have 3D cartesians coordinates (I assumed but not verified)
## File features_info,txt explains which derived features we have. Every feature is transformed by a certain 
## operation, so a mean(), std(), min() Etc were applied to avery feature.
## 
## Note in a files somebody gives an email for helping?
## For more information about this dataset contact: activityrecognition@smartlab.ws

## Main function
run_analysis <- function ()
{
	install.packages("plyr")
	library("plyr")

	## It reads files and name dataframe columns for Training Data
	readTrainingData <- function ( commonFeatures )
	{
		## Trainig data
		## row headers 1 col called V1 and 7352 rows
		trainRowHeaders <- read.table("train/y_train.txt")

		## Subjects. 
		trainSubjects <- read.table("train/subject_train.txt")
	
		## Data set with  561 columns and 7352 rows
		trainDataFrame <- read.table("train/x_train.txt") 

		## so it is like a single dataframe. There will be 561 plus 1 cols per 7352 columns
		## column headers will be provided by commonFeatures.
		trainData <- cbind(trainRowHeaders , trainSubjects, traindataFrame )
		
		## lets fill col names. First column is from the y_File so 
		colnames (trainData) <- c("ActivityIndex" , "Subject", commonFeatures$V2)
		return (trainData )
	}

	## It reads files and name dataframe columns for Test Data
	readTestData <- function ( commonFeatures )
	{
		## Trainig data
		## row headers 1 col called V1 and 7352 rows
		testRowHeaders <- read.table("test/y_test.txt")
	
		## Subjects. I had forgot whe i was compiting mean on step 5
		testSubjects <- read.table("test/subject_test.txt")

		## Data set with  561 columns and 7352 rows
		testDataFrame <- read.table("test/x_test.txt") 

		## so it is like a single dataframe. There will be 561 plus 1 cols per 7352 columns
		## column headers will be provided by commonFeatures.
		testData <- cbind(testRowHeaders , testSubjects , testDataFrame )
	
		## lets fill col names. First column is from the y_File so 
		colnames (testData) <- c("ActivityIndex" , "Subject", commonFeatures$V2)
		return (testData)
	}

	## Read activity labels file and merge parameter data frame and readed activity dataframe
	addActivityNames <- function ( meanStrDataFrame )
	{
		## In order to be able to merge activities and activity names we need to read 
		## activity file set appropiate col names and merge by Activity Index
		activitiesDataFrame <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
		colnames(activitiesDataFrame) <- c("ActivityIndex", "ActivityName")
		return ( merge(meanStrDataFrame,  activitiesDataFrame, by = "ActivityIndex"))
	}

	## This function takes columns names to use. Mean and Std Cols
	## The question is meanFreq() is a mean()?. Info says
	## meanFreq(): Weighted average of the frequency components to obtain a mean frequency 
	##
	## The mean is the average of the numbers: a calculated "central" value of a set of numbers. 
	## meanFreq is not strictly a mean because is weighted, but it is an average, SO I WILL CONSIDER IT
	getColNamesToFilter <- function ( allDataFrame )
	{
		## Technically we could have a search pattern to grep mean. Pattern should not be case sensitive
		## Brackets should be escaped
 		meanColFiltered <- grep("mean\\(\\)", names(allDataFrame ), ignore.case=TRUE,value=FALSE)
		meanFreqColFiltered <- grep("meanFreq\\(\\)", names(allDataFrame ), ignore.case=TRUE,value=FALSE)	

		## it should be do for std too
		stdColFiltered <- grep("std\\(\\)", names(allDataFrame ), ignore.case=TRUE, value=FALSE)

		## Now lets subset allDataFrame extracting columuns listed into colIndex 
		## Lets consider that ActivityIndex and Subject must be conserved
		filteredColumns <- c(1, 2, meanColFiltered ,meanFreqColFiltered ,stdColFiltered)

		return (filteredColumns)
	}	

	## makeup column Names on set. Basically corrects some wrong names
	makeUpColumnNames <- function ( dataSet )
	{
		## it is a long vector with old and new names. Yes, but it was too late for gsub()
		oldvsNewNames = c ("fBodyBodyAccJerkMag-mean()" = "fBodyAccJerkMag-mean()",
				"fBodyBodyGyroMag-mean()" = "fBodyGyroMag-mean()",
				"fBodyBodyGyroJerkMag-mean()" = "fBodyGyroJerkMag-mean()",
				"fBodyBodyAccJerkMag-meanFreq()" = "fBodyAccJerkMag-meanFreq()",
				"fBodyBodyGyroMag-meanFreq()" = "fBodyGyroMag-meanFreq()",
				"fBodyBodyGyroJerkMag-meanFreq()" = "fBodyGyroJerkMag-meanFreq()",
				"fBodyBodyAccJerkMag-std()" = "fBodyAccJerkMag-std()",
				"fBodyBodyGyroMag-std()" = "fBodyGyroMag-std()",
				"fBodyBodyGyroJerkMag-std()" = "fBodyGyroJerkMag-std()" )

		dataSet <- rename(dataSet , replace = oldvsNewNames, warn_missing = TRUE)
		return (dataSet)
	}
	
	## Change final column Names.
	changeColumnNames <- function (tidyDataSet)
	{
		## it is a long vector with old and new names. Yes, but it was too late for gsub()
		oldvsNewNames = c( "ActivityIndex" = "ActivityIndex", "Subject" = "Subject", "ActivityName" = "ActivityName"      
				,"tBodyAcc-mean()-X" = "MeanTempBodyAccMeanX"
				,"tBodyAcc-mean()-Y" = "MeanTempBodyAccMeanY"
				,"tBodyAcc-mean()-Z" = "MeanTempBodyAccMeanZ"
				,"tGravityAcc-mean()-X" = "MeanTempGravityAccMeanX"
				,"tGravityAcc-mean()-Y" = "MeanTempGravityAccMeanY"
				,"tGravityAcc-mean()-Z" = "MeanTempGravityAccMeanZ"
				,"tBodyAccJerk-mean()-X" = "MeanTempBodyAccJerkMeanX"
				,"tBodyAccJerk-mean()-Y" = "MeanTempBodyAccJerkMeanY"
				,"tBodyAccJerk-mean()-Z" = "MeanTempBodyAccJerkMeanZ"
				,"tBodyGyro-mean()-X" = "MeanTempBodyGyroMeanX"
				,"tBodyGyro-mean()-Y" = "MeanTempBodyGyroMeanY"
				,"tBodyGyro-mean()-Z" = "MeanTempBodyGyroMeanZ"
				,"tBodyGyroJerk-mean()-X" = "MeanTempBodyGyroJerkMeanX"
				,"tBodyGyroJerk-mean()-Y" = "MeanTempBodyGyroJerkMeanY"
				,"tBodyGyroJerk-mean()-Z" = "MeanTempBodyGyroJerkMeanZ"
				,"tBodyAccMag-mean()" = "MeanTempBodyAccMagMean"
				,"tGravityAccMag-mean()" = "MeanTempGravityAccMagMean"
				,"tBodyAccJerkMag-mean()" = "MeanTempBodyAccJerkMagMean"
				,"tBodyGyroMag-mean()" = "MeanTempBodyGyroMagMean"
				,"tBodyGyroJerkMag-mean()" = "MeanTempBodyGyroJerkMagMean"
				,"fBodyAcc-mean()-X" = "MeanFourierBodyAccMeanX"
				,"fBodyAcc-mean()-Y" = "MeanFourierBodyAccMeanY"
				,"fBodyAcc-mean()-Z" = "MeanFourierBodyAccMeanZ"
				,"fBodyAccJerk-mean()-X" = "MeanFourierBodyAccJerkMeanX"
				,"fBodyAccJerk-mean()-Y" = "MeanFourierBodyAccJerkMeanY"
				,"fBodyAccJerk-mean()-Z" = "MeanFourierBodyAccJerkMeanZ"
				,"fBodyGyro-mean()-X" = "MeanFourierBodyGyroMeanX"
				,"fBodyGyro-mean()-Y" = "MeanFourierBodyGyroMeanY"
				,"fBodyGyro-mean()-Z" = "MeanFourierBodyGyroMeanZ"
				,"fBodyAccMag-mean()" = "MeanFourierBodyAccMagMean"
				,"fBodyAccJerkMag-mean()" = "MeanFourierBodyAccJerkMagMean"
				,"fBodyGyroMag-mean()" = "MeanFourierBodyGyroMagMean"
				,"fBodyGyroJerkMag-mean()" = "MeanFourierBodyGyroJerkMagMean"
				,"fBodyAcc-meanFreq()-X" = "MeanFourierBodyAccMeanFreqX"
				,"fBodyAcc-meanFreq()-Y" = "MeanFourierBodyAccMeanFreqY"
				,"fBodyAcc-meanFreq()-Z" = "MeanFourierBodyAccMeanFreqZ"
				,"fBodyAccJerk-meanFreq()-X" = "MeanFourierBodyAccJerkMeanFreqX"
				,"fBodyAccJerk-meanFreq()-Y" = "MeanFourierBodyAccJerkMeanFreqY"
				,"fBodyAccJerk-meanFreq()-Z" = "MeanFourierBodyAccJerkMeanFreqZ"
				,"fBodyGyro-meanFreq()-X" = "MeanFourierBodyGyroMeanFreqX"
				,"fBodyGyro-meanFreq()-Y" = "MeanFourierBodyGyroMeanFreqY"
				,"fBodyGyro-meanFreq()-Z" = "MeanFourierBodyGyroMeanFreqZ"
				,"fBodyAccMag-meanFreq()" = "MeanFourierBodyAccMagMeanFreq"
				,"fBodyAccJerkMag-meanFreq()" = "MeanFourierBodyAccJerkMagMeanFreq"
				,"fBodyGyroMag-meanFreq()" = "MeanFourierBodyGyroMagMeanFreq"
				,"fBodyGyroJerkMag-meanFreq()" = "MeanFourierBodyGyroJerkMagMeanFreq"
				,"tBodyAcc-std()-X" = "MeanTempBodyAccStandartDevX"
				,"tBodyAcc-std()-Y" = "MeanTempBodyAccStandartDevY"
				,"tBodyAcc-std()-Z" = "MeanTempBodyAccStandartDevZ"
				,"tGravityAcc-std()-X" = "MeanTempGravityAccStandartDevX"
				,"tGravityAcc-std()-Y" = "MeanTempGravityAccStandartDevY"
				,"tGravityAcc-std()-Z" = "MeanTempGravityAccStandartDevZ"
				,"tBodyAccJerk-std()-X" = "MeanTempBodyAccJerkStandartDevX"
				,"tBodyAccJerk-std()-Y" = "MeanTempBodyAccJerkStandartDevY"
				,"tBodyAccJerk-std()-Z" = "MeanTempBodyAccJerkStandartDevZ"
				,"tBodyGyro-std()-X" = "MeanTempBodyGyroStandartDevX"
				,"tBodyGyro-std()-Y" = "MeanTempBodyGyroStandartDevY"
				,"tBodyGyro-std()-Z" = "MeanTempBodyGyroStandartDevZ"
				,"tBodyGyroJerk-std()-X" = "MeanTempBodyGyroJerkStandartDevX"
				,"tBodyGyroJerk-std()-Y" = "MeanTempBodyGyroJerkStandartDevY"
				,"tBodyGyroJerk-std()-Z" = "MeanTempBodyGyroJerkStandartDevZ"
				,"tBodyAccMag-std()" = "MeanTempBodyAccMagStandartDev"
				,"tGravityAccMag-std()" = "MeanTempGravityAccMagStandartDev"
				,"tBodyAccJerkMag-std()" = "MeanTempBodyAccJerkMagStandartDev"
				,"tBodyGyroMag-std()" = "MeanTempBodyGyroMagStandartDev"
				,"tBodyGyroJerkMag-std()" = "MeanTempBodyGyroJerkMagStandartDev"
				,"fBodyAcc-std()-X" = "MeanFourierBodyAccStandartDevX"
				,"fBodyAcc-std()-Y" = "MeanFourierBodyAccStandartDevY"
				,"fBodyAcc-std()-Z" = "MeanFourierBodyAccStandartDevZ"
				,"fBodyAccJerk-std()-X" = "MeanFourierBodyAccJerkStandartDevX"
				,"fBodyAccJerk-std()-Y" = "MeanFourierBodyAccJerkStandartDevY"
				,"fBodyAccJerk-std()-Z" = "MeanFourierBodyAccJerkStandartDevZ"
				,"fBodyGyro-std()-X" = "MeanFourierBodyGyroStandartDevX"
				,"fBodyGyro-std()-Y" = "MeanFourierBodyGyroStandartDevY"
				,"fBodyGyro-std()-Z" = "MeanFourierBodyGyroStandartDevZ"
				,"fBodyAccMag-std()" = "MeanFourierBodyAccMagStandartDev"
				,"fBodyAccJerkMag-std()" = "MeanFourierBodyAccJerkMagStandartDev"
				,"fBodyGyroMag-std()" = "MeanFourierBodyGyroMagStandartDev"
				,"fBodyGyroJerkMag-std()" = "MeanFourierBodyGyroJerkMagStandartDev" )

		tidyDataSet <- rename(tidyDataSet , replace = oldvsNewNames, warn_missing = TRUE)
		return (tidyDataSet)
	}
	
	## It is necesary to write the obtained tidyDataSet
	## And to dump into a file with write.table
	dumpTidyDataSet <- function (dumpTidyDataSet)
	{
		## name of file
		tidyDataSetFileName <- c("tidyDataSet.txt")

		## Test should be played many times as you want. Delete File if exist
		if (file.exists(tidyDataSetFileName )) file.remove(tidyDataSetFileName )

		## it will be writed on my getwd()
		write.table(tidyDataSet, file =tidyDataSetFileName , sep = "\t", row.names = FALSE)
	}

	autotest <- function ()
	{
		data <- read.table("tidyDataSet.txt", header = TRUE)
		View(data)
	}
###################################################################
##	MAIN PROGRAM
###################################################################
	
	## I'm going to track the requirements step By step. But the 4th. This is because i can and i prefer
	## to work with good names better than Vn. Besides this, I think it is possible
	## to change order for obtaining more proficiency. I'm going to use DataFrames too
	## but it sure Data.Tables use could be better.
	## anyway "here we go"

	## 1. Merges the training and the test sets to create one data set.

	## I want to have names no factors, in order to set columns names properly
	## below. No worths the trouble to make a function for it
	commonFeatures = read.table("features.txt", stringsAsFactors =FALSE) 

	## lets read train data files, setting column names
 	trainDataFrame <- readTrainingData(commonFeatures)
	
	## lets read train data files, setting column names
 	testDataFrame <- readTestData(commonFeatures)
	
	## allDataFrame will have 10299 rows sum of 7352 (training) and 2947 (test)
	allDataFrame <- rbind(trainDataFrame , testDataFrame )

	## Getting mean and std cols we have lost first column. we have 10299 rows (of course)
	## and 80 columns.
	filteredColumns <- getColNamesToFilter (allDataFrame)
	meanStrDataFrame <- subset(allDataFrame, select = filteredColumns)

	## Requirement 3 says we data should have a descriptive name for activities
	## ActivityName will be the last column
	meanStrDataFrame <- addActivityNames (meanStrDataFrame)

	## Data set has appropiate names from the beginning. It easy to work if I manage descriptive names instead something like Vn 
	## But anyway there are colunm names that can be repaired
	meanStrDataFrame <- makeUpColumnNames ( meanStrDataFrame )

	## 5. From the data set in step 4, creates a second, independent tidy data set with
	## the average of each variable for each activity and each subject.
	## So it is the same that group by activity and then by subject.

	## num of cols is the limit of the data frame	
	numOfCols = ncol(meanStrDataFrame)

	## tapply does not run, fortunately there is a function called aggregate
	## Note When aggregate num of rows are resumed because a grouped mean has been taken.
	lstAgreggates <- c("ActivityName", "Subject")
	tidyDataSet <- aggregate(meanStrDataFrame[ 3:numOfCols-1 ], 
				by = meanStrDataFrame[lstAgreggates],  FUN=mean )

	## Lets set a better set of variables. From the begining we have been using original names
	## in order to made identification of each column easier.
	## But it better to use a different and more descriptive
	tidyDataSet <- changeColumnNames (tidyDataSet)

	## Finally we dump tidy data set into a file
	## Tidy? yes on my point of view: if we consider calculated means by group as a single observation it fits
	## these rules:
	## 	Each variable is in a column
	##	Each observation is in a row
	##	One table for each kind of variable
	##	There are no more tables than one
	## Of course, we can take original dataframe (combined of traing and test data) and add new columns to it
	## Containing new calculated values. It would fit the same laws, but then observations were different and 
	## new columns would repeat values every combination of ActivityIndex and Scope. 	
	dumpTidyDataSet (tidyDataSet)
	
	## Column names comes from the beginning, but now they have a mean() so 
	## it will be better to append a _main() to every column name but the first three

	## Finally we can autotest
	autotest()
	
	## return TidyDataSet	
	return (tidyDataSet) 
}
