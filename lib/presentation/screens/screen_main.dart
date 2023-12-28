import 'package:flutter/material.dart';
import 'package:devto_app/presentation/screens/screens.dart';
import 'package:devto_app/presentation/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  static const name = 'main-screen';
  final int pageIndex;

  MainScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeScreen(),
    ConfigsScreen(),
    SearchScreen(tabIndex: 0),
  ];
  final List<int> widthOutDefaultAppBar = [2];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widthOutDefaultAppBar.contains(pageIndex)) {
          return Scaffold(
            body: IndexedStack(
              index: pageIndex,
              children: viewRoutes,
            ),
          );
        } else {
          return Scaffold(
            appBar: CustomAppBar(currentIndex: pageIndex),
            body: IndexedStack(
              index: pageIndex,
              children: viewRoutes,
            ),
          );
        }
      },
    );
  }
}
