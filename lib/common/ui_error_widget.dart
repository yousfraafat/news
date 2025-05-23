import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/api/result.dart';

class UiErrorWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  VoidCallback? retryPress;
  String retryText;

  UiErrorWidget({
    this.error,
    this.serverError,
    this.retryPress,
    this.retryText = 'try again',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(extractErrorMessage()),
        ElevatedButton(
          onPressed: () {
            retryPress;
          },
          child: Text(retryText),
        ),
      ],
    );
  }

  String extractErrorMessage() {
    if (serverError?.message != null) {
      return serverError!.message;
    }
    if (error?.exception != null) {
      var e = error?.exception;
      switch (e) {
        case TimeoutException():
          {
            return 'check internet connection';
          }
        case SocketException():
          {
            return 'check internet connection';
          }
      }
    }
    return 'something went wrong';
  }
}
