import 'package:flutter/material.dart';

import '../api/models/Source.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelectedTab;

  TabItem({super.key, required this.source, this.isSelectedTab = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: isSelectedTab ? Color(0xff39A552) : null,
        border: Border.all(color: Color(0xff39A552), width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          color: isSelectedTab ? Colors.white : Color(0xff39A552),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
