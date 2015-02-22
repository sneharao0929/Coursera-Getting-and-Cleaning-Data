# Codebook For Coursera Getting and Cleaning Data Project.  
## Original Data source
###Human Activity Recognition Using Smartphones Data Set 
***************************************************************************************************************************************************
## Test data source
###The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer tion signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
****************************************************************************************************************************************************
## Conventions followed
### Processing code and dataset variable naming follows the conventions described in Google R Styde Guide
### variable names are in format variable.name
### All lowercase
### space limit is 80 characters

****************************************************************************************************************************************************
## Raw Data Sets
### The following raw data sets were  provided with the assignments 

*features.txt
*activity_labels.txt
*X_train.txt
*Y_train.txt
*subject_train.txt
*X_test.txt
*Y_test.txt
*subject_test.txt

### The variables used 

variableName       | Type       |    Source
-------------------|------------|-----------
features           |Dataframe   | features.txt
activity.labels    |Dataframe   | activity.labels.txt
x.training         |Dataframe   | X_train.txt
y.training         |Dataframe   | y_training.txt
subject.train      |Dataframe   | subject_train.txt
x.test             |Dataframe   | X_test.txt
y.test             |Dataframe   | y_test.txt
subject.test       |Dataframe   | subject_test.txt
training.set       |Dataframe   | x.training, y.training,subject.training
testing.set        |Dataframe   | x.test, y.test,subject.test
oneset             |Dataframe   | training.set,test.set
features.labels    |Character   | created new columns subject and ACTId in feature vector
filtered.data      |Dataframe   | oneset
clean.data         |Dataframe   | filtered.data
********************************************************************************************************************************************************
# Data Transformation
********************************************************************************************************************************************************
## Merged training and test data sets
# x.training  , y.training  , subject.train is merged to get traing dataset , similarly
# x.test  , y.test  , subject.test is merged to get test dataset.
# Both training and test data sets are merged to get a single dataset.

##column names assigned to merged data set and then it is  filtered to get 
#mean, median , subject and activity id

## Use a descriptive activity names
# The new id column is added to activity.labels.txt which is used to merge the filtered data and activity column

*******************************************************************************************************************************************************
# Tidy data set
*******************************************************************************************************************************************************
##Appropriately labels the data set
### Removed paranthesis
### Replaced mean with Mean
### Replaced std with Std
### Replaced - with nospace

### wrote the tidy data in cleandata.txt













