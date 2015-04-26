==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.1
==================================================================
BY - GAURAV CHATURVEDI 
==================================================================
This is a tidy version ("tidy data set") of the original data ("original data set") from Smartlab (www.smartlab.ws)

The data pertains to experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Parameters described below were obtained for a total of 10299 observations.  

The tidy set has the below modifications from the original data set:

- The data has been integrated into 1 file - The original data set had multiple files with data about 10299 observations. This has been merged into 1 file now for ease of analysis / understanding 
- The "original data set" had data partioned in 2 sets; with 2947 obervations in a test set and 7352 observations in a train set.The test and trial data sets have been merged 
- For each observation the "original data set" had 561 parameters for each observation. The "tidy data set" only reports the mean and SD for the below 32 variables (total 64 parameters)
- The tidy data set uses descriptive activity names. The "original data set" used codes to denote the activity


The Mean, SD for the following 32 variables are included in each observation:
===========================================================================


tBodyAcc-XYZ (3) 
tGravityAcc-XYZ (3)
tBodyAccJerk-XYZ (3)
tBodyGyro-XYZ (3)
tBodyGyroJerk-XYZ (3)
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ (3)
fBodyAccJerk-XYZ (3)
fBodyGyro-XYZ (3)
fBodyAccMag 
fBodyAccJerkMag 
fBodyGyroMag
fBodyGyroJerkMag

