import 'package:flutter/material.dart';
import 'news_detail.dart'; // <-- Import the detail page

// A model class to hold the data for a news article
class NewsArticle {
  final String title;
  final String subtitle;
  final String date;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imageUrl,
  });
}

// Main application widget
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      home: const NewsListScreen(),
    );
  }
}

// The screen that displays the list of news articles
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final List<NewsArticle> _articles = [
    NewsArticle(
      title: 'Philosophy That Addresses Topics Such As Goodness',
      subtitle: 'Agar tetap kinclong, bodi motor ten...',
      date: '13 Jan 2021',
      imageUrl: 'assets/images/News-1.png',
    ),
    NewsArticle(
      title: 'Many Inquiries Outside Of Academia Are Philosophical In The Broad Sense',
      subtitle: 'In one general sense, philosophy is ass...',
      date: '13 Jan 2021',
      imageUrl: 'assets/images/News-2.png',
    ),
    NewsArticle(
      title: 'Tips Merawat Bodi Mobil agar Tidak Terlihat Kusam',
      subtitle: 'Agar tetap kinclong, bodi motor ten...',
      date: '13 Jan 2021',
      imageUrl: 'assets/images/News-3.png',
    ),
    NewsArticle(
      title: 'Many Inquiries Outside Of Academia Are Philosophical In The Broad Sense',
      subtitle: 'In one general sense, philosophy is ass...',
      date: '13 Jan 2021',
      imageUrl: 'assets/images/News-4.png',
    ),
    NewsArticle(
      title: 'Tips Merawat Bodi Mobil agar Tidak Terlihat Kusam',
      subtitle: 'Agar tetap kinclong, bodi motor ten...',
      date: '13 Jan 2021',
      imageUrl: 'assets/images/News-5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _articles.length,
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final article = _articles[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 3) {
                        // Only the 4th item
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailNewsScreen(),
                          ),
                        );
                      }
                    },
                    child: _buildNewsListItem(article: article),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search News',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildNewsListItem({required NewsArticle article}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                article.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                article.date,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            article.imageUrl,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
