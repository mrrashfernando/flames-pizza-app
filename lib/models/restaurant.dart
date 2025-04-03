import 'package:collection/collection.dart';
import 'package:flamesdeliveryapps/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu by category

  // Burgers
  final List<Food> pizzas = [
    Food(
      name: "Classic Chicken Pizza",
      description:
          "A crispy pizza crust topped with tender chicken, melted mozzarella, fresh vegetables, and a touch of herbs.",
      imagePath:
          "lib/images/pizza/chick.jpg", // Update the image path if needed
      price: 9.99, // Adjust the price for the pizza
      category: FoodCategory.pizzas, // Change category to pizzas
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
        Addon(name: "Mushrooms", price: 1.29),
      ],
    ),
    Food(
      name: "Vegan Pizza",
      description:
          "A delicious plant-based pizza with fresh vegetables, vegan cheese, and a flavorful tomato sauce, perfect for a healthy, cruelty-free meal.",
      imagePath: "lib/images/pizza/veg.jpg", // Update the image path if needed
      price: 10.99, // Adjust the price for the pizza
      category: FoodCategory.pizzas, // Change category to pizzas
      availableAddons: [
        Addon(name: "Extra vegan cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
        Addon(name: "Mushrooms", price: 1.29),
      ],
    ),
    Food(
      name: "Fish Pizza",
      description:
          "A savory pizza topped with tender fish fillets, melted mozzarella, onions, and a hint of garlic and herbs.",
      imagePath: "lib/images/pizza/fish.jpg", // Update the image path if needed
      price: 12.99, // Adjust the price for the pizza
      category: FoodCategory.pizzas, // Change category to pizzas
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
        Addon(name: "Garlic", price: 0.89),
      ],
    ),
    Food(
      name: "Pepperoni Pizza",
      description:
          "A classic pizza with a crispy crust topped with savory pepperoni slices, melted mozzarella, and a rich tomato sauce.",
      imagePath: "lib/images/pizza/pep.jpg", // Update the image path if needed
      price: 11.99, // Adjust the price for the pizza
      category: FoodCategory.pizzas, // Change category to pizzas
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
        Addon(name: "Mushrooms", price: 1.29),
      ],
    ),
    Food(
      name: "Loaded Pizza",
      description:
          "A pizza piled high with an assortment of toppings, including pepperoni, sausage, mushrooms, onions, and green peppers, topped with extra cheese.",
      imagePath: "lib/images/pizza/load.jpg", // Update the image path if needed
      price: 14.99, // Adjust the price for the pizza
      category: FoodCategory.pizzas, // Change category to pizzas
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.49),
        Addon(name: "Olives", price: 0.99),
        Addon(name: "Bacon", price: 1.79),
      ],
    ),
  ];

  // Pastas
  final List<Food> pastas = [
    Food(
      name: "Mac and Cheese",
      description:
          "A creamy and comforting pasta dish made with elbow macaroni, rich cheddar cheese, and a velvety sauce.",
      imagePath: "lib/images/pasta/mac.jpg", // Update the image path if needed
      price: 8.99, // Adjust the price for the pasta
      category: FoodCategory.pastas, // Category set to pastas
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.49),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Grilled Chicken", price: 2.49),
      ],
    ),
    Food(
      name: "Cheesy Chicken Pasta",
      description:
          "A delicious pasta dish featuring tender grilled chicken, creamy cheese sauce, and your choice of pasta, topped with melted cheese.",
      imagePath:
          "lib/images/pasta/cheesychick.jpg", // Update the image path if needed
      price: 11.99, // Adjust the price for the pasta
      category: FoodCategory.pastas, // Category set to pastas
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.49),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Grilled Vegetables", price: 2.29),
      ],
    ),
    Food(
      name: "Marinara Pasta",
      description:
          "A classic Italian pasta dish with a rich marinara sauce made from tomatoes, garlic, and fresh herbs, served over your favorite pasta.",
      imagePath:
          "lib/images/pasta/marinara.jpg", // Update the image path if needed
      price: 7.99, // Adjust the price for the pasta
      category: FoodCategory.pastas, // Category set to pastas
      availableAddons: [
        Addon(name: "Extra Marinara Sauce", price: 1.29),
        Addon(name: "Grilled Chicken", price: 2.49),
        Addon(name: "Parmesan Cheese", price: 1.49),
      ],
    ),
    Food(
      name: "Spaghetti Bolognese",
      description:
          "A hearty Italian pasta dish featuring a rich and savory meat sauce, slow-cooked with tomatoes, garlic, and aromatic herbs, served over al dente spaghetti.",
      imagePath:
          "lib/images/pasta/spag.jpg", // Ensure the image is in the correct folder
      price: 10.99, // Adjust the price if needed
      category: FoodCategory.pastas, // Category set to pastas
      availableAddons: [
        Addon(name: "Extra Meat Sauce", price: 1.99),
        Addon(name: "Parmesan Cheese", price: 1.49),
        Addon(name: "Garlic Bread", price: 2.49),
      ],
    ),
    Food(
      name: "Veg Mac and Cheese",
      description:
          "A creamy and comforting vegetarian pasta dish made with elbow macaroni, rich cheddar cheese, and a velvety sauce, topped with fresh vegetables.",
      imagePath: "lib/images/pasta/vegmac.jpg", // Ensure the image exists
      price: 9.49, // Adjusted price for the veg version
      category: FoodCategory.pastas, // Assign to pasta category
      availableAddons: [
        Addon(name: "Extra Cheese", price: 1.49),
        Addon(name: "Broccoli", price: 1.29),
        Addon(name: "Mushrooms", price: 1.79),
      ],
    ),
    // Add more salad items here...
  ];

  // Sides
  final List<Food> sides = [
    Food(
    name: "Cheesy Crust Pie",
description:
    "A delicious pie with a cheesy, crispy crust, filled with a savory mix of cheese and your choice of fillings.",
imagePath: "lib/images/sides/crustpie.jpg",  // Replace with the correct image path
price: 3.99,  // Adjust the price as needed
category: FoodCategory.sides,  // Assuming "pies" is a valid category in your enum
availableAddons: [
  Addon(name: "Extra Cheese", price: 1.49),
  Addon(name: "Bacon", price: 1.99),
  Addon(name: "Garlic Sauce", price: 0.99),
],

    ),
     Food(
    name: "Classic Salted Fries",
description:
    "A fresh twist on fries, served with a crisp salad topping, including tomatoes, lettuce, and a tangy dressing.",
imagePath: "lib/images/sides/salt.jpg",  // Replace with the correct image path
price: 2.49,  // Adjust the price as needed
category: FoodCategory.sides,  // Assuming "sides" is a valid category in your enum
availableAddons: [
  Addon(name: "Ranch Dressing", price: 0.99),
  Addon(name: "Grilled Chicken", price: 2.49),
  Addon(name: "Avocado", price: 1.49),
],
    ),
     Food(
      name: "Cheesy Egg Muffin",
description:
    "A warm muffin filled with scrambled eggs, melted cheese, and a savory mix of herbs. Perfect for breakfast or a quick snack.",
imagePath: "lib/images/sides/egg.jpg",  // Replace with the correct image path
price: 3.99,  // Adjust the price as needed
category: FoodCategory.sides,  // Assuming "sides" is a valid category in your enum
availableAddons: [
  Addon(name: "Bacon", price: 1.49),
  Addon(name: "Sausage", price: 1.99),
  Addon(name: "Avocado", price: 1.49),
],

    ),
     Food(
     name: "Cheesy Toast",
description:
    "Crispy toast topped with a generous layer of melted cheese, perfect for a quick snack or side dish.",
imagePath: "lib/images/sides/toast.jpg",  // Replace with the correct image path
price: 2.49,  // Adjust the price as needed
category: FoodCategory.sides,  // Assuming "sides" is a valid category in your enum
availableAddons: [
  Addon(name: "Garlic Butter", price: 0.99),
  Addon(name: "Tomato", price: 0.79),
  Addon(name: "Bacon", price: 1.49),
],

    ),
    // Add more side items here...
  ];

  // Desserts
  final List<Food> desserts = [
    Food(
     name: "Chocolate Molten Lava Cake",
description:
    "A warm, gooey, and indulgent chocolate cake with a molten center, served with vanilla ice cream.",
imagePath: "lib/images/desserts/lava.jpg",  // Replace with the correct image path
price: 4.49,  // Adjust the price as needed
category: FoodCategory.desserts,  // Assuming "desserts" is a valid category in your enum
availableAddons: [
  Addon(name: "Whipped Cream", price: 0.99),
  Addon(name: "Extra Chocolate Sauce", price: 1.99),
  Addon(name: "Strawberries", price: 1.49),
],

    ),
    Food(
  name: "Choco Pizza",
description:
    "A delicious dessert pizza topped with a rich layer of melted chocolate, marshmallows, and a drizzle of caramel.",
imagePath: "lib/images/desserts/choco.jpg",  // Replace with the correct image path
price: 5.99,  // Adjust the price as needed
category: FoodCategory.desserts,  // Assuming "desserts" is a valid category in your enum
availableAddons: [
  Addon(name: "Extra Marshmallows", price: 1.49),
  Addon(name: "Caramel Drizzle", price: 0.99),
  Addon(name: "Crushed Nuts", price: 1.29),
],



    ),
    Food(
    name: "Raspberry Cheesecake",
description:
    "A creamy cheesecake topped with a sweet and tangy raspberry compote.",
imagePath: "lib/images/desserts/rassberry.jpg",  // Replace with the correct image path
price: 4.49,  // Adjust the price as needed
category: FoodCategory.desserts,  // Assuming "desserts" is a valid category in your enum
availableAddons: [
  Addon(name: "Whipped Cream", price: 0.99),
  Addon(name: "Extra Raspberry Sauce", price: 1.49),
  Addon(name: "Chocolate Shavings", price: 1.99),
],


    ),
    Food(
    name: "Dark Chocolate Brownie",
description:
    "A rich and fudgy dark chocolate brownie, served warm with a dusting of powdered sugar.",
imagePath: "lib/images/desserts/brownie.jpg",  // Replace with the correct image path
price: 3.99,  // Adjust the price as needed
category: FoodCategory.desserts,  // Assuming "desserts" is a valid category in your enum
availableAddons: [
  Addon(name: "Vanilla Ice Cream", price: 1.49),
  Addon(name: "Extra Chocolate Sauce", price: 1.99),
  Addon(name: "Whipped Cream", price: 0.99),
],


    ),
    // Add more dessert items here...
  ];

  // Drinks
  final List<Food> drinks = [
    Food(
      name: "Sprite",
      description: "A refreshing citrus drink, perfect for a hot day.",
      imagePath: "lib/images/drinks/sprite.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 0.50),
        Addon(name: "Extra Sugar", price: 0.30),
      ],
    ),
    Food(
      name: "Coco Cola",
description: "A refreshing carbonated drink with a classic cola flavor.",
imagePath: "lib/images/drinks/cola.jpg",  // Replace with the correct image path
price: 1.99,  // Adjust the price as needed
category: FoodCategory.drinks,  // Assuming "drinks" is a valid category in your enum
availableAddons: [
  Addon(name: "Lemon Slice", price: 0.25),
  Addon(name: "Ice", price: 0.00),  // Ice is typically free, adjust if needed
  Addon(name: "Mint Leaves", price: 0.50),
],

    ),
    Food(
     name: "Coke Zero",
description: "A sugar-free, calorie-free cola with a crisp and refreshing taste.",
imagePath: "lib/images/drinks/Coke.jpg",  // Replace with the correct image path
price: 2.49,  // Adjust the price as needed
category: FoodCategory.drinks,  // Assuming "drinks" is a valid category in your enum
availableAddons: [
  Addon(name: "Lemon Slice", price: 0.25),
  Addon(name: "Ice", price: 0.00),  // Ice is typically free, adjust if needed
  Addon(name: "Mint Leaves", price: 0.50),
],

    ),
    Food(
      name: "Orange Juice",
description: "Freshly squeezed orange juice, packed with vitamin C and a tangy taste.",
imagePath: "lib/images/drinks/orange.jpg",  // Replace with the correct image path
price: 2.99,  // Adjust the price as needed
category: FoodCategory.drinks,  // Assuming "drinks" is a valid category in your enum
availableAddons: [
  Addon(name: "Ice", price: 0.00),
  Addon(name: "Mint Leaves", price: 0.50),
  Addon(name: "Sugar", price: 0.25),
],

    ),
    
    // Add more drink items here...
  ];

  // Combine all categories into one list for convenience
  List<Food> get fullMenu => [
    ...pizzas,
    ...pastas,
    ...sides,
    ...desserts,
    ...drinks,
  ];

  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //operations

  final List<CartItem> _cart = [];
  String _deliveryAddress = "6901 Hollywood Blvd";

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      // Add the price of selected addons
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      // Multiply by quantity and add to the total
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void UpdateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------------------------");

    // Loop through cart items
    for (final cartItem in cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
      );

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }

      receipt.writeln();
    }

    receipt.writeln("----------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // Format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
