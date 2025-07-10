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
      title: 'Search Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', // To use the Inter font, you need to include it in your pubspec.yaml.
      ),
      home: const SearchScreen(), // SearchScreen is the main screen.
    );
  }
}

// SearchScreen is a StatefulWidget to manage the state of the page.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy data for recent searches
  final List<String> _recentSearches = [
    'TMA2 Wireless',
    'Cable',
    'Macbook',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Light background color
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar background
        elevation: 0, // No shadow for app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black), // Back arrow icon
          onPressed: () {
            // Handle back button press
            debugPrint('Back button pressed');
          },
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Product Name',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]), // Search icon
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[600]),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {}); // Update UI to hide clear button
                    },
                  )
                      : null,
                  border: InputBorder.none, // No border for the TextField
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                onChanged: (text) {
                  setState(() {}); // Update UI to show/hide clear button
                },
              ),
            ),
            const SizedBox(height: 24),

            // Recent Searches Section
            Text(
              'Terakhir Dicari', // Recent Searches title
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true, // Make ListView take only necessary space
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
              itemCount: _recentSearches.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey[500], size: 20), // Clock icon
                          const SizedBox(width: 10),
                          Text(
                            _recentSearches[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.grey[500], size: 20), // Close icon
                        onPressed: () {
                          setState(() {
                            _recentSearches.removeAt(index); // Remove item from list
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Featured Product Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Product', // Featured Product title
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle See All button press
                    debugPrint('See All button pressed');
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF3B82F6), // Blue color
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 250, // Fixed height for the horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                children: [
                  _buildProductCard(
                    context,
                    'assets/images/pro3.png', // Local asset image path for drill
                    'TMA-2 HD Wireless',
                    'Rp. 1.500.000',
                    '4.6',
                    '86 Reviews',
                  ),
                  const SizedBox(width: 16),
                  _buildProductCard(
                    context,
                    'assets/images/pro1.png', // Local asset image path for headphones
                    'TMA-2 HD Wireless',
                    'Rp. 1.500.000',
                    '4.6',
                    '86 Reviews',
                  ),
                  const SizedBox(width: 16),
                  // Add more product cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a product card
  Widget _buildProductCard(
      BuildContext context,
      String imagePath, // Changed from imageUrl to imagePath
      String productName,
      String price,
      String rating,
      String reviews,
      ) {
    return Container(
      width: 180, // Fixed width for each product card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset( // Changed from Image.network to Image.asset
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image, color: Colors.grey[400]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3B82F6), // Blue color for price
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16), // Star icon for rating
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      reviews,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(), // Pushes the three dots icon to the right
                    Icon(Icons.more_vert, color: Colors.grey[500], size: 20), // Three dots icon
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}