import 'package:devto_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/models/models.dart';

class ArticleScreen extends StatelessWidget {
  final int articleId;

  const ArticleScreen({super.key, required this.articleId});
  static const name = 'article-screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, provider, child) {
        // Usar FutureBuilder para manejar la operación asíncrona
        return FutureBuilder<Article>(
          future: provider.getArticleById(articleId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Scaffold(
                  body: Center(child: Text('Error: ${snapshot.error}')));
            } else if (snapshot.hasData) {
              final article = snapshot.data!;
              return Scaffold(
                body: ArticleWidget(article: article),
              );
            } else {
              // Manejar el caso en que no hay datos
              return const Text('No data available');
            }
          },
        );
      },
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ArticleHeader(article: article),
          //todo: crear una description(usuario, desc,tags)
          //todo: crear un body para el markdown
          AticleMarkdownBody(article: article),
          //todo: crear zona de commentarios
        ],
      ),
    );
  }
}

class AticleMarkdownBody extends StatelessWidget {
  const AticleMarkdownBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Markdown(selectable: true, data: article.bodyMarkdown, ),
    );
  }
}

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    const boxDecorationButton = BoxDecoration(
      color: Color.fromARGB(120, 0, 0, 0), // Color de fondo del botón
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(132, 179, 255, 245),
          blurRadius: 2.0,
          spreadRadius: 1.0,
          offset: Offset(0, 0),
        ),
      ],
      shape: BoxShape.circle, // Forma del contenedor, en este caso circular
    );
    var boxDecorationGradient = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.black.withOpacity(0.9), // Más opaco en la parte inferior
          Colors.transparent, // Transparente hacia la parte superior
        ],
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Hero(
          tag: article.id,
          child: Image(
            image: article.coverImage == 'default'
                ? const AssetImage('assets/images/default.jpg') as ImageProvider
                : NetworkImage(article.coverImage),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        Container(
          height: 100,
          decoration: boxDecorationGradient,
        ),
        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Container(
                  decoration: boxDecorationButton,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  article.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
