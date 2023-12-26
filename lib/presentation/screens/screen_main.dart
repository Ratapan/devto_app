import 'package:devto_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  static const name = 'main-screen';
  final int pageIndex;

  const MainScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeScreen(),
    ConfigsScreen(),
    SearchScreen(tabIndex: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentIndex: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  const CustomAppBar({super.key, required this.currentIndex});

  void changeScreen(BuildContext context, int newIndex) {
    context.go('/main/$newIndex');
  }

  void goToHome(BuildContext context) {
    context.go('/main/0'); // Volver a Home
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('DevTo Ratapan')),
      leading: IconButton(
        icon: Icon(currentIndex == 0 ? Icons.menu_outlined : Icons.arrow_back),
        onPressed: currentIndex == 0
            ? () {
                changeScreen(context, 1);
              }
            : () => goToHome(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            changeScreen(context, 2);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Define el tamaño
}
