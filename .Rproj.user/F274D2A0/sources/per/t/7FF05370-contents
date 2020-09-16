# This will make a list of commands to knitr all .Rmd files in the current directory.
# Best to paste render commands into the RStudio console window.

setwd("/Users/schluter/zoologyCloud/Courses/bio 501 - stats/www-rtips")
z <- list.files(pattern = ".Rmd")

z <- paste0('rmarkdown::render("', z, '", "html_document")')
cat(z, sep = "\n")

# yields

rmarkdown::render("Calculate.Rmd", "html_document")
rmarkdown::render("Data.Rmd", "html_document")
rmarkdown::render("Display.Rmd", "html_document")
rmarkdown::render("Genomics.Rmd", "html_document")
rmarkdown::render("index.Rmd", "html_document")
rmarkdown::render("Loop.Rmd", "html_document")
rmarkdown::render("Meta.Rmd", "html_document")
rmarkdown::render("Model.Rmd", "html_document")
rmarkdown::render("Multivariate.Rmd", "html_document")
rmarkdown::render("Phylogenetic.Rmd", "html_document")
rmarkdown::render("Plan.Rmd", "html_document")
rmarkdown::render("Prob.Rmd", "html_document")
rmarkdown::render("Resample.Rmd", "html_document")
