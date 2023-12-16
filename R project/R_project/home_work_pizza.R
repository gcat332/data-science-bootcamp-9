menu <- data.frame(
  menu = c('pizza s pan','pizza m pan','pizza l pan','cancel order'),
  price = c(119,239,369,0),
  press = c(1,2,3,'cancel')
)

pizza_favour <- data.frame(
  favour = c('hawaiian','pepperoni','cheese','double pepperoni','double cheese','cancel order'),
  extra_price = c(0,0,0,20,20,0),
  press = c(1,2,3,4,5,'cancel')
)

order_list <- data.frame(
  menu = '',
  favour = '',
  price = ''
)

chatbot <- function() {
  total_price <- 0
  order_state <- 0
  print('Welcome!, Pizza to go chatbot is ready!')
  flush.console()
  username <- readline('What your name? : ')
  cell_tel <- readline('What your cell phone number? : ')
  location <- readline('Where to delivery? : ')
  while (order_state < 1) {
    print(paste('Hi!',username,". Here's our menu today!"))
    print(menu)
    flush.console()
    order_menu <- readline('Which one you want to go? : ')
    if (order_menu == 'cancel') {
      print('Order canceled!, hope we meet again!')
      break
    }
    total_price <- total_price + menu$price[as.numeric(order_menu)]
    print(pizza_favour)
    flush.console()
    order_favour <- readline('Which favour you want to go? : ')
    if (order_menu == 'cancel') {
      print('Order canceled!, hope we meet again!')
      break
    }
    total_price <- total_price + pizza_favour$extra_price[as.numeric(order_favour)]
    order_list[nrow(order_list)+1,] <- list(menu$menu[as.numeric(order_menu)],pizza_favour$favour[as.numeric(order_menu)],menu$price[as.numeric(order_menu)] + pizza_favour$extra_price[as.numeric(order_favour)])
    flush.console()
    order_complete <- readline('Would you like anything else? (Y/N): ')
    if (order_complete == 'N') {
      print('Thank you for ordering!')
      print('Order Summary : ')
      print(paste('Customer Name :',username))
      print(paste('Tel :',cell_tel))
      print(paste('Delivery location :',location))
      print(paste('Total price :',total_price))
      print(order_list)
      order_state <- 1
    } 
  }}

chatbot()


