###Welcome to the ShotAnalysis wiki!
This package will be used to analyze the shooting result of my club.

It will read the the data out of multiple excel-tables, filter the relevant information. Then analyse it with focus on the development of the shooter, in which I look at accumulation points and outlier.

Finaly I visualize the results.

Load the package:
library(devtools)
devtools::install_github("WeissenbergerSven/ShotAnalysis")
library(ShotAnalysis)

Load new tables:
Shoting_list <- get_shooting_list(path_to_excel)
