path <- "C:\\coursera\\GettingAndCleaningData\\assignement\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset"

features <-  paste(path, "\\features.txt", sep = "")
features <- read.table(features,colClasses = c("character"))
dim(features) #561 2
str(features)

activity.labels <-  paste(path, "\\activity_labels.txt", sep = "")
activity.labels <- read.table(activity.labels,  col.names = c("ActId", "Activity"))
dim(activity.labels)

x.train.file <- paste(path, "\\train\\X_train.txt", sep = "")
x.training <- read.table(x.train.file)
dim(x.training) #  7352  561


y.train.file <- paste(path, "\\train\\Y_train.txt", sep = "")
y.training <- read.table(y.train.file)
dim(y.training) #7352  1

subject.train.file <- paste(path, "\\train\\subject_train.txt", sep = "")
subject.training <- read.table(subject.train.file)
dim(subject.training) #7352    1


############# Testing files

x.test.file <- paste(path, "\\test\\X_test.txt", sep = "")
x.test <- read.table(x.test.file)
dim(x.test) #2947  561

y.test.file <- paste(path, "\\test\\y_test.txt", sep = "")
y.test <- read.table(y.test.file)
dim(y.test) #2947  1


subject.test.file <- paste(path, "\\test\\subject_test.txt", sep = "")
subject.test <- read.table(subject.test.file)
dim(subject.test) #2947 obs. of  1 variable:   1

*********************
#### 1. merge training and testing set
*********************
    
training.set <- cbind (cbind(x.training, y.training),subject.training)
dim(training.set)  #7352  563

testing.set <- cbind (cbind(x.test, y.test),subject.test)
dim(testing.set) #2947  563

oneset <- rbind(training.set,testing.set)     
dim(oneset) ##10299,563

###################
### 2. Extract only the mean and standard deviation for each measuremet
###################
library(plyr)
str(oneset)
features.labels <-  rbind(rbind(features, c(562, "Subject")), c(563, "ActId"))[,2]
names(oneset) <- features.labels
head(oneset,2)

filtered.data <- oneset[,grepl("*mean*|*std*|Subject|ActId", names(oneset))]
dim(filtered.data) ##10299 81

#################
### 3. Use a descriptive activity names to the name the acitvity in the data set
#################
filtered.data  <- join(filtered.data, activity.labels, by = "ActId")
head(filtered.data)
dim(filtered.data )

###############
### 4.Appropriately labels the data set with descriptive variable names. 
###############
names(filtered.data) <- gsub('\\(|\\)',"",names(filtered.data))
names(filtered.data) <- gsub('-mean',"Mean",names(filtered.data))
names(filtered.data) <- gsub('-std',"Std ",names(filtered.data))
names(filtered.data) <- gsub('-',"",names(filtered.data))

head(filtered.data)
dim(filtered.data)

##############
### 5.From the data set in step 4, creates a second, independent tidy data set
###   with the average of each variable for each activity and each subject.
#############
clean.data  = ddply(filtered.data, c("Subject","Activity"), numcolwise(mean))
write.table(clean.data,"cleandata.txt",row.name=FALSE ,sep = '\t')








