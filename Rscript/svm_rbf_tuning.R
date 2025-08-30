# SVM with RBF kernel on BuzzFeedData social features
# Extracted and lightly corrected from the original paper by Holly Kwan
# Notes:
# - Requires the 'e1071' package for SVM and tuning
# - The script mirrors the paper and expects you to define 'train' and 'test' data frames.
# - Columns referenced: Rating, share_count, reaction_count, comment_count

# install.packages("e1071")  # if not installed
library(e1071)

# Load dataset (replace with your path if needed)
reposts <- read.csv("normal-facebookdata.csv")

# Social feature columns
share_count    <- reposts$share_count
reaction_count <- reposts$reaction_count
comment_count  <- reposts$comment_count
Rating         <- reposts$Rating

# TODO: Create train/test data frames with the above columns.
# For example, the 'train' and 'test' data frames should contain columns:
#   Rating, share_count, reaction_count, comment_count
# The following lines assume 'train' and 'test' exist.

# Initial SVM fit with RBF kernel
svm_model <- svm(Rating ~ ., data = train, kernel = "radial")
summary(svm_model)

# Hyperparameter tuning (10-fold CV) for gamma and cost
svm_tune <- tune.svm(
  Rating ~ .,
  data   = train,
  kernel = "radial",
  gamma  = seq(1 / 2^nrow(reposts), 1, 0.01),
  cost   = 2^seq(-6, 4, 2)
)

print(svm_tune)

# Train tuned model with selected parameters (gamma = 0.08, cost = 16)
tuned_svm <- svm(
  Rating ~ .,
  data   = train,
  kernel = "radial",
  gamma  = 0.08,
  cost   = 16
)
summary(tuned_svm)

# Predict on test set and create confusion table
svm_pred <- predict(tuned_svm, test[, 4])
print(table(pred = svm_pred, true = test[, 4]))
