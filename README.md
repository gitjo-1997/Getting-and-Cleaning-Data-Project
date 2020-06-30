This code repository utilizes data provided from The Human Activity Recognition Using Smartphones Dataset.

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repository is my final project submission for the Getting and Cleaning Data course on Coursera.

Files:

CodeBook.md: A codebook that is updated with data to indicate the variables summaries and units used in this repository.

run_Analysis.R: Formats and tidys data from the original data set.
Changes 
	1. Merges the training and test data sets
	2. Extracts mean and standard deviation measurements only
	3. Changes names and labels of variables to be more descriptive.
	4. Creates a second data set that contains the average for each variable based on activity and subject.

TidyData.txt: Tidy data set to be exported.