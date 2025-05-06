import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/models/Source.dart';
import 'package:news/news_screen/news_item.dart';

import 'news_details_screen.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  String? searchQuery;

  NewsWidget(this.source, {this.searchQuery});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        query: widget.searchQuery,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('try again'),
              ),
            ],
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          var newsList = snapshot.data?.articles;
          return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NewsDetailsScreen.routeName,
                    arguments: snapshot.data?.articles?[index],
                  );
                },
                child: NewsItem(snapshot.data?.articles?[index]),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: newsList?.length ?? 0,
          );
        }
        return Text('no news to show');
      },
    );
  }
}
