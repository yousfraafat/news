import 'package:flutter/material.dart';
import 'package:news/api/models/category.dart';
import 'package:news/common/ui_error_widget.dart';
import 'package:news/common/ui_state.dart';
import 'package:news/tabs/tabs_widget.dart';
import 'package:news/view_models/sources_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  NewsCategory category;
  String? searchQuery;

  NewsScreen(this.category, {this.searchQuery});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSourceList(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      builder: (context, child) {
        return Consumer<SourcesViewModel>(
          builder: (context, viewModel, child) {
            var state = viewModel.state;
            switch (state) {
              case SuccessState():
                {
                  return TabsWidget(
                    state.data,
                    searchQuery: widget.searchQuery,
                  );
                }
              case LoadingState():
                {
                  return Center(child: CircularProgressIndicator());
                }
              case ErrorState():
                {
                  return UiErrorWidget(
                    serverError: state.serverError,
                    error: state.error,
                    retryPress:
                        () => viewModel.getSourceList(widget.category.id),
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
