import 'package:flutter/material.dart';
import 'package:news/api/models/news.dart';
import 'package:news/news_screen/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news details';

  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 40),
          centerTitle: true,
          backgroundColor: Color(0xff39A552),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          title: Text(
            'news details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            NewsItem(news),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('${news.content}', style: TextStyle(fontSize: 20)),
            ),
            InkWell(
              onTap: () {
                _launchUrl(news.url ?? '');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View Full Article', style: TextStyle(fontSize: 25)),
                  Icon(Icons.arrow_forward_ios, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
