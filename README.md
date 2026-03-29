# BMI trajectories in Leicester Respiratory Cohorts

I created 6 R-Quarto files for the analysis:

-   00_data-cleaning.qmd: Clean raw data from Leicester Respiratory Cohorts in two parts: i. clean anthropometric data, ii. clean other outcomes and covariates.
-   01_data-availability.qmd: Check availability of the anthropometric data.
-   02_preparation-for-ubelix.qmd: Apply inclusion and exclusion criteria and pseudonymize data.
-   03_best-1-class-model.qmd: Find suitable function (polynomials, splines) to model BMI trajectories.
-   04_model-selection_bmi-trajectories.qmd: Selection of optimal BMI trajectory model.
-   05_data-analysis_bmi-trajectories.qmd: Analysis and characterization of BMI trajectories, identify risk groups and risk factors


The BMI trajectories were estimated on the high performance computing cluster of the university of Bern [UBELIX](https://hpc-unibe-ch.github.io/).
The R scripts are saved in this ubelix folder.
