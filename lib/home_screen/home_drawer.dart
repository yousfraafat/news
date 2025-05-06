import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(SideMenuItem);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  HomeDrawer({super.key, required this.onMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          color: Color(0xff39A552),
          height: 150,
          child: Text(
            'News App!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
        ),
        InkWell(
          onTap: () {
            onMenuItemClick(SideMenuItem.categories);
          },
          child: Row(
            children: [
              Icon(Icons.list, color: Colors.black, size: 50),
              SizedBox(width: 10),
              Text(
                'categories',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onMenuItemClick(SideMenuItem.settings);
          },
          child: Row(
            children: [
              Icon(Icons.settings, color: Colors.black, size: 50),
              SizedBox(width: 10),
              Text(
                'settings',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum SideMenuItem { categories, settings }
