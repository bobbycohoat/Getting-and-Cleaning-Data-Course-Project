#Getting-and-Cleaning-Data-Course-Project
This is  a description of the run_analysis.R program

The purpose of this code is to extract the Test and Training datasets from the UCI HAR Dataset Zipfile and combine them
*Each section is labeled to explaing the specific funtions within it
*The program creates two datasets. one is "Tidy" dataset and the other is the mean of the numerical value sof the Tidy dataset

#Explanation of the sections of code
Set Working Directory
*Use wd to assign the working directory
*setwd() initiates the working directory

Load packages if not already present
*Data.table package is requried to run the script 
*This script checks to make sure that the right packages are loaded in the UI and if not, loads it into the system

Upload all file sto variables
*This set of scripts loads all the individual files from the zip file
*activity_labels are the descriptions of the the y_test and y_train
*features are the headers for the x_test and x_train
*subject_train, subject_test, x_test, x_train, y_test, and y_train are the datasets combined together

Select data that has std or mean
 *Script selects the features that have the word "mean" or 'std" in them, to only have standard deviation and mean for the measurements
 
 Combining like datasets
 *These scripts us the rbind function to append like datasets together 
 *The Megeactivitydata variable merges the Activity labels with the reltive numbers they represent in the activitydata variable
 
 Adding header names to datasets
 *Scripts adding header names to newly created datasets
 
 Extract std or mean
 *Subsets the featuresdata, only containing the features that are mean or standard variation
 
 Combine data
 *Using the cbind function to combine all datasets
 
 Tidy Set 2
 *Create second dataset that takes the mean of all numeric columns
