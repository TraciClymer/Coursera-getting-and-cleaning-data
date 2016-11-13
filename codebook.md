---
title: "Codebook for Getting and Cleaning Data Project"
author: "Traci Clymer"
date: "11/12/2016"
output: html_document
---
##Description

###Contains more detailed information about variables, dataset used, and transformations performed by the run_analysis.R script for the "Getting and Cleaning Data" course project.

##Source Data
###A full description of the data used in this project and the data itself is available here:

###http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set Information
###The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Attribute Information
###For each record in the dataset it is provided:
####Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
####Triaxial Angular velocity from the gyroscope. 
####A 561-feature vector with time and frequency domain variables.
####Its activity label.
####An identifier of the subject who carried out the experiment.

##Data processing
###Get the data
####1.Download zipped file into a folder titled "data"
####2.Unzip the file
####3.Get list of files and set path for "UCI HAR Dataset", the folder that contains the data

### The files used in this project are as follows:
#####test/subject_test.txt
#####test/X_test.txt
#####test/y_test.txt
#####train/subject_train.txt
#####train/X_train.txt
#####train/y_train.txt

###Read data from targeted files
####1.Read Activity files
####2.Read Subject files
####3.Read Features files

###Merge train and test sets to a single dataset
####1.Concatenate the data tables by rows
####2.Set names to variable
####3.Merge columns creating the dataframe "Data" for all data

###Extract only mean and std deviation values for each measurement
####1.Subset names of features with "mean" or "std"
####2.Subset "Data" by selected names of features

###Assign descriptive names to activities in "Data"
####1.Read descriptive activity names from "activity_labels.txt"
####2.Factorize the "activity"" variable of "Data" using the descriptive activity names

###Correct prefixes used in the names of remaining variable to make them more descriptive
####prefix "t" is replace by "time"
####"Acc" is replaced by "Accelerometer"
####"Gyro" is replaced by "Gyroscope"
####prefix "f" is replaced by "frequency"
####"Mag" is replaced by "Magnitude"
####"BodyBody" is replaced by "Body"

###Create a separate, tidy data set as output
