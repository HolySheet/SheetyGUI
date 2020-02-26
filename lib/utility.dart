import 'dart:io';

import 'package:grpc/grpc.dart' as grpc;
import 'package:flutter/widgets.dart';

extension IntIterableUtility<int> on Iterable {
  sum<int>() => this.reduce((a, b) => a + b);
}

extension IterableUtility<T> on Iterable {
  sumMap<T>(int f(T e)) => this.map((x) => f(x)).reduce((a, b) => a + b);
}

extension GlobalKeyEx on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

extension PathUtility on String {
  /// Replaces both \ and / with the [Platform.pathSeparator].
  String path() => this.replaceAll('(\\|/)', Platform.pathSeparator);

  /// Creates a new [File] object with correct path separators from the given String.
  File file() => File(path());

  /// Creates a new [Directory] object with correct path separators from the given String.
  Directory directory() => Directory(path());
}

extension ErrorStreamCatcher<T> on grpc.ResponseStream<T> {
  grpc.ResponseStream<T> printErrors() {
    handleError((error, stack) => print(
        'An error has occurred during a gRPC request stream. Error:\n$error\nStack:\n$stack'));
    return this;
  }
}

extension ErrorFutureCatcher<T> on grpc.ResponseFuture<T> {
  grpc.ResponseFuture<T> printErrors() {
    catchError((error, stack) => print(
        'An error has occurred during a gRPC request future. Error:\n$error\nStack:\n$stack'));
    return this;
  }
}
