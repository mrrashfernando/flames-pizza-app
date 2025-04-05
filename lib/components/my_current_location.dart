import 'package:flamesdeliveryapps/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  // Function to open location search dialog
  void openLocationSearchBox(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          controller: textController, // Linking the controller to the TextField
          decoration: const InputDecoration(hintText: "Enter the address..."),
        ), // TextField
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              textController.clear(); // Clear the text field
            },
            child: const Text("Cancel"),
          ), // MaterialButton

          // Save button
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              if (newAddress.isNotEmpty) {
                // Update the delivery address in the provider
                context.read<Restaurant>().UpdateDeliveryAddress(newAddress);
              }
              Navigator.pop(context); // Close the dialog
              textController.clear(); // Clear the text field after saving
            },
            child: const Text("Save"),
          ), // MaterialButton
        ], // actions
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ), // Text
          GestureDetector(
            onTap: () => openLocationSearchBox(context), // Open the location search dialog
            child: Row(
              children: [
                // Address text from the provider
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ), // TextStyle
                  ),
                ),

                // Drop-down menu icon
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
