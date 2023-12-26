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
  final token = TextEditingController();

  void init(context) {
    print(Provider.of<ApiTokenProvider>(context, listen: false).apiToken);
    token.text = Provider.of<ApiTokenProvider>(context, listen: false).apiToken;
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              TextField(
                  obscureText: true,
                  controller: token,
                  decoration: const InputDecoration(
                    labelText: 'API Key de Dev.to',
                    hintText: 'token',
                  ),
                  onTapOutside: (PointerDownEvent event) =>
                      Provider.of<ApiTokenProvider>(context, listen: false)
                          .setApiToken(token.text)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dark mode',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                            .currentTheme ==
                        ThemeData.light(),
                    activeColor: Colors.deepPurple,
                    onChanged: (bool value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeMode();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
