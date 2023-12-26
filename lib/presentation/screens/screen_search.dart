import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const name = 'search-screen';
  final int tabIndex;

  const SearchScreen({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('search'),
    ));
  }
}
