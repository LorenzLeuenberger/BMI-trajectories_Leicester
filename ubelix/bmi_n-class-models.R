
# title: "BMI trajectories, higher class models estimation"
# author: "Lorenz Leuenberger"

# preparation ##########

# load data from input directory

baseline_models <- mget(load(file.path("input", "final_splines", paste0("bmi_data_and_1-class_", group, ".Rdata")), envir=(temp <- new.env())), envir=temp)
rm(temp)

data <- baseline_models[[1]]
baseline_models <- baseline_models[-1]

m1r <- baseline_models[[1]]
m1s <- baseline_models[[2]]
m1t <- baseline_models[[3]]
m1u <- baseline_models[[4]]
m1v <- baseline_models[[5]]
m1w <- baseline_models[[6]]

rm(baseline_models)

# set output path

output_path = file.path("output", "final_splines", paste0(n_classes, "-class"), group)

# set up cluster
registerDoParallel(cores=Sys.getenv("SLURM_CPUS_PER_TASK"))
print(getDoParWorkers())
cl <- makeForkCluster(getDoParWorkers())

# export variables to cluster
clusterExport(cl, c("n_classes", "n_rep", "n_iter", "output_path", "group",
                    "data",
                    "m1r", "m1s", "m1t", "m1u", "m1v", "m1w"))

# models ######################

# set seed for random numbers
set.seed(1000)

# estimate model
mnr <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       random = ~ -1,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1r, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "r_", group)
assign(new_name, mnr)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mnr, new_name, list = new_name)


# set seed for random numbers
set.seed(1000)

# estimate model
mns <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       random = ~ 1,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1s, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "s_", group)
assign(new_name, mns)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mns, new_name, list = new_name)

# set seed for random numbers
set.seed(1000)

# estimate model
mnt <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 9.80449), degree = 2),
                       random = ~ 1 + age_years,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1t, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "t_", group)
assign(new_name, mnt)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mnt, new_name, list = new_name)



# set seed for random numbers
set.seed(1000)

# estimate model
mnu <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       random = ~ -1,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1u, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "u_", group)
assign(new_name, mnu)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mnu, new_name, list = new_name)


# set seed for random numbers
set.seed(1000)

# estimate model
mnv <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       random = ~ 1,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1v, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "v_", group)
assign(new_name, mnv)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mnv, new_name, list = new_name)

# set seed for random numbers
set.seed(1000)

# estimate model
mnw <- gridsearch(hlme(fixed = bmi ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       mixture = ~ bs(age_years, knots = c(0.6650824, 10.34597, 13.7964), degree = 2),
                       random = ~ 1 + age_years,
                       nwg = FALSE,
                       idiag = FALSE,
                       subject = 'participant_id', ng = n_classes, data = data),
                  rep = n_rep, maxiter = n_iter, minit = m1w, cl = cl)

# change model name
new_name <- paste0("bmi_m", n_classes, "w_", group)
assign(new_name, mnw)

# save model
save(list = new_name, file = file.path(output_path, paste0(new_name, ".Rdata")))

# remove model
rm(mnw, new_name, list = new_name)

# end ########

## stop cluster ###########
stopCluster(cl)

## empty global environment ############

rm(list=ls()[! ls() %in% c("n_classes", "n_rep", "n_iter")])
