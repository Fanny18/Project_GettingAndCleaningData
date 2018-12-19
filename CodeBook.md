# Project_GettingAndCleaningData
Course project: Analysis and transformations to clean a data set

> Data description:
The tidy data contain the average of each variable for each activity and each suject from an experiment with a group of 30 volunteers 
within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

> Variables description:

activity: Activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

subject: Each row identifies the subject who performed the activity. Its range is from 1 to 30

For columns from 3 to 20 the column name indicate the measurement that contain.


> Transformation to clean up the data:

The script contain separators to indicate the part of analysis.
Parts "WORKSPACE", "LIBRARY" and "DATA" are previous to the analysis and are only for a eassier work.

READ FILES: In this part we read the files that we will ocupate.

MERGE: In this part we join the files to create one data set with the info of the training and test sets also include the name of columns and the variables to indicate activity and subject.

MEAN & STANDAR DEVIATION:In this part we extract the measurements on the mean and standar deviation for each measurement, we omitted the mesurement that refering some axis because we want conserve only the general information for each measurement.

ACTIVITIES NAME: In this part we name the activities in the data set.

VARIABLES NAME: In this part we assign a descriptive variable name, we rename the variables to understand the names with out the need to read other file. Also we delate a column because contain the same information than other.

AVERAGES: In this part we crate a tidy data set with the average of each variable for each activity and for each subject.


