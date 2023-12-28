import 'dart:async';
import 'dart:convert';

import 'package:devto_app/data/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:devto_app/data/models/models.dart';

class ArticlesProvider extends ChangeNotifier {
  final String _baseUrl = 'dev.to';
  final String _baseUrlEndPoint = '/api/';
  final List<EndpointApi> _edpointsButtons = [
    EndpointApi(
      name: 'Articulos',
      path: 'articles',
    ),
    EndpointApi(
      name: 'Usuarios',
      path: 'articles',
    ),
    EndpointApi(
      name: 'Otro',
      path: 'articles',
    ),
  ];

  List<EndpointApi> get edpointsButtons => _edpointsButtons;

  Future<String> _getJsonData(String endpoint, String tag,
      [int page = 1]) async {
    final preferencesBox =
        await Hive.openBox<PreferencesModel>('preferencesBox');
    final prefs = preferencesBox.get('apiPrefs');
    print({
      '_baseUrl': _baseUrl,
      'api-key': prefs?.apiToken,
      'page': '$page',
      'tag': tag,
    });
    final url = Uri.https(_baseUrl, '$_baseUrlEndPoint$endpoint', {
      'api-key': prefs?.apiToken,
      'page': '$page',
      'tag': tag,
    });

    final response = await http.get(url);
    print('response:\n.\n ${response.body}');
    return response.body;
  }

  Future<List<Article>> getArticles() async {
    final jsonData = await _getJsonData('articles', 'flutter');
    final data = json.decode(jsonData) as List;
    return data.map((json) => Article.fromMap(json)).toList();
  }
}
