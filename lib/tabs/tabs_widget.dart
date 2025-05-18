import 'package:flutter/material.dart';
import 'package:news/api/models/Source.dart';
import 'package:news/news_screen/news_widget.dart';
import 'package:news/tabs/tab_item.dart';

class TabsWidget extends StatefulWidget {
  List<Source>? sourcesList;
  String? searchQuery;

  TabsWidget(this.sourcesList, {this.searchQuery});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList?.length ?? 0,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            tabs: List.generate(widget.sourcesList?.length ?? 0, (index) {
              return TabItem(
                source: widget.sourcesList![index],
                isSelectedTab: selectedIndex == index,
              );
            }),
          ),
          Expanded(
            child:
                widget.sourcesList != null && widget.sourcesList!.isNotEmpty
                    ? NewsWidget(
                      widget.sourcesList![selectedIndex],
                      searchQuery: widget.searchQuery,
                    )
                    : Center(child: Text('no news to show')),
          ),
        ],
      ),
    );
  }
}
