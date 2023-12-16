game <- function() {
    player_score <- 0
    bot_score <- 0
    game_state <- 0
    username <- readline("What's your name? : ")
    print(paste('Hi!',username))
    print('Welcome to "rock, paper, scissors" game!')
    hands <- c(rock=1,paper=2,scissors=3)
    hands_table <- data.frame(
        choice = c('Rock','Paper','Scissors','Exit game'),
        select_choice = c(1:3,'anykey except 1-3') 
    )
    print(hands_table)
    while (game_state != 1){ 
    if (is.na(username) == FALSE) {
    result <- choice(hands)
    if (result == 'tie') {
        print(paste('Your Score : ',player_score))
        print(paste('Bot Score : ',bot_score))
    } else if (result == 'win') {
        player_score <- player_score +1
        print(paste('Your Score : ',player_score))
        print(paste('Bot Score : ',bot_score))
    } else if (result == 'lose'){
        bot_score <- bot_score +1
        print(paste('Your Score : ',player_score))
        print(paste('Bot Score : ',bot_score))
    } else {
        print('Exit game!')
        print('Thank you for playing!')
        game_state <- 1
    }
    } else {
        print('username is invalid')
        break
    }

    }
}

choice <- function(hands) {
    player_choice <- readline("What's your choice? : ")
    bot_choice <- sample(hands,1)
    if (player_choice == 1) {
        if (bot_choice ==1) {
            answer <- 'tie'
            }
        else if (bot_choice ==2){
            answer <- 'lose'
        }
        else if (bot_choice ==3) {
            answer <- 'win'
            }
    } else if (player_choice == 2){
        if (bot_choice ==1) {
            answer <- 'win'
            }
        else if (bot_choice ==2){
            answer <- 'tie'
            }
        else if (bot_choice ==3) {
            answer <- 'lose'
            }       
    } else if (player_choice == 3){
        if (bot_choice ==1) {
            answer <- 'lose'
            }
        else if (bot_choice ==2){ 
            answer <- 'win'
            }
        else if (bot_choice ==3) {
            answer <- 'tie'
            }        
    } else {
        answer <- 'exit'
    } 
    
}

game()