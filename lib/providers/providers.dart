

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:devto_app/providers/provider_theme.dart';
import 'package:devto_app/providers/provider_api_key.dart';
import 'package:devto_app/providers/provider_floating_btn_position.dart';
import 'package:devto_app/providers/provider_articles.dart';

export 'package:devto_app/providers/provider_articles.dart';
export 'package:devto_app/providers/provider_theme.dart';
export 'package:devto_app/providers/provider_api_key.dart';
export 'package:devto_app/providers/provider_floating_btn_position.dart';


class InitMultiProvider extends StatelessWidget {
  final Widget app;

  const InitMultiProvider({
    super.key, required this.app,
  });
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ApiTokenProvider()),
        ChangeNotifierProvider(create: (_) => BtnPositionProvider()),
        ChangeNotifierProvider(create: (_) => ArticlesProvider()),
      ],
      child: app,
    );
  }
}
