import 'package:flamesdeliveryapps/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340, // Height when expanded
      collapsedHeight: 120, // Height when collapsed
      floating: false, // Doesn't float above content
      pinned: true, // Stays pinned at the top when collapsed
      actions: [
        // Cart button
        IconButton(
          onPressed: () {
            // Navigate to cart page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white), // White cart icon
        ),
      ],
      backgroundColor: Colors.orange, // Solid orange app bar
      title: const Text(
        "Flames Pizza",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ), // Title when collapsed
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Color.fromARGB(255, 221, 141, 37)], // Orange gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: child, // Background widget (can be an image or any widget)
        ),
        title: title, // Title when expanded
        centerTitle: true, // Center the title
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1, // Set title scaling when expanded
      ),
    );
  }
}
