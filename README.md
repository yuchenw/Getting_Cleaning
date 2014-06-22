<<<<<<< HEAD
## Getting and Cleaning Data Course Project: Documentation

Student: Yu-Chen Wang
Date: 6/23/2014

This document provides information how I conducted the course project for the Getting and Cleaning Data Course Project. 

The goal of this project is to download the Human Activity Recognition Using Smartphones Dataset
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and to clean the dataset. 
The final product is a tidy dataset. The columns contain variables of "mean()" and "std()". The rows contain 30 subjects, 
each with 6 activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying). Each cell is the average 
of variables from each subject of each activity. 
 
The original zip file contains training data, 
testing data, and activity data, and feature variable data. There are also some documentations providing explanation of the 
variable names, activity codes, and subject codes.

Here are the steps I applied to complete the project:
1. Download the file
2. Read the files
3. Merge Training and Testing Data
4. Change Activity numbers to descriptive activity names
5. Find the variables with mean() and std() 
6. Adjust the variable name
7. Create the final raw output dataframe
8. Calculate the average of each variable for each activity and each subject

The final output is a .txt file with 180 rows and 68 columns. There are 30 subjects and 6 activities which resulted in 180 rows 
in the dataset. My approach identified 66 variables that contains "mean()" and "std()" in their names. The other 2 variables 
are "Subject" and "Activity"  

Please refer to the run_analysis.R in the same repo to review the the codes I used.
Please refer to the Codebook.md in the same repo to review the variable naming strategy I specified for the dataset

Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
=======
Getting_Cleaning
================

Getting and Cleaning Data Course Project
>>>>>>> 5c8e9b174ccc9f7961375438009feb66f33596b4
