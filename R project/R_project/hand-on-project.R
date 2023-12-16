# Magic with Numbers
a <- 10 + 2
print(a) ## 12
b <- a * 3
print(b) ## 36
c <- b - 6
print(c) ## 30
d <- c / 3
print(d) ## 10



A <- 1:5
B <- 1:5

inner <- A %*% B
outer <- A %o% B


# Dice Random Function
dice <- function() {
  sample(1:6,1,TRUE)
}


library("ggplot2")

# roll the dice
df_dice <- replicate(200, dice()) # dice number 1
df_dice2 <- replicate(200, dice()) # dice number 2

# plot sum of 2 dices
qplot(df_dice+df_dice2,binwidth = 1)

# Dice Random Function with Weighted probability
dice <- function() {
  sample(1:6,1,TRUE,prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
}
# roll the new dice
new_df_dice <- replicate(200, dice()) # dice number 1
new_df_dice2 <- replicate(200, dice()) # dice number 2

# plot new dice1
qplot(new_df_dice,binwidth = 1)

# plot new dice2
qplot(new_df_dice2,binwidth = 1)

# plot sum of 2 new dices
qplot(new_df_dice+new_df_dice2,binwidth = 1)


# Create face name of cards
cards <- c('ace','jack','queen','king','ten')
## "ace"   "jack"  "queen" "king"  "ten"  

# Check type of vector 
class(cards)
## "character"

# Create dice vector
dice <- 1:6
## 1 2 3 4 5 6

# Assign name to vector
names(dice) <- c('One','Two','Three','Four','Five','Six')
##  One   Two Three  Four  Five   Six 
##   1     2     3     4     5     6 

# Remove name attributes
names(die) <- NULL

# Dim to 2,3 matrices
dim(dice) <- c(2, 3)
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6


# Create array 
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))


# Create vector of cards
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")
# Create by matrix
matrix(hand1,nrow=5)
matrix(hand1,ncol=2)
dim(hand1) <- c(5,2)

# Create vector of cards (separate card and suit)
hand <- c("ace", "king", "queen", "jack", "ten")
suit <- c("spades","spades","spades","spades","spades")
# Create by array
answer <- array(c(hand,suit), dim = c(5, 2))


gender <- factor(c("male", "female", "female", "male"))

typeof(gender)
## "integer"

attributes(gender)
## $levels
## [1] "female" "male"  
## 
## $class
## [1] "factor"

card <- list('ace','heart',1)

class(deck[[2]])
# "numeric"

write.csv(deck, file = "cards.csv", row.names = FALSE)


# Create deal card functions
deal <- function ( card= deck, qty =1) {
  card[1:qty, ]
}

deal()
##    face   suit    value
## 1  king  spades    13

# Create shuffle deck functions
shuffle <- function (card = deck) {
  card[sample(1:52,52),]
}

# Shuffle the deck
deck <- shuffle()

deal()
##    face   suit    value
## 15 queen  clubs    12


deck <- cards

# Pull Ace card in dataFrame type
deck[c(13, 26, 39, 52), ]

# Pull Ace card in numeric type by pulling only 1 column
deck[c(13, 26, 39, 52),3]
#or
deck$value[c(13, 26, 39, 52)]

# Assign 14 insteal of 1 as new Value
deck$value[c(13, 26, 39, 52)] <- 14


# Logical subsetting
deck$face == 'ace'

# Count Ace cards
sum(deck$face == 'ace')

# put logical subsetting in to [ ] as filter 
deck$value[deck$face == 'ace'] <- 14

# Reset value of cards to 0
deck$value <- 0

# Assign 1 to heart cards
deck$value[deck$suit == 'hearts'] <- 1

# Check result
deck$value[deck$suit == 'hearts']


# Declare variable
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")

# Is w positive?
w > 0
# Is x greater than 10 and less than 20?
x > 10 & x < 20
# Is object y the word February?
y == 'February'
# Is *every* value in z a day of the week?
all(z %in% c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'))


deck$face %in% c('jack','queen','king') & deck$suit %in% c('jack','queen','king')

