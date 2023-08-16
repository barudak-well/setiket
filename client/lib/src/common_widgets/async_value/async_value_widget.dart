import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/services/services.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  }) : super(key: key);

  final AsyncValue<T> value;

  /// [INFO]
  /// function for success, then return the data
  final Widget Function(T data) data;

  /// [INFO]
  /// function for loading, make loading parent customize
  final Widget Function(Widget loadingWidget)? loading;

  /// [INFO]
  /// function for error, make error parent customize
  final Widget Function(Widget errorWidget)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () {
        const loadingWidget = Center(
          child: LoadingWidget(),
        );
        return loading?.call(loadingWidget) ?? loadingWidget;
      },
      error: (e, stacktrace) {
        final message = NetworkExceptions.getErrorMessage(e as NetworkExceptions);
        final errorWidget = Center(
          child: Text(
            message,
            style: TypographyApp.text1,
            textAlign: TextAlign.center,
          ),
        );
        return error?.call(errorWidget) ?? errorWidget;
      },
    );
  }
}
