#Set Working Directory
wd <- "C:/R/R Project Week 3"
setwd(wd)

#Load packages if not already present
if(!require("data.table")){
        install.packages("data.table")
}

require("data.table")


#Upload all files to variables
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#select data that has std or mean
meanstd <- grepl("mean|std", features)

#Combining like datasets
subjectdata <- rbind(subject_test,subject_train)
activitydata <- rbind(y_test, y_train)
Mergeactivitydata <- merge(activitydata, activity_labels)
featuresdata <- rbind(x_test,x_train)


#Adding header names to datasets
names(subjectdata) <- c("Subject")
names(Mergeactivitydata) <- c("Activity", "Label")
names(featuresdata) <- features

#Extract std or mean
featuresdataspec <- featuresdata[,meanstd]

#combine data
combined <- cbind(Mergeactivitydata,subjectdata)
tidy <- cbind(featuresdataspec, combined)

#Tidy Set 2
tidy_two <- colMeans(data.matrix(tidy[sapply(tidy, is.numeric)]))
