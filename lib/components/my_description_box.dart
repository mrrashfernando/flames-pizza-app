import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Define text styles
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ), // Border.all
          borderRadius: BorderRadius.circular(8),
        ), // BoxDecoration
        padding: const EdgeInsets.all(25), // Padding inside the container
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space between columns
          children: [
            // Delivery Fee Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$0.99', style: myPrimaryTextStyle), // Delivery fee value
                Text(
                  'Delivery fee',
                  style: mySecondaryTextStyle,
                ), // Label for delivery fee
              ],
            ),

            // Delivery Time Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '15-30 min',
                  style: myPrimaryTextStyle,
                ), // Delivery time value
                Text(
                  'Delivery time',
                  style: mySecondaryTextStyle,
                ), // Label for delivery time
              ],
            ),
          ],
        ),
      ),
    );
  }
}
