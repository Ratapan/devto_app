import 'package:devto_app/data/models/model_article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:devto_app/providers/providers.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, provider, child) {
        final articles = provider.articles;

        if (articles.isEmpty) {
          return const Center(child: Text('No hay artículos disponibles'));
        }

        return Expanded(
          child: ListView.separated(
            itemCount: articles.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final article = articles[index];
              return InkWell(
                onTap: () {             
                  context.go('/main/0/article/${article.id}');
                },
                child: ItemHeader(article: article),
              );
            },
          ),
        );
      },
    );
  }
}

class ItemHeader extends StatelessWidget {
  const ItemHeader({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Hero(
          tag:article.id,
          child: Image(
            image: article.coverImage == 'default'
                ? const AssetImage('assets/images/default.jpg') as ImageProvider
                : NetworkImage(article.coverImage),
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.9), // Más opaco en la parte inferior
                Colors.transparent, // Transparente hacia la parte superior
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            article.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        )
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(article.description),
      ),
    );
  }
}
