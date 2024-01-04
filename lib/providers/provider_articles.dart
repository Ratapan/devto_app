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
  bool _searching = false;
  int _selectedEndpoint = 0;

  List<Article> _articles = [];
  final List<EndpointApi> _edpointsButtons = [
    EndpointApi(
      name: 'Articulos',
      path: 'articles',
    ),
    EndpointApi(
      name: 'Organisaciones',
      path: 'organizations/{}/articles',
    ),
  ];

  List<EndpointApi> get edpointsButtons => _edpointsButtons;
  bool get searching => _searching;
  List<Article> get articles => _articles;

  int get selectedEndpoint => _selectedEndpoint;
  void changeEndpoint(int end) {
    _selectedEndpoint = end;
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, String input,
      [int page = 1]) async {
    final preferencesBox =
        await Hive.openBox<PreferencesModel>('preferencesBox');
    final prefs = preferencesBox.get('apiPrefs');

    List<String> splited = input.split(',');
    List<String> tags = splited
        .where((el) => el.isNotEmpty && el[0] != '@' && el[0] != '!')
        .toList();
    List<String> tagsExclude =
        splited.where((el) => el.isNotEmpty && el[0] == '!').toList();

    var queryParameters = {
      'api-key': prefs?.apiToken,
      'page': '$page',
      'tag': tags.join(' '),
      'tags': tags.length > 1 ? tags.join(',') : '',
    };
    if (tagsExclude.isNotEmpty) {
      queryParameters['tags_exclude'] = tagsExclude.join(',');
    }

    List<String> username =
        splited.where((el) => el.isNotEmpty && el[0] == '@').toList();
    if (username.isNotEmpty) {
      queryParameters['username'] = username[0].replaceAll('@', '');
    }

    final url =
        Uri.https(_baseUrl, '$_baseUrlEndPoint$endpoint', queryParameters);

    final response = await http.get(url);
    return response.body;
  }

  void getArticles(String input) async {
    _searching = true;
    notifyListeners(); 

    try {
      final jsonData = await _getJsonData('articles', input);
      final articles = Article.fromJsonToList(jsonData);
      _articles = articles;
    } finally {
      _searching = false;
      notifyListeners(); 
    }
  }

  Future<Article> getArticleById(int id) async {
    try {
      final preferencesBox =
          await Hive.openBox<PreferencesModel>('preferencesBox');
      final prefs = preferencesBox.get('apiPrefs');

      var queryParameters = {
        'api-key': prefs?.apiToken,
      };

      final url = Uri.https(
          _baseUrl, '${_baseUrlEndPoint}articles/$id', queryParameters);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        final article = Article.fromMap(decode);
        return article;
      } else {
        throw Exception('Failed to load article');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
