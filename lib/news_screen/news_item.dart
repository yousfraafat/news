import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/models/news.dart';
import 'package:news/extensions.dart';

class NewsItem extends StatelessWidget {
  News? news;

  NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              imageUrl: news?.urlToImage ?? '',
              progressIndicatorBuilder:
                  (context, url, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress),
                  ),
              errorWidget:
                  (context, url, error) => Icon(Icons.error_outline, size: 40),
            ),
          ),
          Text(news!.author ?? '', style: TextStyle(fontSize: 13)),
          Text(
            '${news?.title}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${news?.publishedAt?.formatDate()}',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
