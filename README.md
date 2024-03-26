## Exploring Operations Research with R

*Management is the process of converting information into action. The conversion process we call decision making.* [**Jay W. Forrester**](https://en.wikipedia.org/wiki/Jay_Wright_Forrester), [*Industrial Dynamics (1961)*](https://www.amazon.co.uk/Industrial-Dynamics-Jay-W-Forrester/dp/1883823366).

### Overview
This is the code repository for my new book [*Exploring Operations Research with R*](https://www.routledge.com/Exploring-Operations-Research-with-R/Duggan/p/book/9781032277165).

<p align="center" width="100%">
    <img width="25%" src="BookCover.png">
</p>

The idea behind the book is to show how the [R Programming language](https://www.r-project.org/about.html) can be a valuable tool that can be successfully applied to the field of [operations research (OR)](https://www.theorsociety.com). 

This approach is centred on the idea of the future OR professional as someone who can combine knowledge of key OR techniques (e.g. simulation, linear programming, data science, and network science) with an understanding of progranming languages such as R, including tools for  data representation, manipulation, and analysis. 

The aim of the book is to provide a self-contained introduction to R (both Base R and the tidyverse) and show how this knowledge can be applied to a range of OR challenges in the domains of public health, infectious diseases, and energy generation, and so provide *a platform to develop actionable insights to support decision making*.

The book contains three parts, and code from these three parts can be accessed via the links below.



### Part I - Base R
*Part I* introduces R, and provides a step-by-step guide to the key features of R. The initial  focus is on base R, and data structures, including: vectors, matrices, lists, data frames, and tibbles. The building blocks of R --- functions --- are presented, along with important ideas including environments, functionals, and the S3 object system. 

1. [Getting started with R](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/01%20Getting%20Started)

2. [Vectors](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/02%20Vectors)

3. [Subsetting vectors](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/03%20Subsetting%20vectors)

4. Functions, Functionals and the R Pipe

5. Matrices and Data Frames

6. The S3 Object System in R



### Part 2 - The `tidyverse` and `shiny`
*Part II*, presents R's  [tidyverse](https://www.tidyverse.org), where the main focus is on: `ggplot2`, `dplyr`, `tidyr`, `purrr`, and `shiny`, as together these provide a versatile platform for rapidly analyzing, interpreting and visualizing data.


### Part 3 - Exploring OR using R
*Part III* focuses on four practical examples of using R to support operations research methods. These are exploratory data analysis, linear programming, agent-based simulation, and system dynamics. 

### Required Software

The following software is needed to run the examples:

1. R, which can be downloaded from CRAN at https://cran.r-project.org.

2. RStudio, which is an integrated development environment (IDE) to support R programming. RStudio can be downloaded from https://posit.co/downloads/.

3. Specific packages from CRAN that are used in the book, and this can be done from within RStudio. Examples of packages are `ggplot2` to support visualization, and `deSolve` to support system dynamics modelling.


### Recommened Readings
The following books have been valuable reference resources in writing this textbook.

* [*Advanced R*](https://adv-r.hadley.nz) by Hadley Wickham, which presents a deep dive into R, and covers many fascinating technical topics, including object-oriented programming and metaprogramming.

* [*R for Data Science*](https://r4ds.hadley.nz) by Hadley Wickham, Mine Cetinkaya-Rundel and Garrett Grolemund, aimed at data scientists to show how to perform data science with R, RStudio and  the tidyverse collection of R packages.

* [*Forecasting Principles and Practice*](https://otexts.com/fpp3/) by Rob J. Hyndman and George Athanasopoulos, which provides a comprehensive introduction to forecasting methods in R and also presents a valuable data processing pipeline for manipulating time series data.

* [*Introduction to Statistical Learning*](https://www.statlearning.com), by Gareth James, Daniela Witten, Trevor Hastie, and Robert Tibshirani which demonstrates the application of the statistical learning methods in R, covering both supervised and unsupervised learning.

* [*Tidy Modeling with R*](https://www.tmwr.org), by Max Kuhn and Julia Silge, which introduces a collection of R packages to support modelling and machine learning.




