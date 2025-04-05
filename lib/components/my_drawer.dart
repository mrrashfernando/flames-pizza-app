import 'package:flamesdeliveryapps/pages/settings_page.dart';
import 'package:flamesdeliveryapps/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
  final authService = AuthService();
  authService.signOut();

  // Navigate to the login screen after logout
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 50), // Space for better UI
          // App Header (Optional)
          Text(
            "Flames Delivery",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // Divider for visual separation
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),

          // Home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to home (Ensure HomePage route exists)
              Navigator.pushNamed(context, '/home');
            },
          ),

          // Settings list tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(), // Pushes logout button to the bottom
          // Logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logout(context);
              Navigator.pop(context);
            },
          ),

          const SizedBox(
            height: 20,
          ), // Extra space at the bottom for UI balance
        ],
      ),
    );
  }
}
