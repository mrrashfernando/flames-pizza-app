import 'package:flamesdeliveryapps/components/my_quantity_selector.dart';
import 'package:flamesdeliveryapps/models/cart_item.dart';
import 'package:flamesdeliveryapps/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // Create increment and decrement functions
        void onIncrement() {
          restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
        }

        void onDecrement() {
          if (cartItem.quantity > 1) {
            restaurant.removeFromCart(cartItem);
          } else {
            // Handle case where quantity is 1 and needs to be removed from cart
            restaurant.removeFromCart(cartItem);
          }
        }

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary, // Set secondary color from theme
            borderRadius: BorderRadius.circular(8), // Apply rounded corners
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Set margins
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0), // Padding inside the container
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover, // Ensures the image scales correctly
                      ),
                    ),

                    const SizedBox(width: 10), // Space between image and text

                    // Name, price, and quantity selector
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${cartItem.food.price.toStringAsFixed(2)}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    // Quantity selector
                    QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onDecrement: onDecrement, // Decrement functionality
                      onIncrement: onIncrement, // Increment functionality
                    ),
                  ],
                ),
              ),
              // Addons Section
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60, // Hide if no addons
                child: ListView(
                  scrollDirection: Axis.horizontal, // Horizontal list of addons
                  padding:const EdgeInsets.only(left: 10, bottom: 10,right: 10) ,
                  children: cartItem.selectedAddons
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                // Addon name
                                Text(addon.name),
                          
                                // Addon price
                                Text(
                                  ' (\$${addon.price.toStringAsFixed(2)})', 
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            onSelected: (value) {
                              // Handle addon selection/deselection
                            },
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
