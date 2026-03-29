
# title: "BMI trajectories, 5 class models estimation, source"
# author: "Lorenz Leuenberger"

# preparation ############

# load libraries
library(doParallel)
library(lcmm)
library(splines)

# set working directory
setwd("..")
setwd("..")


# set number of classes
n_classes <- 5


# set number of repetitions with random starting values
n_rep <- 50

# set number of iterations
n_iter <- 20


# run scripts ############

group = "female"
source(file = file.path("r-scripts", "final_splines", "bmi_n-class-models.R"))

group = "male"
source(file = file.path("r-scripts", "final_splines", "bmi_n-class-models.R"))

group = "europe"
source(file = file.path("r-scripts", "final_splines", "bmi_n-class-models.R"))

group = "asia"
source(file = file.path("r-scripts", "final_splines", "bmi_n-class-models.R"))

group = "total"
source(file = file.path("r-scripts", "final_splines", "bmi_n-class-models.R"))

