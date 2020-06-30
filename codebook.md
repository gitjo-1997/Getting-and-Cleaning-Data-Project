run_analysis.R performs formatting and tidying on the UCI HAR Dataset.

The files were downloaded and extracted from the zip file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data from the different downloaded files input into different R dataframes

activity_labels from activity_labels.txt; links class labels with activity names
features from features.txt; list of all features
subject_test from subject_test.txt; identity of the subject who performed activity
x_test from X_test.txt; test data set
y_test from y_test.txt; test data set labesls
subject_train from subject_train.txt; identity of the subject who performed activity
x_train from x_train.txt; training data set
y_train from y_train.txt; training data set labels.

1. Merging of the data sets.

subject_test_train was created by merging the subject_test and subject_train datasets using rbind
x_test_train and y_test_train were created by merging the test and train datasets using rbind
The data sets were merged together using cbind

2. Extracting mean and stddev data

Mean and standar deviation datasets were extracted using the select function to explicitily select features the included mean or std.

3. More descriptive activity names were added to the data frame by using corresponding rownums from the activiy_labels dataframe

4. More descriptive variable names were created.

Variables that began with t or f were converted to Time or Frequency, respectively.

Variables that contatined acc, gyro, mag, freq, std, and mean were converted
Acc->accelerometer
Gyro->Gyromagnetic
Mag->Magnitude
freq->Frequency
std->StandardDeviation

"-", ".", and "()" characters were converted to "".

BodyBody->Body
tBody->TBody

5. A tidy dataset was created.

The mean of the features in the mean_stddev dataset were taken grouped by activity and subject using the aggregate function.

The new data table was written to a file named "TidyData.txt"


