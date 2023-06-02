import 'package:flutter/material.dart';

class RecentSearchSelectionView extends StatelessWidget {
  const RecentSearchSelectionView({this.recentSearchs = const[]});

  final List<String> recentSearchs;

  @override 
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: recentSearchs.map((value) => Chip(label: Text(value))).toList(),
    );
  }
}