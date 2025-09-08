
## Exploring Operations Research with R

### Online support
Note: This repository also contains material related to a number of R courses I am an instructor for:

1. [Data Science for Operational Researchers using R.](https://github.com/JimDuggan/explore_or/tree/main/Courses/OR%20Society)
2. [DCT5102: Programming for Data Analytics.](https://github.com/JimDuggan/explore_or/tree/main/Courses/CT5102)


### Overview

This is the code repository for my 2024 book [*Exploring Operations Research with R*](https://www.routledge.com/Exploring-Operations-Research-with-R/Duggan/p/book/9781032277165).

<p align="center" width="100%">
    <img width="25%" src="BookCover.png">
</p>


*Management is the process of converting information into action. The conversion process we call decision making.* [**Jay W. Forrester**](https://en.wikipedia.org/wiki/Jay_Wright_Forrester), [*Industrial Dynamics (1961)*](https://www.amazon.co.uk/Industrial-Dynamics-Jay-W-Forrester/dp/1883823366).


The idea behind the book is to show how the [R Programming language](https://www.r-project.org/about.html) can be a valuable tool that can be successfully applied to the field of [operations research (OR)](https://www.theorsociety.com). 

This approach is centred on the idea of the future OR professional as someone who can combine knowledge of key OR techniques (e.g. simulation, linear programming, data science, and network science) with an understanding of progranming languages such as R, including tools for  data representation, manipulation, and analysis. 

The aim of the book is to provide a self-contained introduction to R (both Base R and the tidyverse) and show how this knowledge can be applied to a range of OR challenges in the domains of public health, infectious diseases, and energy generation, and so provide *a platform to develop actionable insights to support decision making*.

The book contains three parts, and code from these three parts can be accessed via the links below.



### Part I - Base R
*Part I* introduces R, and provides a step-by-step guide to the key features of R. The initial  focus is on base R, and data structures, including: vectors, matrices, lists, data frames, and tibbles. The building blocks of R --- functions --- are presented, along with important ideas including environments, functionals, and the S3 object system. 

**ch 1.** [Getting started with R](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/01%20Getting%20Started) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/01%20Getting%20Started/src/Chapter1.R)

**ch 2.** [Vectors](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/02%20Vectors) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/02%20Vectors/src/Chapter2.R)

**ch 3.** [Subsetting vectors](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/03%20Subsetting%20vectors) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/03%20Subsetting%20vectors/src/Chapter3.R)

**ch 4.** [Functions, Functionals and the R Pipe](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/04%20Functions) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/04%20Functions/src/Chapter4.R)

**ch 5.** [Matrices and Data Frames](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/05%20Matrices%20and%20Data%20Frames) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/05%20Matrices%20and%20Data%20Frames/src/Chapter5.R)

**ch 6.** [The S3 Object System in R](https://github.com/JimDuggan/explore_or/tree/main/Part%20I/06%20S3%20Object%20System) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20I/06%20S3%20Object%20System/src/Chapter6.R)



### Part 2 - The `tidyverse` and `shiny`
*Part II*, presents R's  [tidyverse](https://www.tidyverse.org), where the main focus is on: `ggplot2`, `dplyr`, `tidyr`, `purrr`, and `shiny`, as together these provide a versatile platform for rapidly analyzing, interpreting and visualizing data.


**ch 7.** [Visualization with ggplot2](https://github.com/JimDuggan/explore_or/tree/main/Part%20II/07%20ggplot2) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/07%20ggplot2/src/Chapter7.R)

**ch 8.** [Data Transformation with dplyr](https://github.com/JimDuggan/explore_or/tree/main/Part%20II/08%20dplyr) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/08%20dplyr/src/Chapter8.R)

**ch 9.** [Relational Data with dplyr and Tidying Data with tidyr](https://github.com/JimDuggan/explore_or/tree/main/Part%20II/09%20dplyr%20tidyr) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/09%20dplyr%20tidyr/src/Chapter9.R)

**ch 10.** [Processing Data with purrr](https://github.com/JimDuggan/explore_or/tree/main/Part%20II/10%20purrr) --- [Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/10%20purrr/src/Chapter10.R)

**ch 11.** Shiny Examples.

* [Hello Shiny](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/01%20Hello%20Shiny/app.R)

* [Process Numbers](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/02%20Process%20Number/app.R)

* [Weather Stations](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/03%20Weather%20Stations/app.R)

* [Data Frame Example](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/04%20Data%20Frame%20Example/app.R)

* [Plots](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/05%20mpg/app.R)

* [Reactive Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20II/11%20Shiny/06%20Poisson%20Reactive/02%20Reactive/app.R)


### Part 3 - Exploring OR using R
*Part III* focuses on four practical examples of using R to support operations research methods. These are exploratory data analysis, linear programming, agent-based simulation, and system dynamics. 

**ch 12.** Exploratory Data Analysis Examples. 
* [Iris Flowers](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/12%20Exploratory%20Data%20Analysis/01%20Iris.R)

* [Titanic](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/12%20Exploratory%20Data%20Analysis/02%20Titanic.R)

* [Victoria Electricity](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/12%20Exploratory%20Data%20Analysis/03%20Vic%20Elec.R)

* [Boston Housing - MASS package](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/12%20Exploratory%20Data%20Analysis/04%20Boston.R)

* [Irish Weather](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/12%20Exploratory%20Data%20Analysis/05%20aimsir17.R)

**ch 13.** [Linear Programming - Reddy Mikks Example](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/13%20Linear%20Programming/Chapter13.R)

**ch 14.** [Agent-Based Simulation - Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/14%20Agent%20Based%20Simulation/Chapter14.R)

**ch 15.** [System Dynamics - Code](https://github.com/JimDuggan/explore_or/blob/main/Part%20III/15%20System%20Dynamics/Chapter15.R)

### Required Software

The following software is needed to run the examples:

1. R, which can be downloaded from CRAN at https://cran.r-project.org.

2. RStudio, which is an integrated development environment (IDE) to support R programming. RStudio can be downloaded from https://posit.co/downloads/.

3. Specific packages from CRAN that are used in the book, and this can be done from within RStudio. Examples of packages are `ggplot2` to support visualization, and `deSolve` to support system dynamics modelling.


### Recommended Readings
The following books have been valuable reference resources in writing this textbook.

* [*Advanced R*](https://adv-r.hadley.nz) by Hadley Wickham, which presents a deep dive into R, and covers many fascinating technical topics, including object-oriented programming and metaprogramming.

* [*R for Data Science*](https://r4ds.hadley.nz) by Hadley Wickham, Mine Cetinkaya-Rundel and Garrett Grolemund, aimed at data scientists to show how to perform data science with R, RStudio and  the tidyverse collection of R packages.

* [*Forecasting Principles and Practice*](https://otexts.com/fpp3/) by Rob J. Hyndman and George Athanasopoulos, which provides a comprehensive introduction to forecasting methods in R and also presents a valuable data processing pipeline for manipulating time series data.

* [*Introduction to Statistical Learning*](https://www.statlearning.com), by Gareth James, Daniela Witten, Trevor Hastie, and Robert Tibshirani which demonstrates the application of the statistical learning methods in R, covering both supervised and unsupervised learning.

* [*Tidy Modeling with R*](https://www.tmwr.org), by Max Kuhn and Julia Silge, which introduces a collection of R packages to support modelling and machine learning.




