# This will make a list of commands to knitr all .Rmd files in the current directory.
# Best to paste render commands into the RStudio console window.

setwd("/Users/schluter/zoologyCloud/Courses/bio 501 - stats/www-biol501")
z <- list.files(pattern = ".Rmd")

z <- paste0('rmarkdown::render("', z, '", "html_document")')
cat(z, sep = "\n")

# yields

rmarkdown::render("index.Rmd", "html_document")
rmarkdown::render("lectures.Rmd", "html_document")
rmarkdown::render("books.Rmd", "html_document")
rmarkdown::render("calendar.Rmd", "html_document")
rmarkdown::render("handouts.Rmd", "html_document")
rmarkdown::render("homework.Rmd", "html_document")
