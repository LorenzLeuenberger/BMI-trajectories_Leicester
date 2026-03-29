# BMI trajectories in Leicester Respiratory Cohorts

I created 6 R-Quarto files for the analysis:

-   00_data-cleaning.qmd: Clean raw data from Leicester Respiratory Cohorts in two parts: i. clean anthropometric data, ii. clean other outcomes and covariates. I already code variables from the raw questionnaire data.
-   01_data-availability.qmd: Check availability of the anthropometric data to choose inclusion and exclusion criteria.
-   02_preparation-for-ubelix.qmd: Use inclusion and exclusion criteria and pseudonymize data.
-   03_best-1-class-model.qmd: Find suitable function (polynomials, splines) to model BMI trajectories.
-   04_model-selection_bmi-trajectories.qmd: Selection of optimal BMI trajectory model.
-   05_data-analysis_bmi-trajectories.qmd: Analysis and characterization of BMI trajectories, identify risk groups and risk factors



    e BMI trajectories were estimated on the high performance computing cluster of the university of Bern (ubelix).
