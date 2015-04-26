## run_analysis.R

runAnalysis <- function () {


## create the data frame for the tidy data set 

tdsdfl = NULL
  
## start Populating the data. Read the subject names and write in Col 1
subtest <- read.table("./test/subject_test.txt")
subtrain <- read.table("./train/subject_train.txt")
sub <- c(subtest[,1],subtrain[,1])
tdsdfl$SUBJECT <- sub

## Activity Names in Col 2 
acttest <- read.table("./test/y_test.txt")
acttrain <- read.table("./train/y_train.txt")
act <- c(acttest[,1],acttrain[,1])
tdsdfl$ACTIVITY <- act

## create a vector with the index number of the mean and SD of the relevant vars to be copied to tidy data set 

idx <- c(1:6,41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

## read the two data tables - test and train
dtest <- read.table("./test/X_test.txt")
dtrain <- read.table("./train/X_train.txt")

## Write to tidy data set. Only column numbers in idx vector above are relevant (mean, sd)
tdsdfd <- rbind(dtest[,idx],dtrain[,idx])

colnames (tdsdfd) <- c("tBodyAcc-X-Mean_1","tBodyAcc-Y-Mean_2", "tBodyAcc-Z-Mean_3", "tBodyAcc-X-SD_4","tBodyAcc-Y-SD_5","tBodyAcc-Z-SD_6","tGravityAcc-X-Mean_41", "tGravityAcc-Y-Mean_42","tGravityAcc-Z-Mean_43", "tGravityAcc-X-SD_44","tGravityAcc-Y-SD_45","tGravityAcc-Z-SD_46","tBodyAccJerk-X-Mean_81", "tBodyAccJerk-Y-Mean_82","tBodyAccJerk-Z-Mean_83","tBodyAccJerk-X-SD_84","tBodyAccJerk-Y-SD_85","tBodyAccJerk-Z-SD_86","tBodyGyro-X-Mean_121","tBodyGyro-Y-Mean_122","tBodyGyro-Z-Mean_123","tBodyGyro-X-SD_124","tBodyGyro-Y-SD_125","tBodyGyro-Z-SD_126","tBodyGyroJerk-X-Mean_161","tBodyGyroJerk-Y-Mean_162","tBodyGyroJerk-Z-Mean_163","tBodyGyroJerk-X-SD_164","tBodyGyroJerk-Y-SD_165","tBodyGyroJerk-Z-SD_166","tBodyAccMag-Mean_201","tBodyAccMag-SD_202","tGravityAccMag-Mean_214","tGravityAccMag-SD_215","tBodyAccJerkMag-Mean_227","tBodyAccJerkMag-SD_228","tBodyGyroMag-Mean_240","tBodyGyroMag-SD_241","tBodyGyroJerkMag-Mean_253","tBodyGyroJerkMag-SD_254","fBodyAcc-X-Mean_266","fBodyAcc-Y-Mean_267","fBodyAcc-Z-Mean_268","fBodyAcc-X-SD_269","fBodyAcc-Y-SD_270","fBodyAcc-Z-SD_271","fBodyAccJerk-X-Mean_345","fBodyAccJerk-Y-Mean_346","fBodyAccJerk-Z-Mean_347","fBodyAccJerk-X-SD_348","fBodyAccJerk-Y-SD_349","fBodyAccJerk-Z-SD_350","fBodyGyro-X-Mean_424","fBodyGyro-Y-Mean_425","fBodyGyro-Z-Mean_426","fBodyGyro-X-SD_427","fBodyGyro-Y-SD_428","fBodyGyro-Z-SD_429","fBodyAccMag-Mean_503","fBodyAccMag-SD_504","fBodyAccJerkMag-Mean_516","fBodyAccJerkMag-SD_517","fBodyGyroMag-Mean_529","fBodyGyroMag-SD_530","fBodyGyroJerkMag-Mean_542","fBodyGyroJerkMag-SD_543")


## Column bind the tdfdfl and tdsdfd data frames to create the final data frame
tdsdf <- cbind(tdsdfl,tdsdfd)
tdsdf$ACTIVITY <- lapply(tdsdf$ACTIVITY, getActName)
tdsdf <- transform(tdsdf,ACTIVITY=unlist(ACTIVITY))

## write the file now 

write.table(tdsdf, file = "tidydataset.txt", col.names = TRUE, row.names = FALSE)

## create a second tidy data set with the average of each variable for each activity and each subject

tdsdf2 <- tdsdf %>% group_by(SUBJECT, ACTIVITY) %>% summarise_each(funs(mean))

}

getActName <- function (actID) {
 if (actID == 1) return ("WALKING")
 else if (actID == 2) return ("WALKING_UPSTAIRS")
 else if (actID == 3) return ("WALKING_DOWNSTAIRS")
 else if (actID == 4) return ("SITTING")
 else if (actID == 5) return ("STANDING")
 else if (actID == 6) return ("LAYING")
 else return ("UNKNOWN_ACTIVITY")
  
}