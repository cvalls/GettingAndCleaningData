#CodeBook
This is a code book that describes the variables, data, transformations for the getting and cleaning course

## The data source

*Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Source Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Source data

The dataset includes the following files:
*'README.txt'
*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'train/X_train.txt': Training set.
*'train/y_train.txt': Training labels.
*'test/X_test.txt': Test set.
*'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
*'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
*'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
*'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
*'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## The Output data
Output data is stored in file :  tidyDataSet.txt

It is Tidy because 
*Every line is an observation.
*Every variable is in a column
*Observation is calculated grouping mean variables from origin data by Activity and Subject (in this order). 
*Every line has observations from several variables which are described in features_info.txt.
*Correspondence between original and new variables is below.

### Considerations
*This files has /t as separator. 
*Column names are based on Source file features.txt. 
*Each column different than activity and subject is a mean group by Activity Name Source column of the Corresponding variable on features.txt. 
*Names on columns do reflect this fact with the  Mean prefix.
*Var names has descriptive names 
	** Time as Time Domain Still Remains at the begining of the variable name
	** Fourier as FFT (Frecuency Domain) Still Remains at the begining of the variable name
	** Every "-" character have on original variable names have been removed
	** Every "(" and ")" characteres have on original variable names have been removed
	** Camel case has been implemented
	** Units in every variable remains the same from the raw data
* Due it is consider a new group of variables and observations, a GrpByActSubMean Suffix have been added
	
###Variable Names List
* Subject:	An identifier of the subject who carried out the experiment (Subject). Its range is from 1 to 30.           
* ActivityIndex: An activity Index of Activity : 1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING
* ActivityName: An activity string with the description of Activity : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* MeanTempBodyAccMeanX Search for tBodyAcc-mean()-X into 'features_info.txt' for variable description                           
* MeanTempBodyAccMeanY Search for tBodyAcc-mean()-Y into 'features_info.txt' for variable description                           
* MeanTempBodyAccMeanZ Search for tBodyAcc-mean()-Z into 'features_info.txt' for variable description                           
* MeanTempGravityAccMeanX Search for tGravityAcc-mean()-X into 'features_info.txt' for variable description                     
* MeanTempGravityAccMeanY Search for tGravityAcc-mean()-Y into 'features_info.txt' for variable description                     
* MeanTempGravityAccMeanZ Search for tGravityAcc-mean()-Z into 'features_info.txt' for variable description                     
* MeanTempBodyAccJerkMeanX Search for tBodyAccJerk-mean()-X into 'features_info.txt' for variable description                   
* MeanTempBodyAccJerkMeanY Search for tBodyAccJerk-mean()-Y into 'features_info.txt' for variable description                   
* MeanTempBodyAccJerkMeanZ Search for tBodyAccJerk-mean()-Z into 'features_info.txt' for variable description                   
* MeanTempBodyGyroMeanX Search for tBodyGyro-mean()-X into 'features_info.txt' for variable description                         
* MeanTempBodyGyroMeanY Search for tBodyGyro-mean()-Y into 'features_info.txt' for variable description                         
* MeanTempBodyGyroMeanZ Search for tBodyGyro-mean()-Z into 'features_info.txt' for variable description                         
* MeanTempBodyGyroJerkMeanX Search for tBodyGyroJerk-mean()-X into 'features_info.txt' for variable description                 
* MeanTempBodyGyroJerkMeanY Search for tBodyGyroJerk-mean()-Y into 'features_info.txt' for variable description                 
* MeanTempBodyGyroJerkMeanZ Search for tBodyGyroJerk-mean()-Z into 'features_info.txt' for variable description                 
* MeanTempBodyAccMagMean Search for tBodyAccMag-mean() into 'features_info.txt' for variable description                        
* MeanTempGravityAccMagMean Search for tGravityAccMag-mean() into 'features_info.txt' for variable description                  
* MeanTempBodyAccJerkMagMean Search for tBodyAccJerkMag-mean() into 'features_info.txt' for variable description                
* MeanTempBodyGyroMagMean Search for tBodyGyroMag-mean() into 'features_info.txt' for variable description                      
* MeanTempBodyGyroJerkMagMean Search for tBodyGyroJerkMag-mean() into 'features_info.txt' for variable description              
* MeanFourierBodyAccMeanX Search for fBodyAcc-mean()-X into 'features_info.txt' for variable description                        
* MeanFourierBodyAccMeanY Search for fBodyAcc-mean()-Y into 'features_info.txt' for variable description                        
* MeanFourierBodyAccMeanZ Search for fBodyAcc-mean()-Z into 'features_info.txt' for variable description                        
* MeanFourierBodyAccJerkMeanX Search for fBodyAccJerk-mean()-X into 'features_info.txt' for variable description                
* MeanFourierBodyAccJerkMeanY Search for fBodyAccJerk-mean()-Y into 'features_info.txt' for variable description                
* MeanFourierBodyAccJerkMeanZ Search for fBodyAccJerk-mean()-Z into 'features_info.txt' for variable description                
* MeanFourierBodyGyroMeanX Search for fBodyGyro-mean()-X into 'features_info.txt' for variable description                      
* MeanFourierBodyGyroMeanY Search for fBodyGyro-mean()-Y into 'features_info.txt' for variable description                      
* MeanFourierBodyGyroMeanZ Search for fBodyGyro-mean()-Z into 'features_info.txt' for variable description                      
* MeanFourierBodyAccMagMean Search for fBodyAccMag-mean() into 'features_info.txt' for variable description                     
* MeanFourierBodyAccJerkMagMean Search for fBodyBodyAccJerkMag-mean() into 'features_info.txt' for variable description         
* MeanFourierBodyGyroMagMean Search for fBodyBodyGyroMag-mean() into 'features_info.txt' for variable description               
* MeanFourierBodyGyroJerkMagMean Search for fBodyBodyGyroJerkMag-mean() into 'features_info.txt' for variable description       
* MeanFourierBodyAccMeanFreqX Search for fBodyAcc-meanFreq()-X into 'features_info.txt' for variable description                
* MeanFourierBodyAccMeanFreqY Search for fBodyAcc-meanFreq()-Y into 'features_info.txt' for variable description                
* MeanFourierBodyAccMeanFreqZ Search for fBodyAcc-meanFreq()-Z into 'features_info.txt' for variable description                
* MeanFourierBodyAccJerkMeanFreqX Search for fBodyAccJerk-meanFreq()-X into 'features_info.txt' for variable description        
* MeanFourierBodyAccJerkMeanFreqY Search for fBodyAccJerk-meanFreq()-Y into 'features_info.txt' for variable description        
* MeanFourierBodyAccJerkMeanFreqZ Search for fBodyAccJerk-meanFreq()-Z into 'features_info.txt' for variable description        
* MeanFourierBodyGyroMeanFreqX Search for fBodyGyro-meanFreq()-X into 'features_info.txt' for variable description              
* MeanFourierBodyGyroMeanFreqY Search for fBodyGyro-meanFreq()-Y into 'features_info.txt' for variable description 
* MeanFourierBodyGyroMeanFreqZ Search for fBodyGyro-meanFreq()-Z into 'features_info.txt' for variable description              
* MeanFourierBodyAccMagMeanFreq Search for fBodyAccMag-meanFreq() into 'features_info.txt' for variable description
* MeanFourierBodyAccJerkMagMeanFreq Search for fBodyBodyAccJerkMag-meanFreq() into 'features_info.txt' for variable description  	
* MeanFourierBodyGyroMagMeanFreq Search for fBodyBodyGyroMag-meanFreq() into 'features_info.txt' for variable description
* MeanFourierBodyGyroJerkMagMeanFreq Search for fBodyBodyGyroJerkMag-meanFreq() into 'features_info.txt' for variable descriptio
* MeanTempBodyAccStandartDevX Search for tBodyAcc-std()-X into 'features_info.txt' for variable description                     
* MeanTempBodyAccStandartDevY Search for tBodyAcc-std()-Y into 'features_info.txt' for variable description                     
* MeanTempBodyAccStandartDevZ Search for tBodyAcc-std()-Z into 'features_info.txt' for variable description                     
* MeanTempGravityAccStandartDevX Search for tGravityAcc-std()-X into 'features_info.txt' for variable description               
* MeanTempGravityAccStandartDevY Search for tGravityAcc-std()-Y into 'features_info.txt' for variable description               
* MeanTempGravityAccStandartDevZ Search for tGravityAcc-std()-Z into 'features_info.txt' for variable description               
* MeanTempBodyAccJerkStandartDevX Search for tBodyAccJerk-std()-X into 'features_info.txt' for variable description             
* MeanTempBodyAccJerkStandartDevY Search for tBodyAccJerk-std()-Y into 'features_info.txt' for variable description             
* MeanTempBodyAccJerkStandartDevZ Search for tBodyAccJerk-std()-Z into 'features_info.txt' for variable description             
* MeanTempBodyGyroStandartDevX Search for tBodyGyro-std()-X into 'features_info.txt' for variable description                   
* MeanTempBodyGyroStandartDevY Search for tBodyGyro-std()-Y into 'features_info.txt' for variable description                   
* MeanTempBodyGyroStandartDevZ Search for tBodyGyro-std()-Z into 'features_info.txt' for variable description                   
* MeanTempBodyGyroJerkStandartDevX Search for tBodyGyroJerk-std()-X into 'features_info.txt' for variable description           
* MeanTempBodyGyroJerkStandartDevY Search for tBodyGyroJerk-std()-Y into 'features_info.txt' for variable description           
* MeanTempBodyGyroJerkStandartDevZ Search for tBodyGyroJerk-std()-Z into 'features_info.txt' for variable description           
* MeanTempBodyAccMagStandartDev Search for tBodyAccMag-std() into 'features_info.txt' for variable description                  
* MeanTempGravityAccMagStandartDev Search for tGravityAccMag-std() into 'features_info.txt' for variable description            
* MeanTempBodyAccJerkMagStandartDev Search for tBodyAccJerkMag-std() into 'features_info.txt' for variable description          
* MeanTempBodyGyroMagStandartDev Search for tBodyGyroMag-std() into 'features_info.txt' for variable description                
* MeanTempBodyGyroJerkMagStandartDev Search for tBodyGyroJerkMag-std() into 'features_info.txt' for variable description        
* MeanFourierBodyAccStandartDevX Search for fBodyAcc-std()-X into 'features_info.txt' for variable description                  
* MeanFourierBodyAccStandartDevY Search for fBodyAcc-std()-Y into 'features_info.txt' for variable description                  
* MeanFourierBodyAccStandartDevZ Search for fBodyAcc-std()-Z into 'features_info.txt' for variable description                  
* MeanFourierBodyAccJerkStandartDevX Search for fBodyAccJerk-std()-X into 'features_info.txt' for variable description          
* MeanFourierBodyAccJerkStandartDevY Search for fBodyAccJerk-std()-Y into 'features_info.txt' for variable description          
* MeanFourierBodyAccJerkStandartDevZ Search for fBodyAccJerk-std()-Z into 'features_info.txt' for variable description          
* MeanFourierBodyGyroStandartDevX Search for fBodyGyro-std()-X into 'features_info.txt' for variable description                
* MeanFourierBodyGyroStandartDevY Search for fBodyGyro-std()-Y into 'features_info.txt' for variable description                
* MeanFourierBodyGyroStandartDevZ Search for fBodyGyro-std()-Z into 'features_info.txt' for variable description                
* MeanFourierBodyAccMagStandartDev Search for fBodyAccMag-std() into 'features_info.txt' for variable description               
* MeanFourierBodyAccJerkMagStandartDev Search for fBodyBodyAccJerkMag-std() into 'features_info.txt' for variable description   
* MeanFourierBodyGyroMagStandartDev Search for fBodyBodyGyroMag-std() into 'features_info.txt' for variable description         
* MeanFourierBodyGyroJerkMagStandartDev Search for fBodyBodyGyroJerkMag-std() into 'features_info.txt' for variable description 

##Transformation details
Please refer to readme.md for process explaining
