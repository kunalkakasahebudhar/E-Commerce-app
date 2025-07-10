import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: const ProductDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () {},
        ),
        title: const Text(
          'Detail Product',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        color: const Color(0xFFFAFAFA),
        child: const ActionButtons(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImageGallery(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const ProductInfo(),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFEDEDED), thickness: 1),
                  const SizedBox(height: 16),
                  const SellerInfo(),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFEDEDED), thickness: 1),
                  const SizedBox(height: 24),
                  const ProductDescription(),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFEDEDED), thickness: 1),
                  const SizedBox(height: 24),
                  const ReviewsSection(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const FeaturedProductsSection(),
          ],
        ),
      ),
    );
  }
}

class ProductImageGallery extends StatelessWidget {
  const ProductImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          color: const Color(0xFFFAFAFA),
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            'assets/images/pro2.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Chip(
            label: const Text(
              '1/5 Foto',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
            backgroundColor: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TMA-2HD Wireless',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0C1A30),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Rp 1.500.000',
          style: TextStyle(
            color: Color(0xFFFE3A30),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('4.6', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Text('86 Reviews', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Chip(
              label: const Text(
                'Tersedia: 250',
                style: TextStyle(color: Color(0xFF3A9B7A), fontSize: 12),
              ),
              backgroundColor: const Color(0xFFEEFAF6),
            ),
          ],
        ),
      ],
    );
  }
}

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shop Larson Electronic',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text('Official Store',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(width: 4),
                  Icon(Icons.verified, color: Colors.blue, size: 16),
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Description Product',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text(
          'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose...',
          style: TextStyle(color: Colors.black54, height: 1.5),
        ),
      ],
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Review (86)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text('4.6',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const ReviewItem(
          name: 'Yelena Belova',
          time: '2 Minggu yang lalu',
          avatarUrl: 'assets/images/yelena_avatar.png',
        ),
        const SizedBox(height: 16),
        const ReviewItem(
          name: 'Stephen Strange',
          time: '1 Bulan yang lalu',
          avatarUrl: 'assets/images/strange_avatar.png',
        ),
        const SizedBox(height: 16),
        const ReviewItem(
          name: 'Peter Parker',
          time: '2 Bulan yang lalu',
          avatarUrl: 'assets/images/parker_avatar.png',
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: BorderSide(color: Colors.grey.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('See All Review',
              style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final String time;
  final String avatarUrl;

  const ReviewItem({
    super.key,
    required this.name,
    required this.time,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(avatarUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                        5,
                            (index) => const Icon(Icons.star,
                            color: Colors.amber, size: 16)),
                  ),
                ],
              ),
            ),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Lorem ipsum dolor sit amet...',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Featured Product',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child:
                  const Text('See All', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                FeaturedProductCard(
                  imageUrl: 'assets/images/pro3.png',
                  name: 'TMA-2 HD Wireless',
                ),
                SizedBox(width: 16),
                FeaturedProductCard(
                  imageUrl: 'assets/images/pro1.png',
                  name: 'TMA-2 HD Wireless',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const FeaturedProductCard(
      {super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Rp. 1.500.000',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 14),
              SizedBox(width: 4),
              Text('4.6', style: TextStyle(fontSize: 12)),
              SizedBox(width: 8),
              Text('86 Reviews',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFE3E3),
              foregroundColor: const Color(0xFFFE3A30),
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, size: 20),
                SizedBox(width: 8),
                Text('Added'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const _AddToCartPopup(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3669C9),
              foregroundColor: Colors.white,
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Add to Cart'),
          ),
        ),
      ],
    );
  }
}

class _AddToCartPopup extends StatelessWidget {
  const _AddToCartPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Product Action',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF4A5568)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildOptionItem(context, 'Add to Wishlist'),
            _buildOptionItem(context, 'Share Product'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product added to cart!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                'Add To Cart',
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
    );
  }

  Widget _buildOptionItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        debugPrint('Clicked on $title');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748),
          ),
        ),
      ),
    );
  }
}
