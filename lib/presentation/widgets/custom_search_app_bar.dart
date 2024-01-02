import 'package:devto_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;
  final TextEditingController searchController = TextEditingController();

  CustomSearchAppBar({super.key, required this.currentIndex});

  void changeScreen(BuildContext context, int newIndex) {
    context.go('/main/$newIndex');
  }

  void goToHome(BuildContext context) {
    context.go('/main/0');
  }

  void searchArticles(BuildContext context) {
    Provider.of<ArticlesProvider>(context,listen: false).getArticles(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Buscar artículos...',
            border: InputBorder.none,
          ),
          onSubmitted: (value) => searchArticles(context),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => goToHome(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            searchArticles(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
