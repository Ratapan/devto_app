import 'package:devto_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigsScreen extends StatefulWidget {
  static const name = 'configs-screen';
  const ConfigsScreen({super.key});

  @override
  State<ConfigsScreen> createState() => _ConfigsScreenState();
}

class _ConfigsScreenState extends State<ConfigsScreen> {
  late final bool light;
  late TextEditingController token;

  @override
  void initState() {
    super.initState();
    token = TextEditingController();
  }

  @override
  void dispose() {
    token.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            FutureBuilder(
              future:
                  Provider.of<ApiTokenProvider>(context, listen: false).init(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  token.text =
                      Provider.of<ApiTokenProvider>(context, listen: false)
                          .apiToken;
                  return TextField(
                      obscureText: true,
                      controller: token,
                      decoration: const InputDecoration(
                        labelText: 'API Key de Dev.to',
                        hintText: 'token',
                      ),
                      onSubmitted: (value) {
                        Provider.of<ApiTokenProvider>(context, listen: false)
                            .setApiToken(value);
                      });
                } else {
                  return TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'API Key de Dev.to',
                      hintText: 'token',
                    ),
                    onSubmitted: (value) {
                      Provider.of<ApiTokenProvider>(context, listen: false)
                          .setApiToken(value);
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark mode',
                  style: TextStyle(fontSize: 16),
                ),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.currentTheme == ThemeData.light(),
                      activeColor: Colors.deepPurple,
                      onChanged: (bool value) {
                        themeProvider.changeMode();
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
