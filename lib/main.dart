import 'package:devto_app/config/router.dart';
import 'package:flutter/material.dart';
import 'package:devto_app/config/database/hive_db.dart';
import 'package:provider/provider.dart';
import 'package:devto_app/providers/providers.dart';

void main() async {
  await initHiveBD();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ApiTokenProvider()),
        ChangeNotifierProvider(create: (_) => BtnPositionProvider()),
        
      ],
      child: const MyApp(),
    ),
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
      routerConfig:  appRouter,
    );
  }
}
