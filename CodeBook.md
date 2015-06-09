Coursera "Getting and Cleaning Data" Project
------------------------------------------------------

**Data Set Information:**
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]


**Attribute Information:**

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**R Code:**
run_analysis.R performs the following:
> 1. Merges the training and the test sets found in the UCI data to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Applies descriptive activity names to name the activities in the data set.
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. Creates a second, independent tidy data set with the average of  each variable for each activity and each subject.

This program is written specifically for the UCI HAR Dataset linked above and downloads and extracts the data automatically.  Files included in this data set are:

> - **activity_labels.txt**:  A data set containing the activity number and it's description for the six activities.
> - **features.txt**:  A data set containing the feature number and it's description.
> - **features.info.txt**:  A text file describing details of the feature selection.
> - **README.txt**:  A text file describing this data set.
> - **\train\X_train.txt**:  A data set containing the Training data.
> - **\train\y_train.txt**:  A data set containing the Training Labels.
> -  **\train\subject_train.txt**:  A data set containing the subjects who performed the activity.
> - **\test\X_test.txt**:  A data set containing the Test data.
> - **\test\y_test.txt**:  A data set containing the Test Labels.
> -  **\test\subject_test.txt**:  A data set containing the subjects who performed the activity.

>Notes: 
>
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.
>
>For more information about this dataset contact: activityrecognition@smartlab.ws

**Program Execution:**

 1. The test and training data sets (X_train and X_test are row bound into one data set.
 2. The test and training label sets (y_train and y_test) are then row bound into one data set.
 3. Subject_train and subject_test are then row bound as well.
 4. Only features containing mean() or std() are selected from the features data set.
 5. Only data associated with the mean() and std() data is selected and the column names updated with descriptive names.
 6.  Activity numbers are updated with descriptive ativity names.
 7. The subject, label and data data sets are then column bound together into one clean data set.
 8. The data is melted into a tall table (activity, subject, variable, value).
 9. This data is then cast into a smaller summary table of mean values by activity and subject.
 10. Finally this smaller data set is output as *summary_by_activity_and_subject.txt*.

**Program Output:**

run_analysis.R outputs a data set of averages for mean and standard deviation data by activity and subject named summary_by_activity_and_subject.txt.

>Fields contained in summary_by_activity_and_subject.txt:
>
> activity                  
subject                   
tbodyacc-mean-x           
tbodyacc-mean-y          
tbodyacc-mean-z           
tbodyacc-std-x            
tbodyacc-std-y            
tbodyacc-std-z           
tgravityacc-mean-x        
tgravityacc-mean-y        
tgravityacc-mean-z        
tgravityacc-std-x        
tgravityacc-std-y         
tgravityacc-std-z         
tbodyaccjerk-mean-x      
tbodyaccjerk-mean-y      
tbodyaccjerk-mean-z    
tbodyaccjerk-std-x       
tbodyaccjerk-std-y       
tbodyaccjerk-std-z       
tbodygyro-mean-x         
tbodygyro-mean-y         
tbodygyro-mean-z         
tbodygyro-std-x          
tbodygyro-std-y           
tbodygyro-std-z        
tbodygyrojerk-mean-x   
tbodygyrojerk-mean-y     
tbodygyrojerk-mean-z  
tbodygyrojerk-std-x     
tbodygyrojerk-std-y     
tbodygyrojerk-std-z      
tbodyaccmag-mean       
tbodyaccmag-std          
tgravityaccmag-mean     
tgravityaccmag-std      
tbodyaccjerkmag-mean   
tbodyaccjerkmag-std      
tbodygyromag-mean       
tbodygyromag-std         
tbodygyrojerkmag-mean   
tbodygyrojerkmag-std    
fbodyacc-mean-x      
fbodyacc-mean-y          
fbodyacc-mean-z      
fbodyacc-std-x         
fbodyacc-std-y        
fbodyacc-std-z           
fbodyaccjerk-mean-x   
fbodyaccjerk-mean-y
fbodyaccjerk-mean-z  
fbodyaccjerk-std-x       
fbodyaccjerk-std-y    
fbodyaccjerk-std-z    
fbodygyro-mean-x    
fbodygyro-mean-y         
fbodygyro-mean-z      
fbodygyro-std-x        
fbodygyro-std-y         
fbodygyro-std-z          
fbodyaccmag-mean      
fbodyaccmag-std       
fbodybodyaccjerkmag-mean
fbodybodyaccjerkmag-std  
fbodybodygyromag-mean   
fbodybodygyromag-std    
fbodybodygyrojerkmag-mean
fbodybodygyrojerkmag-std 