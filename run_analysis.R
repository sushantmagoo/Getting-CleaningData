
# Getting and Cleaning Data



#read the feature file
 features <- read.table("features.txt")

#get column names from second row of feature file
 colname <- features[, 2]



#read the xTest file
 xTest <- read.table("test/X_test.txt", col.names=colname)

#read the yTest file
 yTest <- read.table("test/y_test.txt", col.names="activity")

#read the subject_teast file
 subTest <- read.table("test/subject_test.txt", col.names="subject")

#binding them column wise
 testData <- cbind(subTest, yTest, xTest)



#read the xTrain file
 xTrain <- read.table("train/X_train.txt", col.names=colname)

#read the yTrain file
 yTrain <- read.table("train/y_train.txt", col.names="activity")

#read the subject_train file
 subTrain <- read.table("train/subject_train.txt", col.names="subject")

#binding them column wise
 trainData <- cbind(subTrain, yTrain, xTrain)



#binding test & train data row wise
 fullData <- rbind(testData, trainData)



#only "mean", "std", "subject", "activity" columns will be included
 columnIncluded <- "mean|std|subject|activity"

 cleanData <- fullData[, grep(columnIncluded, names(fullData))]

#removes unwanted objects
 cleanName <- gsub("\\(|\\)|-|,", "", names(cleanData))

 names(cleanData) <- cleanName

#write this into a new file (now this is clean & tidy data)
 write.table(cleanData, "cleanData.txt", sep="\t")



#import plyr library
 library(plyr)

#average of subject & activity
 average<-ddply(cleanData, .(subject ,activity), numcolwise(mean))

#write this into a second file (now this file has average of each variable for each activity and each subject)
 write.table(average, "average.txt", sep="\t")

