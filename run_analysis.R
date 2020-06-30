library(dplyr)


# downloading correct files
zip<-"getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(zip)){
	zipurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(zipurl,zip,method="curl")
}
foldername<-"UCI HAR Dataset"
if (!file.exists(foldername)){
	unzip(zip)
}


# assigning activity labels to activity_labels df
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("rownum","activity"))


# assigning functions to the features df
features <- read.table("UCI HAR Dataset/features.txt",col.names=c("number","function_names"))


# assigning data to the test and train dfs
# assigning data for test df
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$function_names)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", col.names = "rownum")
# assigning data for train df
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$function_names)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", col.names = "rownum")


# 1. Merging the data sets
subject_test_train<-rbind(subject_test,subject_train)
x_test_train<-rbind(x_test,x_train)
y_test_train<-rbind(y_test,y_train)
all_data<-cbind(subject_test_train,x_test_train,y_test_train)


# 2. Getting mean and stddev data for the data_set
mean_stddev<-select(all_data,subject,rownum,contains("mean"),contains("std"))


# 3. Using descriptive activity names to name the activities in the data set
mean_stddev$rownum<-activity_labels[mean_stddev$rownum,2]
names(mean_stddev)[2] = "activity"
# 4. Creating more descriptive variable names

# Naming features that begin with t or f
names(mean_stddev)<-gsub("^t","Time",names(mean_stddev))
names(mean_stddev)<-gsub("^f","Frequency",names(mean_stddev))

# Naming and capitalizing features that contain acc, gyro, mag, freq, std, mean
names(mean_stddev)<-gsub("Acc","Accelerometer",names(mean_stddev))
names(mean_stddev)<-gsub("Gyro","Gyromagnetic",names(mean_stddev))
names(mean_stddev)<-gsub("Mag","Magnitude",names(mean_stddev))
names(mean_stddev)<-gsub("freq","Frequency",names(mean_stddev))
names(mean_stddev)<-gsub("std","StandardDeviation",names(mean_stddev))

# Replacing -, ., and ()
names(mean_stddev)<-gsub("-","",names(mean_stddev))
names(mean_stddev)<-gsub("()","",names(mean_stddev))
names(mean_stddev)<-gsub("\\.","",names(mean_stddev))

# Body
names(mean_stddev)<-gsub("BodyBody","Body",names(mean_stddev))
names(mean_stddev)<-gsub("tBody","TBody",names(mean_stddev))

# 5. Creating a tidy data set
tidy <- mean_stddev %>% aggregate(by=list(Activity=mean_stddev$activity,Subject=mean_stddev$subject),mean,na.rm=T)
tidy$subject<-NULL
tidy$activity<-NULL
write.table(tidy,"TidyData.txt")
