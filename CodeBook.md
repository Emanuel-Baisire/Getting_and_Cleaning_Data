Code Book
Data

The data source is from the Human Activity Recognition Using Smartphones Data Set, which was inpsired by following the training
routine of different individuals performing different activities. The study was based on the observation made by 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.

The R script run_analysis.R will merge the test and training data into one data set, measure the mean and standard deviation including the provision of appropriate labels and names. 

It will also create a second, independent tidy data set with the average of each variable, activity and subject.

Below, is the data source to be used for the analysis:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Variables

"activity_id": Identifies the activity of a participant (integer)

"activity_name": The names of participants' recorded actions: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (factor)

"subject_id": ID given to each subject (integer)



References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
