# This will make a list of commands to knitr all .Rmd files in the current directory.
# Best to paste render commands into the RStudio console window.

setwd("/Users/schluter/zoologyCloud/Courses/bio 501 - stats/www-biol501/workshops")
z <- list.files(pattern = ".Rmd")

z <- paste0('rmarkdown::render("', z, '", "html_document")')
cat(z, sep = "\n")

# yields
rmarkdown::render("index.Rmd", "html_document")

rmarkdown::render("workshops-intro.Rmd", "html_document")
rmarkdown::render("graphics.Rmd", "html_document")
rmarkdown::render("exp-design.Rmd", "html_document")
rmarkdown::render("linearmodels.Rmd", "html_document")
rmarkdown::render("lme.Rmd", "html_document")
rmarkdown::render("likelihood.Rmd", "html_document")
rmarkdown::render("glm.Rmd", "html_document")
rmarkdown::render("bayes.Rmd", "html_document")
rmarkdown::render("resampling.Rmd", "html_document")
rmarkdown::render("meta.Rmd", "html_document")

rmarkdown::render("modelselection.Rmd", "html_document")
rmarkdown::render("multivariate.Rmd", "html_document")
rmarkdown::render("phylogenetic.Rmd", "html_document")
