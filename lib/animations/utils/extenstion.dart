import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension MediaQuerySizeExtension on BuildContext {
  double sizeWidth(double w) {
    return MediaQuery.sizeOf(this).width * w;
  }

  double sizeHeight(double h) {
    return MediaQuery.sizeOf(this).height * h;
  }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension WidgetAnimation on Widget {
  Animate slideInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(
        delay: delay ?? 200.ms,
      ).slideY(
        duration: animationDuration ?? 300.ms,
        begin: begin ?? 0.2,
        end: 0,
        curve: curve ?? Curves.linear,
      );

  Animate fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? 300.ms).fade(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.decelerate,
      );

  Animate something({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(delay: delay ?? 200.ms).shimmer();
}
