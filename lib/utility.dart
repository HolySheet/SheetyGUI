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
