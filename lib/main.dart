import 'package:flutter/material.dart';
import 'package:devto_app/config/database/hive_db.dart';
import 'package:provider/provider.dart';
import 'package:devto_app/providers/providers.dart';
import 'package:devto_app/presentation/screens/screens.dart';
import 'package:devto_app/data/preferences.dart';

void main() async {
  await initHiveBD();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ApiTokenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devto RTP',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const MainScreen(),
    );
  }
}
