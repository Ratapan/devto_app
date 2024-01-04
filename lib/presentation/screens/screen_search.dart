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
    var buttonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 1,
    );
    List<Widget> getTabs(List<EndpointApi> edpointsButtons) {
      List<Widget> buttons = [];
      edpointsButtons.asMap().forEach((index, endpoint) {
        buttons.addAll([
          TextButton(
              style: buttonStyle,
              child: Text(endpoint.name),
              onPressed: () {
                Provider.of<ArticlesProvider>(context).changeEndpoint(index);
              }),
          const SizedBox(
            width: 4,
          ),
        ]);
      });

      return buttons;
    }

    final articlesProvider = Provider.of<ArticlesProvider>(context);
    final List<EndpointApi> edpointsButtons = articlesProvider.edpointsButtons;
    final tabs = getTabs(edpointsButtons);

    return Consumer<ArticlesProvider>(
      builder: (context, provider, child) {
        if (provider.searching) {
          return Scaffold(
            appBar: CustomSearchAppBar(currentIndex: 0),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: CustomSearchAppBar(currentIndex: 0),
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Row(
                    children: tabs,
                  ),
                ),
                const ArticlesList()
              ],
            ),
          );
        }
      },
    );
  }
}
