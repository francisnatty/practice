// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {}

class ThemeLight extends ThemeState {
  final ThemeData themeData;
  ThemeLight({
    required this.themeData,
  });
  @override
  List<Object> get props => [themeData];
}

class ThemeDark extends ThemeState {
  final ThemeData themeData;
  ThemeDark({
    required this.themeData,
  });
  @override
  List<Object> get props => [themeData];
}
