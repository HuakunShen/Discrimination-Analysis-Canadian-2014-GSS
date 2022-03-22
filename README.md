# Canadian Discrimination Analysis with GSS (2014)

## Data Source

[General Social Survey, cycle 28: 2014: Victimization Main](https://sda-artsci-utoronto-ca.myaccess.library.utoronto.ca/cgi-bin/sda/hsda?harcsda4+gss28_EM)

Only a subset of the GSS is used, the subset data file is stored as [data.csv](./inputs/data/data.csv).

Data used:
- CIP: Confidence In Police
- DEM: Demographic Derived Variables
- PCC: Perceptions: Criminal Courts
- PLP: Perceptions: Local Police
- TIP: Trust In People
- DIS: Discrimination
- DTS: Discrimination - Types Of Situations Experienced By Respondent
- CIR: Main Routing Module: Crime Incident Report

## Reproduction

The paper is generated from [paper.Rmd](./outputs/paper/paper.Rmd).

You can either run `Knit` using RStudio or run `rmarkdown::render("outputs/paper/paper.Rmd")` in R console, make sure workspace is set to be repo.











