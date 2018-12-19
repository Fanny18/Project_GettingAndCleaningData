# Project_GettingAndCleaningData
Course project: Analysis and transformations to clean a data set

In this project we clean a data set to obtain a summary (in this case averages) from somes specific variables.

The script contain separators to indicate the part of analysis.
Parts "WORKSPACE", "LIBRARY" and "DATA" are previous to the analysis and are only for a eassier work.

READ FILES: In this part we read the files that we will ocupate.

MERGE: In this part we join the files to create one data set with the info of the training and test sets also include the name of columns and the variables to indicate activity and subject.

MEAN & STANDAR DEVIATION:In this part we extract the measurements on the mean and standar deviation for each measurement, we omitted the mesurement that refering some axis because we want conserve only the general information for each measurement.

ACTIVITIES NAME: In this part we name the activities in the data set.

VARIABLES NAME: In this part we assign a descriptive variable name, we rename the variables to understand the names with out the need to read other file. Also we delate a column because contain the same information than other.

AVERAGES: In this part we crate a tidy data set with the average of each variable for each activity and for each subject.
