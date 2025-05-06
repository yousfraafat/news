import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/models/category.dart';
import 'package:news/news_screen/tabs_widget.dart';

class NewsScreen extends StatefulWidget {
  NewsCategory category;
  String? searchQuery;

  NewsScreen(this.category, {this.searchQuery});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSourcesByCategoryId(widget.category.id),
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
          if (snapshot.data?.sources != null &&
              snapshot.data!.sources!.isNotEmpty) {
            return TabsWidget(
              snapshot.data?.sources,
              searchQuery: widget.searchQuery,
            );
          }
          return Center(child: Text('no news sources for this category'));
        }
        return Text('no data to show');
      },
    );
  }
}
