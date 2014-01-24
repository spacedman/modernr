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

```
https://gist.github.com/cjbayesian/8570444
```

In the top right of the code box is a "<>" link which gets the raw
file. Hit that, and save the resulting file. Save it as `buffet_basketball.R` 
somewhere.

RStudio
=======

Start RStudio and use the `File` menu to load the code. 

Now the way a lot of people work is to write a long script like this, and then
use `source` to load it. You can just hit the `Source` button to do that.

That should run the code, it will scroll up the Console window, and some plots will 
flash in the Plots window. Use the arrows to see the previous plots.

Spinning a Report
=================

At the top right of the file pane is an icon that says "Compile an
HTML notebook...".  Hit the button, add a title and an author name,
and set the Notebook type to `knitr::spin` and hit "Compile".

The "spin" function can take any R script, and turn it into a document.
It can also use specially formatted comments to add plain text to the output.

Change some of the "##" comments into "#'", and expand on the text a little:

```
#' What is the expected value of an entry 
#' given a particular level of prediction accuracy?
expected_value(p=0.80)
expected_value(p=0.85)
```

Now re-compile the report. You should see that the text is now outside the code blocks, and without
comment signs.

More Complex Report Writing
===========================

The "spin" process described above is good for quick reports but for more detailed work you need
something else.

