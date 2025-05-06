import 'package:flutter/material.dart';
import 'package:news/home_screen/home_screen.dart';
import 'package:news/news_screen/news_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
      },
    );
  }
}
