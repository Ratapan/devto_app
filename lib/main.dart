import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devto_app/config/router.dart';
import 'package:devto_app/providers/providers.dart';
import 'package:devto_app/config/database/hive_db.dart';

void main() async {
  await initHiveBD();
  runApp(
    const InitMultiProvider(app: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Devto RTP',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routerConfig: appRouter,
    );
  }
}

