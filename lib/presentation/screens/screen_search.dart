import 'package:devto_app/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:devto_app/providers/providers.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  static const name = 'search-screen';
  final int tabIndex;

  const SearchScreen({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    var segmentedButtonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all(Size.zero),
      //textStyle: MaterialStateProperty.all(TextStyle(height: .4),),
    );
    List<ButtonSegment> buttonSegments(List<EndpointApi> edpointsButtons) {
      return edpointsButtons
          .map(
            (endpoint) => ButtonSegment(
              value: endpoint,
              label: Text(endpoint.name),
            ),
          )
          .toList();
    }

    final articlesProvider = Provider.of<ArticlesProvider>(context);
    final List<EndpointApi> edpointsButtons = articlesProvider.edpointsButtons;
    final segments = buttonSegments(edpointsButtons);
    return Scaffold(
      appBar: const CustomSearchAppBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Column(
          children: [
            SegmentedButton(
                style: segmentedButtonStyle,
                segments: segments,
                selected: {segments[0].value}),
            const Center(
              child: Text('search'),
            ),
            const ArticlesList(),
          ],
        ),
      ),
    );
  }
}

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, articlesProvider, child) {
        //todo: Arreglar los temas de asincronia
        return FutureBuilder<List<Article>>(
          future: articlesProvider.getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No articles found'),
              );
            }

            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article article = articles[index];
                return ListTile(
                  leading: article.coverImage != null
                      ? Image.network(article.backgroundImage)
                      : null,
                  title: Text(article.title),
                  // ...otros atributos del artículo...
                );
              },
            );
          },
        );
      },
    );
  }
}
