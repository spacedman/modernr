expected_value <- function(p,ngames=63,prize=1000000000){
    p^ngames * prize
}

winner_odds <- function(x,p=0.85){
    1-(1-(p)^63)^x
}

