train.x contains the training data.
train.y contains the training label.
train combines both the training data and the training label.

test.x contains the testing data.
test.y contains the testing label.
test combines both the testing data and the testing labe.

data merges the training and testing data together.

features reads the data features.
features.mean selects the mean columns.
features.std selects the standard deviation columns.

features.ms combines the mean columns, the standard deviation columns, and the activity label.

data.ms subsets the mean, the standard deviation, and the activity label from the raw data.

act.name reads the activity names.

var.name converts those acitivity names into character object.

data.ms.mean calculates the mean of each column, namely each variable.
