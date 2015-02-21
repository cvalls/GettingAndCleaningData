==================================================================
Tidy data preparation
Version 1.0
==================================================================
Carlos Valls Hernandez for Getting and Cleaning Data course project
cvalls666@hotmail.com
==================================================================

# GettingAndCleaningData Project
Files for submmit the project of the course


#INPUT
The programs feeds from files on working directory and some subdirectories.

	Train is a subdirector with Training data
		Contains:
			y_train.txt    		- Training labels.
			x_train.txt		- Contains common Features for working
			subject_train.txt	- Contains Subject Data.  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

	Test is a subdirector with Test data
		Contains
			y_test.txt		- Test labels.
			x_test.txt		- Contains common Features for working
			subject_test.txt	- Contains Subject Data.  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

	Working Directory contains
		features.txt			- List of all features.Used for setting column names

		activity_labels.txt		- Contains Description of indexed activities from y_train.txt and y_test.txt files

Other files contained on the directory are not used by the program
	features_info.txt describes all features. Usefull for know variables but not for computing
	
======================================

#OUTPUT
Output is a file in txt format. 
	Contains 81 columns 	first is index name 
				second is Subject id
				rest of columns are variables selected from those variables wiht mean or std in original files
						Those cols are computed by the program

	The file Contains headers
	Separator is a \t character.

======================================
#PROCESS
======================================
Notes:
1. There are several functiomns define in order to structure the code.
2. Variables use camecase an are descriptive.
3. There is a lot of comments. 
4. A Automatict test has been included for let checking results. Output is the file of course, but a View of that file too, with appropiate names
5. It produces a Tidy data set in the short form.

1. Read The features.txt file for obtaining the var names so it will be col names-
2. Read the data from training set (train directory), and set its appropiate column names, including an ActivityIndex and Subject Column Name
3. Read the data from test set (test directory), and set  its appropiate column names, including an ActivityIndex and Subject Column Name
4. Training and test has the same format, and column position, so it is posible to merge all rows from both sets
	So a new dataframe is created
	## TrainDataFrame dim is 7352 rows * 561 cols
	## TestDataFrame dim is  2947 rows * 561 cols
	##                      ------
	## Combined is          10299 rows
	##
5. Extract only columns with mean Value and std standard deviation.
	## The question is meanFreq() is a mean()?. Info says
	## meanFreq(): Weighted average of the frequency components to obtain a mean frequency 
	##
	## The mean is the average of the numbers: a calculated "central" value of a set of numbers. 
	## meanFreq is not strictly a mean because is weighted, but it is an average, SO I WILL CONSIDER IT
6. Joinn activity Index and activity names
7. Make Up Inital columns.Used columns came from the features, but some variables had some errors like a Double Body. It have been fixed
8. Aggregate filter data set by ActivityName and Subject and compute a mean of every groups. So we get a new set
9. Change Tidy Data Frame Column Names by more appropiate Name. Criteria are
	* Time as Time Domain Still Remains at the begining of the variable name
	* Fourier as FFT (Frecuency Domain) Still Remains at the begining of the variable name
	* Every "-" character have on original variable names have been removed
	* Every "(" and ")" characteres have on original variable names have been removed
	* Camel case has been implemented
	* Units in every variable remains the same from the raw data
10. Write the tidy data set as a new file tidyDataSet.txt
11. Reads the file and present a table on screen with the overall result set

#License:
========
Use of this program its free for everybody who want to learn and fount it usefull
Carlos A. Valls Hernández 19/02/2015
