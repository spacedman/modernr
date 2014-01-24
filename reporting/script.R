## Warren Buffet's 1B Basketball Challenge ##

expected_value <- function(p,ngames=63,prize=1000000000){
    p^ngames * prize
}

## What is the expected value of an entry 
## given a particular level of prediction accuracy
expected_value(p=0.80)
expected_value(p=0.85)

## Plotted ##
par(lwd=3,cex=1.3)
curve(expected_value(x),
    xlim=c(0.5,0.75),
    ylab='Expected Value (USD)',
    xlab="Probability of correctly predicting a single game")

curve(expected_value(x),
    xlim=c(0.75,0.85),
    ylab='Expected Value (USD)',
    xlab="Probability of correctly predicting a single game")



## Odds that the prize will be awared
winner_odds <- function(x,p=0.85){
    1-(1-(p)^63)^x
}

## A million entries each with 80% accuracy
winner_odds(x=1000000,p=0.8)

## A million entries each with 70% accuracy
winner_odds(x=1000000,p=0.7)

curve(winner_odds(x,p=0.8),
    xlim=c(0,1000000),
    xlab='# of Entrants',
    ylab='Probability of a winner',
    col='blue')
curve(winner_odds(x,p=0.7),
    col='red',add=TRUE)

legend("topleft",
    legend=c('80% accuracy','70% accuracy'),
    col=c('blue','red'),
    lty=1)
