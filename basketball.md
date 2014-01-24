Basketball
==========

Billionaire investor Warren Buffett is backing a $1B prize to 
anyone who can predict the winners of all 63 "March Madness"
basketball games.

Corey Chivers on the "Bayesian Biologist" blog did a few simple probability
calculations and decided Buffett's money was [pretty safe](http://bayesianbiologist.com/2014/01/22/whats-warren-buffetts-1-billion-basketball-bet-worth/).

Code
====

The code to produce the calculations and figures in the blog post
were made available via [Github's](http://www.github.com) system
of ["Gists"](https://gist.github.com/), a place to post short files
for public consumption.

The URL for Corey Chivers' code is:

[https://gist.github.com/cjbayesian/8570444](https://gist.github.com/cjbayesian/8570444)

You can run this directory from R, using `devtools`:

```
require(devtools)
par(ask=TRUE)
source_gist("8570444")
```

That's handy for sharing snippets of self-contained code - but always check the
code from anyone you don't trust!

We'll do a bit of work with this script so let's download it.

GitHub
======

[GitHub](http://www.github.com) is a web site for software development. As long as your 
code is public there is no charge (you can pay for a private repository for your code).

I'm not going to show you any of the features of GitHub except to use it for you to download
code I've prepared.

Go to my [modernr](https://github.com/spacedman/modernr) page and lower-right you'll see a 
button to download a ZIP file - download that and extract it.

RStudio
=======

Start RStudio and use the `File` menu to load the `script.R` file from the extracted ZIP archive.

Now the way a lot of people work is to write a long script like this, and then
use `source` to load it. You can just hit the `Source` button to do that.

That should run the code, it will scroll up the Console window, and some plots will 
flash in the Plots window. Use the arrows to see the previous plots.

Stitching and Spinning
======================

At the top right of the file pane is an icon that says "Compile an
HTML notebook...".  Hit the button, add a title  and hit "Compile".

You should see a nicely formatted web document appear. The 
script has been "stitched" with the `stitch` function and converted to 
an HTML file which can be viewed with plots in-line with the code.

The "stitch" function can take any R script, and turn it into a
document. A similar process, "spin", can improve the formatting
slightly by using specially formatted comments to add plain text to
the output or modify the code shown.

Change some of the "##" comments into "#'" - this will format them as plain
text in the report, but not affect the ability to `source` the file.  Change the 
first line to this:

```
#' Warren Buffet's 1B Basketball Challenge 
```

Change the section a bit further on to expand the text and set the `echo` option with 
a `#+` comment.

```
#' We can now plot the expected value of an entry depending
#' on how good our predictions might be

#+ echo=FALSE
par(lwd=3,cex=1.3)
curve(expected_value(x),
```

Now re-compile the report, but select `knitr::spin` from the `Notebook Type` option. You should see that the text is now outside the code blocks, and without comment signs, and that the code that creates
the plots is missing.

With this technique you can create a single script file that does the analysis and presents
the results and hides all the code.

More Complex Report Writing
===========================

The "spin" process described above is good for quick reports but for more detailed work you need
something else.

Open the `latex.Rnw` file from the archive. 