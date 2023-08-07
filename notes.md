# Notes / Todo

## The Schema
* Make the Delivery interval a sub-object ala the address, with shorter names
* Order.orderNumber feels redundant. Rename this to make it sound better. I'm thinking "Id"
* Give Address a "To String" feature for nice human reading. - DONE
* Then, give address a seperate "For url" function to convert an address for entry into url.
* Remove the getFullAddress function from the main mulch order object. See above. - DONE

## The Code
* Figure out a way to move stuff out of dashboard.dart. It's way too cluttered.
Maybe make the dialogue a seperate widget whose code is in another file. Something!
* Think about testing the logic that handles which orders are selected.

## The UI
* Figure out why "color.transparent" doesn't actually look transparent. Or maybe it does?


## Ideas

* When the user selects an order, add a button that allows them to see the closest addresses.
* This is the way. Forget writing a complex algorithm that puts orders in the optimal order
* I mean, that would be cool, but this is just peachy. It's what I would want.