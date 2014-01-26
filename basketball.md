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

You can run this directly from R, using `devtools`:

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

Open the `latex.Rnw` file from the archive. This is a `R-NoWeb` file and consists of
"chunks" of R code mixed with chunk of, in this case, LaTeX code.

Each chunk of code starts with a chunk marker `<<>>==`, with some
possible options, and ends with an `@` marker.

You need to set your Sweave options to use `knitr` - goto Tools, select Options, 
the Sweave section, and set "Weave Rnw files using" to  "knitr". Okay.

Now hit the `Compile PDF` button on the file menu, and if LaTeX is setup you should
see a neat PDF version of the report come up.

Since you can include any LaTeX in this file, you have all the power of LaTeX and
all the power of R in one file.

Writing Packages
================

These report scripts are all well and good, but the functions are stuck in the files. If
I want to use the files elsewhere, I have to copy them out. Copying code is a bad thing, because
since all code has bugs in it, you are creating more bugs.

The R way of keeping one copy of the code is to create packages. The `devtools` package
makes this very easy.

```
require(devtools)
create("bbet")
```

This creates a template new package in a folder called `bbet`. Use RStudio to
open the DESCRIPTION file in that folder, and give your package a short title
and description. Make sure the "Authors" field is filled in too. Something like:

```
Package: bbet
Title: Buffett Betting
Description: Code for the Warren Buffett Basketball Betting
Version: 0.1
Authors@R: "Barry Rowlingson <b.rowlingson@gmail.com> [aut, cre]"
Depends: R (>= 3.0.2)
License: Private
LazyData: true
```

This identifies me as the author and creator. I can now load the package
using devtools' handy functions.

```
load_all("./bbet")
```

Note this function wants the path to the package folder created previously. 

The package doesn't have any functions in it at the moment so that doesn't do much. Open
a new file in RStudio and copy and paste the two function definitions from the `latex.Rnw` file.
Don't copy the Sweave markers, just the functions. 

Now, DONT `source` this file. Save it in the `./bbet/R/` folder and call it something like `odds.R`.

Check your workspace - either type `ls()` in the console or use the
`Workspace` tab. If there's functions called `expected_value` and
`winner_odds` then delete them - in RStudio just hit the brush button
in the `Workspace` menu bar and delete everything in the workspace.

Now do `load_all("./bbet")` again. Type `expected_value` and you should now see your function. But
its not in the `Workspace` - its in your package which is attached and loaded by `devtools`.

This is a Good Thing, because it means all the functions you might have created in a script
are no longer having to be read into your current workspace, cluttering it up. You have 
one definitive copy of the function which you load into any project you want to use it in.

Further tools can let you document your functions.

Exercise
========

Edit the `latex.Rnw` report file to use the package instead of defining the functions inside itself.

Finished Package
================

If you get stuck creating the package then get the ZIP archive from the
`finished`[https://github.com/spacedman/modernr/tree/finished] branch of my github repository.

