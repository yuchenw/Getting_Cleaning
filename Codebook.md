## Getting and Cleaning Data Course Project: Codebook

Student: Yu-Chen Wang
Date: 6/23/2014

For the activity labels, I used the following terms to describe the 6 activities in the original dataset:
1:walking, 2:walkingup, 3:walkingdown, 4:sitting, 5:standing, 6:laying

For the descriptive variable names, the naming strategy is 
similar to the original dataset with some modification.

"Subject": This column shows the subject number, from 1 to 30.
"Activity": This column shows the activity the subject had. As was mentioned above, there are 6 activities.

The other 66 variable names are the combination of the following string pattern. 

"TDS": Time domain signals
"FDS": Frequency domain signals 
"Body": Body signals
"Gravity": Gravity signals
"Acc": Accelerometer
"Gyro": Gyroscope
"Jerk": Jerk signals
"Mag": Magnitude
"mean": The mean of the variable
"std": The standard deviation

I also replaced all symbols, such as "-","()", and ",", using "of" or "in".