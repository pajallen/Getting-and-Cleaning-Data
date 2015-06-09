## run_analysis.R does the following:
## 1. Merges the training and the test sets to create one data set.
##    In .\UCI HAR Dataset\test\, X_test.txt,subject_test.txt and y_test.txt
##    In .\UCI HAR Dataset\test\, X_test.txt,subject_test.txt and y_test.txt
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set from the data set in step 4 with the average of   
##    each variable for each activity and each subject.

####################################################################################################
## Set working environment.                                                                       ##
####################################################################################################

## load required libraries ##
library(reshape2)

## set working directory. "UCI HAR Dataset" must be a sub-dir of your working direcory ##
setwd("~/R/Getting and Cleaning Data/")

####################################################################################################
## Read input files                                                                               ##
####################################################################################################

## read "X" data files from test and train and combine them as "data"
X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
data <- rbind(X_test, X_train)

## read "Y" activity labels files from test and train and combine them as "label"
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
label <- rbind(y_test, y_train)

## read "subject" data files from test and train and combine them as "subject"
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test, subject_train)

## read "features" data set which decodes the columns in "data"
features <- read.table("./UCI HAR Dataset/features.txt")

## read activity label descriptors table
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

####################################################################################################
## Refine "data" by identifying columns in "data" containing mean or std and reduce "data" to     ##
## those columns; -mean() and -std() and add descriptive column names                             ##
####################################################################################################

mean_or_std <- grep("-mean\\(\\)|-std\\(\\)",features[ ,2])  ## find mean() or std()
data <- data[,mean_or_std] ## select only columns containing mean() or std()
names(data) <- tolower(gsub("\\(|\\)", "", features[mean_or_std,2])) ## update data column names 
                                                                     ## with descriptive names

####################################################################################################
## Translate label values to descriptive activity names and name column accordingly               ##
####################################################################################################

activity[, 2] <- tolower(activity[, 2])
label[, 1] <- activity[label[, 1],2]
names(label) <- "activity"

####################################################################################################
## Name subject data column before assembling with other data tables                              ##
####################################################################################################

names(subject) <- "subject"

####################################################################################################
## Bind the tables into one tidy data table...                                                    ##
####################################################################################################

merged_and_clean <- cbind(subject, label, data)

####################################################################################################
## Melt the data set to allow construction of a summary data table...                             ##
####################################################################################################

varNames <- names(merged_and_clean)[3:length(names(merged_and_clean))]
melted_data <- melt(merged_and_clean, id = c("activity","subject"), measure.vars=varNames)

####################################################################################################
## Cast the table into summary of variables by activity and subject outputting the table as text. ##
####################################################################################################

summary_data <- dcast(melted_data, activity + subject ~ variable,mean)
write.table(merged_and_clean, "summary_by_activity_and_subject.txt", row.name=FALSE)

