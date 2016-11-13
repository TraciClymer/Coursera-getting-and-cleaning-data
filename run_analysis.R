if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")

#Unzip Dataset to the /data directory
unzip(zipfile = "./data/Dataset.zip", exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")

#Read in Activity files
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)

#Read in Subject files
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

#Read in Features files
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)

#Merge training and test sets to a single dataset
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

#Merge columns to create a single dataframe
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

#Subset name of features by measurements on the mean and std dev
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

#Subset "Data" dataframe by feature names
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
Data <- subset(Data, select = selectedNames)

#Factorize activity variable with descriptive activity names
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
Data$activity <- factor(Data$activity, label = activityLabels$V2)

#Rename remaining variables with more descriptive names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Create separate tidy data set as output
library(plyr);
Data2 <- aggregate(. ~subject + activity, Data, mean)
Data2 <- Data[order(Data2$subject, Data2$activity),]
write.table(Data2, file = "tidydata.txt", row.name=FALSE)


