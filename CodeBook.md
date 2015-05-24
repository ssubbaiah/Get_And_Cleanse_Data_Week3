#H1
Project CodeBook
##H2 
Introduction
program name: run_analysis.R <br>
The program does the following <br>
1. Merges the training and the test sets to create one data set. <br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set <br>
4. Appropriately labels the data set with descriptive variable names. <br>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>

##H2
Program Flow
1. Read headers for Activiy and Subject <br>
2. Read train and test data for x,y and subject and merge train and test data set for each of them <br>
3. Subset X data for column names containing "mean" or "std" <br>
4. Replace Activity ID with activity name - for activity - Y data <br>
5. Assign column names for X, Y and subject data <br>
6. Combine all the three data sets (columnwise) <br>
7. Write the combined data to output file <br>


#H2 
variables
1. Data downloaded from file are contained in :  *text_x, train_x, test_y, train_y, test_sub, train_sub* <br>
2. Column headers downloaded from file are in: *activity_label, featured_label* <br>
3. Test and Train data comobined are in : **all-x, all_y, all_sub**  <bd>
4. Column names that contain mean or std in *mean_std_cols*
5. Final cleansed data is in **full_data**
