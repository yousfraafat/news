import 'dart:ui';

class NewsCategory {
  String imagePath;
  String title;
  Color color;
  String id;

  NewsCategory({
    required this.color,
    required this.title,
    required this.id,
    required this.imagePath,
  });

  static List<NewsCategory> getCategoryList() {
    return [
      NewsCategory(
        color: Color(0xffC91C22),
        title: 'Sports',
        id: 'sports',
        imagePath: 'assets/images/ball.png',
      ),
      NewsCategory(
        color: Color(0xff003E90),
        title: 'Politics',
        id: 'politics',
        imagePath: 'assets/images/Politics.png',
      ),
      NewsCategory(
        color: Color(0xffED1E79),
        title: 'Health',
        id: 'health',
        imagePath: 'assets/images/health.png',
      ),
      NewsCategory(
        color: Color(0xffCF7E48),
        title: 'Business',
        id: 'business',
        imagePath: 'assets/images/business.png',
      ),
      NewsCategory(
        color: Color(0xff4882CF),
        title: 'Environment',
        id: 'environment',
        imagePath: 'assets/images/environment.png',
      ),
      NewsCategory(
        color: Color(0xffF2D352),
        title: 'Science',
        id: 'science',
        imagePath: 'assets/images/science.png',
      ),
    ];
  }
}
