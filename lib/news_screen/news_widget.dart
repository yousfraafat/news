import 'package:flutter/material.dart';
import 'package:news/api/models/Source.dart';
import 'package:news/common/ui_state.dart';
import 'package:news/news_screen/news_item.dart';
import 'package:news/view_models/news_view_model.dart';
import 'package:provider/provider.dart';

import '../common/ui_error_widget.dart';
import 'news_details_screen.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  String? searchQuery;

  NewsWidget(this.source, {this.searchQuery});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  var viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsList(widget.source.id ?? '', widget.searchQuery ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source != widget.source ||
        oldWidget.searchQuery != widget.searchQuery) {
      viewModel.getNewsList(widget.source.id ?? '', widget.searchQuery ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      builder: (context, child) {
        return Consumer<NewsViewModel>(
          builder: (context, viewModel, child) {
            var state = viewModel.state;
            switch (state) {
              case SuccessState():
                {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsDetailsScreen.routeName,
                            arguments: state.data[index],
                          );
                        },
                        child: NewsItem(state.data[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                    itemCount: state.data.length ?? 0,
                  );
                }
              case LoadingState():
                {
                  return Center(child: CircularProgressIndicator());
                }
              case ErrorState():
                {
                  return UiErrorWidget(
                    error: state.error,
                    serverError: state.serverError,
                    retryPress:
                        () => viewModel.getNewsList(
                          widget.source.id ?? '',
                          widget.searchQuery ?? '',
                        ),
                  );
                }
              case NoDataState():
                {
                  return Center(
                    child: Text(
                      'no news to show',
                      style: TextStyle(fontSize: 25),
                    ),
                  );
                }
            }
          },
        );
      },
    );
  }
}
