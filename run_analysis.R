### Getting and Cleaning Data Course Project

## 1. Download the file

# Set Working Directory
setwd("C:/Users/Yu-Chen Wang/Documents/My Box Files/R/Coursera/")

# Check if folder exist, then create the folder if it is needed
if (!file.exists("Getting_Cleaning")){
        dir.create("Getting_Cleaning")
}

# Set Url
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download the file to the working directory
download.file(file_url, destfile = "./Getting_Cleaning/Project.zip")

# Unzip the file
unzip(zipfile="./Getting_Cleaning/Project.zip", exdir = "./Getting_Cleaning")

## 2. Read the files

# Read training Data, save to "X_train", "y_train", and "subject_train"
X_train <- read.table("./Getting_Cleaning/UCI HAR Dataset/train/X_train.txt", sep = "", 
                      comment.char = "",colClasses="numeric", header = FALSE)
y_train <- read.table("./Getting_Cleaning/UCI HAR Dataset/train/y_train.txt", sep = "",
                      colClasses="character")
subject_train <- read.table("./Getting_Cleaning/UCI HAR Dataset/train/subject_train.txt", sep = "",
                            colClasses="numeric")

# Read testing Data, save to "X_test", "y_test", "subject_test"
X_test <- read.table("./Getting_Cleaning/UCI HAR Dataset/test/X_test.txt", sep = "", 
                      comment.char = "",colClasses="numeric", header = FALSE)
y_test <- read.table("./Getting_Cleaning/UCI HAR Dataset/test/y_test.txt", sep = "",
                     colClasses="character")
subject_test <- read.table("./Getting_Cleaning/UCI HAR Dataset/test/subject_test.txt", sep = "",
                           colClasses="numeric")

# Read variables, save to "features"
features <- read.table("./Getting_Cleaning/UCI HAR Dataset/features.txt", sep = "",
                       colClasses="character")

## 3. Merge Training and Testing Data

# Change the column name of the subject data to "Subject" in both trainging and testing data
colnames(subject_train) <- "Subject"
colnames(subject_test) <- "Subject"

# Change the column name of the activity data to "Activity" in both trainging and testing data
colnames(y_train) <- "Activity"
colnames(y_test) <- "Activity"

# Combine the main dataset, subject data, and activity data in both trainging and testing data
SummaryTraining <- cbind(X_train,subject_train,y_train)
SummaryTesting <- cbind(X_test,subject_test,y_test)

# Combine the "SummaryTraining" and "SummaryTesting" into "SummaryData"
SummaryData <- rbind(SummaryTraining,SummaryTesting)

## 4. Change Activity numbers to descriptive activity names

# I define the activity numbers to be the following terms based on the activity_labels.txt file:
# 1:walking, 2:walkingup, 3:walkingdown, 4:sitting, 5:standing, 6:laying

SummaryData$Activity[SummaryData$Activity == "1"] <- "walking"
SummaryData$Activity[SummaryData$Activity == "2"] <- "walkingup"
SummaryData$Activity[SummaryData$Activity == "3"] <- "walkingdown"
SummaryData$Activity[SummaryData$Activity == "4"] <- "sitting"
SummaryData$Activity[SummaryData$Activity == "5"] <- "standing"
SummaryData$Activity[SummaryData$Activity == "6"] <- "laying"

## 5. Find the variables with mean() and std() 

# Create an index called "meanindex" containing variables with the pattern string "mean()" in "features"   
meanindex <- grep("mean()",features[,2],value=FALSE,fixed=TRUE)

# Create an index called "stdindex" containing variables with the pattern string "std()" in "features"
stdindex <- grep("std()",features[,2],value=FALSE,fixed=TRUE)

# Create an index called "Dataindex", which combines "meanindex" and "stdindex", 
# for later subsetting the "SummaryData" to have the final raw output
Dataindex <- c(meanindex,stdindex)

## 6. Adjust the variable name
# Use gsub and sub function to adjust the variable names. 
# Please refer to the codebook.txt file for more information
aa <- features[,2]
bb <- gsub("\\()-","in",aa)
cc <- gsub("-","of",bb)
dd <- gsub("\\,","and",cc)
ee <- sub("tBody","TDSBody",dd)
ff <- sub("tGravity","TDSGravity",ee)
gg <- sub("fBody","FDS",ff)
hh <- sub("angle","Angle",gg)
ii <- sub("gravity","Gravity",hh,fixed=TRUE)
jj <- gsub("\\)","",ii)
kk <- gsub("\\(","",jj)

# Change the colname name of the "SummaryData" using the adjusted variable names,
# "Subject","Activity", and "Dataset" columns remain the same name.
colnames(SummaryData) <- c(kk, "Subject","Activity")

## 7. Create the final raw output dataframe
# Subset the "SummaryData" using "Dataindex", resulting in "SubSummaryData1"
SubSummaryData1 <- SummaryData[,Dataindex]

# Subset the "SummaryData" to select the "Subject", "Dataset", and "Activity" columns,
# resulting in "SubSummaryData2"
SubSummaryData2 <- SummaryData[,c("Subject","Activity")]

# Combine "SummaryData1" and "SummaryData2" to form the "FinalrawData"
FinalrawData <- cbind(SubSummaryData2,SubSummaryData1)

## 8. Calculate the average of each variable for each activity and each subject

# Load reshape2 package

library(reshape2)

# Melt "FinalrawData" based on "Subject" and "Activity" to form "FinalrawDataMelt"

FinalrawDataMelt <- melt(FinalrawData,id=c("Subject","Activity"))

# Calculate the average using for each activity and each subject using "dcast" function, 
# resulting in "FinalData" 

FinalData <- dcast(FinalrawDataMelt, Subject + Activity ~ variable, mean, margin = TRUE)


## Write the FinalData to .txt file
write.table(FinalData,file = "./Getting_Cleaning/UCI HAR Dataset/FinalData.txt",sep="\t",
            col.names=TRUE,row.names=FALSE)
