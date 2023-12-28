
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('No tienes artículos', style: TextStyle( fontSize: 16),),
          ),
          Center(
            child: Text('descargados', style: TextStyle( fontSize: 16),),
          ),
          SizedBox(height: 8),
          Center(
            child:Icon(Icons.download_outlined, size: 36),
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
