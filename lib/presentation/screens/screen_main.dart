import 'package:devto_app/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //String token = Provider.of<ApiTokenProvider>(context, listen: false).apiToken;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('DevTo')),
      ),
      body:  const Center(
        child: Column(
          children: [
            Center(child: Text('Hola ssss')),
            //Center(child: Text('token: $token')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).changeMode();
  },
        child: const Icon(Icons.blur_circular_outlined),
      ),
    );
  }
}
