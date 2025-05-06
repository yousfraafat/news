import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.5, color: Color(0xff39A552)),
            ),
            child: Row(
              children: [
                Text(
                  'English',
                  style: TextStyle(color: Color(0xff39A552), fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_down, color: Color(0xff39A552)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
