setwd("/Users/schluter/zoologyCloud/Courses/bio 501 - stats/www-rworkshops")

fname <- "phylogenetic.txt"

# Read html text from wordpress page
x <- scan(fname, what=character(), sep = "\n", blank.lines.skip = FALSE)

title <- sub("<h1>([A-z <>\\/-]*)<\\/h1>", "\\1", x[1]) # extract title

# Generate common prefix to all .Rmd files
begin <- '---
title: "TITLE"
author:

<!--  output: html_document -->
output:
  html_document:
    toc: true
    toc_depth: 3
    toc_float: 
      collapsed: false
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
\n'

begin <- unlist(strsplit(begin, split = "\n"))

# Insert title
begin[2] <- sub("TITLE", title, begin[2])

# Combine
x <- c(begin, x[-1])

# ----------

# Replace various html code with Rmarkdown
# Headers
x[grep("h2>", x)] <- paste( "\n##", 
	gsub("<h2><a name=\"[A-z0-9]*\"></a>([A-z ?()0-9:,<>\\/-\\'-]*)<\\/h2>", "\\1", x[grep("h2>", x)]) )
x[grep("h3><", x)] <- paste( "\n<br>\n\n###", 
	gsub("<h3><a name=\"[A-z0-9]*\"></a>([A-z?()0-9:, -]*)<\\/h3>", "\\1", x[grep("h3><", x)]) )
x[grep("h3>", x)] <- paste( "\n<br>\n\n###", 
	gsub("<h3>([A-z?() -]*)<\\/h3>", "\\1", x[grep("h3>", x)]) )

# Symbols
x[x == "<hr>"] <- "***" # "\n***\n"
x[grep("<hr", x)] <- gsub("<hr[ ].*>", "***", x[grep("<hr", x)])
x[grep("&lt;", x)] <- gsub("&lt;", "<", x[grep("&lt;", x)])
x[grep("&amp;", x)] <- gsub("&amp;", "&", x[grep("&amp;", x)])
x[grep("&gt;", x)] <- gsub("&gt;", "<", x[grep("&gt;", x)])
x[grep('<span style="“font-family:" courier;"="">.*</span>', x)] <- 
	gsub('<span style="“font-family:" courier;"="">(.*)</span>', '\\1', 
			x[grep('<span style="“font-family:" courier;"="">.*</span>', x)])
			
# Data
x[grep("../../../data", x)] <- 
	gsub("../../../data", "https://www.zoology.ubc.ca/~bio501/data", x[grep("../../../data", x)])

x[grep("../../../images", x)] <- 
	gsub("../../../images", "images", x[grep("../../../images", x)])

# code chunks beginning <pre>
# The case when "<pre>" has other text following on the same line
x[grepl("<pre>", x) & nchar(x) > 5] <- 
		paste0( "\n```{r eval = FALSE}\n", 
			sub("<pre>(.*)", "\\1", x[grepl("<pre>", x) & nchar(x) > 5]) )
# remaining cases (**check**)
x[grep("<pre>", x)] <- gsub("<pre>", "\n```{r eval = FALSE}", x[grep("<pre>", x)])


# code chunks ending <\pre>
# The case when "</pre>" has other text before it on the same line
x[grepl("<\\/pre>", x) & nchar(x) > 6] <- 
		paste0( 
			sub("(.*)<\\/pre>", "\\1", x[grepl("<\\/pre>", x) & nchar(x) > 6]), "\n```\n" )
# remaining cases
x[grep("<\\/pre>", x)] <- gsub("<\\/pre>", "```\n", x[grep("<\\/pre>", x)])

# ----------

# Write to Rmd file
cat(x, sep = "\n", file = paste0(sub("txt", "", fname), "Rmd"))