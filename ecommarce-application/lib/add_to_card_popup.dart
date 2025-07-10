import 'package:flutter/material.dart';

// Main function to run the application
void main() {
  runApp(const MyApp());
}

// MyApp is a StatelessWidget, which is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Action Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // To use the Inter font, you need to include it in your pubspec.yaml.
      ),
      home: const ProductActionScreen(), // ProductActionScreen is the main screen.
    );
  }
}

// ProductActionScreen is a StatefulWidget to manage the state of the page.
class ProductActionScreen extends StatefulWidget {
  const ProductActionScreen({super.key});

  @override
  State<ProductActionScreen> createState() => _ProductActionScreenState();
}

class _ProductActionScreenState extends State<ProductActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
            constraints: const BoxConstraints(maxWidth: 400), // Max width 400px
            padding: const EdgeInsets.all(24), // Inner padding
            decoration: BoxDecoration(
              color: Colors.white, // Background color white
              borderRadius: BorderRadius.circular(16), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  blurRadius: 15, // Shadow blur
                  offset: const Offset(0, 10), // Shadow offset
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Column height will be based on its children
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // Popup title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute elements evenly
                  children: [
                    const Text(
                      'Product Action', // Title
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748), // Text color
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF4A5568)), // Close icon
                      onPressed: () {
                        // Logic to handle close button press
                        debugPrint('Close button clicked');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Space between title and options

                // List of options
                _buildOptionItem(context, 'Add to Wishlist'), // Add to Wishlist
                _buildOptionItem(context, 'Share Product'), // Share Product
                // You can add more options here

                const SizedBox(height: 24), // Space between options list and button

                // 'Add To Cart' button
                ElevatedButton(
                  onPressed: () {
                    // Call your 'Add To Cart' logic here
                    debugPrint('Add To Cart button clicked');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product added to cart!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6), // Button color
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    minimumSize: const Size.fromHeight(48), // Minimum button height
                  ),
                  child: const Text(
                    'Add To Cart', // Text on the button
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to create a common widget for options
  Widget _buildOptionItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // You can add your desired logic here
        debugPrint('Clicked on \'$title\'');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16), // Padding
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1), // Bottom border
          ),
        ),
        child: Text(
          title, // Option text
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748), // Text color
          ),
        ),
      ),
    );
  }
}