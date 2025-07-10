import 'package:flutter/material.dart';
import 'login_toggle.dart'; // <-- your original import
import 'news_page.dart';   // <-- added import for NewsListScreen
import 'product_detail.dart';
import 'search_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ECommerceHomePage(),
    );
  }
}

class ECommerceHomePage extends StatefulWidget {
  const ECommerceHomePage({super.key});

  @override
  State<ECommerceHomePage> createState() => _ECommerceHomePageState();
}

class _ECommerceHomePageState extends State<ECommerceHomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAnimatedLoginPopup(context);
    });
  }

  Widget buildCategory(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade100,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildProductCard(String imagePath, String name, String price) {
    final card = Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.grey.shade100,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.star, size: 12, color: Colors.amber),
              SizedBox(width: 4),
              Text("4.6  86 Reviews", style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );

    // जर pro2.png असेल तर GestureDetector ने wrap करा
    if (imagePath == 'assets/images/pro2.png') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailScreen(),
            ),
          );
        },
        child: card,
      );
    } else {
      return card;
    }
  }


  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget latestNewsCard({
    required String title,
    required String subtitle,
    required String date,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Mega Mall",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.blue,
              height: 1,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Product Name",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.search, color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Banner 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/banner1.png',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2563EB),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Gatis Ongkir",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Selama PPKM!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Periode Mei - Agustus 2021",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCategory(Icons.fastfood, "Foods"),
                  buildCategory(Icons.card_giftcard, "Gift"),
                  buildCategory(Icons.checkroom, "Fashion"),
                  buildCategory(Icons.devices, "Gadget"),
                  buildCategory(Icons.computer, "Comp"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Featured Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Featured Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Banner 2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/banner2.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Best Sellers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Best Sellers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Blue Promo Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Modular\nHeadphone",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Shop now  →",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/pro2.png',
                      height: 300,
                      width: 170,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // New Arrivals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("New Arrivals",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro1.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro2.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                  buildProductCard('assets/images/pro3.png', "TMA–2 HD Wireless", "Rp. 1.500.000"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Latest News
            sectionTitle("Latest News"),
            latestNewsCard(
              title: "Philosophy That Addresses Topics Such As Goodness",
              subtitle: "Agar tetap kinclong, bodi motor ten...",
              date: "13 Jan 2021",
              imagePath: 'assets/images/News-1.png',
            ),
            latestNewsCard(
              title:
              "Many Inquiries Outside Of Academia Are Philosophical In The Broad Sense",
              subtitle: "In one general sense, philosophy is ass...",
              date: "13 Jan 2021",
              imagePath: 'assets/images/News-2.png',
            ),
            latestNewsCard(
              title: "Tips Merawat Bodi Mobil agar Tidak Terlihat Kusam",
              subtitle: "Agar tetap kinclong, bodi motor ten...",
              date: "13 Jan 2021",
              imagePath: 'assets/images/News-3.png',
            ),
            // See All News Button
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsListScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'See All News',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "WISHLIST",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "ORDER",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "LOGIN",
          ),
        ],
      ),
    );
  }
}
