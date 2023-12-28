import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  const CustomSearchAppBar({super.key, required this.currentIndex});

  void changeScreen(BuildContext context, int newIndex) {
    context.go('/main/$newIndex');
  }

  void goToHome(BuildContext context) {
    context.go('/main/0'); // Volver a Home
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: const Center(child: TextField()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => goToHome(context),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
