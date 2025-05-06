import 'package:flutter/material.dart';
import 'package:news/categories_screen/categories_screen.dart';
import 'package:news/home_screen/home_drawer.dart';
import 'package:news/api/models/category.dart';
import 'package:news/news_screen/news_screen.dart';
import 'package:news/settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  var searchQuery = '';

  @override
  Widget build(BuildContext context) {
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          centerTitle: true,
          title:
              isSearching == false
                  ? Text(
                    selectedMenuItem == SideMenuItem.settings
                        ? 'settings'
                        : selectedCategory == null
                        ? 'News'
                        : '${selectedCategory?.title}',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                  : TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search Article',
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSearching = false;
                            searchQuery = '';
                          });
                        },
                        icon: Icon(Icons.close, color: Color(0xff39A552)),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searchQuery = searchController.text;
                          });
                        },
                        icon: Icon(Icons.search, color: Color(0xff39A552)),
                      ),
                    ),
                  ),
          actions: [
            if (selectedCategory != null && isSearching == false)
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                icon: Icon(Icons.search),
              )
            else
              SizedBox(),
            SizedBox(width: 10),
          ],
          backgroundColor: Color(0xff39A552),
        ),
        drawer:
            isSearching == false
                ? Drawer(child: HomeDrawer(onMenuItemClick: menuItemClick))
                : null,
        body:
            selectedMenuItem == SideMenuItem.settings
                ? SettingsScreen()
                : selectedCategory == null
                ? CategoriesScreen(categoryClick: selectCategory)
                : NewsScreen(selectedCategory!, searchQuery: searchQuery),
      ),
    );
  }

  SideMenuItem selectedMenuItem = SideMenuItem.categories;

  void menuItemClick(SideMenuItem newMenuItem) {
    setState(() {
      selectedMenuItem = newMenuItem;
      selectedCategory = null;
    });
    Navigator.pop(context);
  }

  NewsCategory? selectedCategory;

  void selectCategory(NewsCategory category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
