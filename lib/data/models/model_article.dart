import 'dart:convert';
import 'models.dart';

class Article {
  String typeOf;
  int id;
  String title;
  String description;
  bool published;
  DateTime publishedAt;
  String slug;
  String path;
  String url;
  int commentsCount;
  int publicReactionsCount;
  int pageViewsCount;
  DateTime publishedTimestamp;
  String bodyMarkdown;
  int positiveReactionsCount;
  String coverImage;
  List<String> tagList;
  String canonicalUrl;
  int readingTimeMinutes;
  User user;
  Organization? organization;
  FlareTag? flareTag;

  String? heroId;

  Article({
    required this.typeOf,
    required this.id,
    required this.title,
    required this.description,
    required this.published,
    required this.publishedAt,
    required this.slug,
    required this.path,
    required this.url,
    required this.commentsCount,
    required this.publicReactionsCount,
    required this.pageViewsCount,
    required this.publishedTimestamp,
    required this.bodyMarkdown,
    required this.positiveReactionsCount,
    required this.coverImage,
    required this.canonicalUrl,
    required this.readingTimeMinutes,
    required this.user,
    required this.tagList,
    this.organization,
    this.flareTag,
  });

  get backgroundImage {
    return coverImage;
  }

  static List<Article> fromJsonToList(String str) {
    final jsonDecode = json.decode(str) as List;
    final articleMap = jsonDecode.map((jsonItem) {
      return Article.fromMap(jsonItem);
    });
    return articleMap.toList();
  }

  factory Article.fromMap(Map<String, dynamic> json) {
    return Article(
      typeOf: json['type_of'] ?? '',
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      published:
          json['published'] != null && 
          json['published'].toString() == 'true',
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'])
          : DateTime.now(),
      slug: json['slug'] ?? '',
      path: json['path'] ?? '',
      url: json['url'] ?? '',
      commentsCount: json['comments_count'] ?? 0,
      publicReactionsCount: json['public_reactions_count'] ?? 0,
      pageViewsCount: json['page_views_count'] ?? 0,
      publishedTimestamp: json['published_timestamp'] != null
          ? DateTime.parse(json['published_timestamp'])
          : DateTime.now(),
      bodyMarkdown: json['body_markdown'] ?? '',
      positiveReactionsCount: json['positive_reactions_count'] ?? 0,
      coverImage: json['cover_image'] ?? 'default',
      tagList: json['tag_list'] != null
          ? List<String>.from(json['tag_list'].map((x) => x.toString()))
          : [],
      canonicalUrl: json['canonical_url'] ?? '',
      readingTimeMinutes: json['reading_time_minutes'] ?? 0,
      user: User.fromMap(json['user']),
      flareTag: json['flare_tag'] != null
          ? FlareTag.fromMap(json['flare_tag'])
          : null,
      organization: json['organization'] != null
          ? Organization.fromMap(json['organization'])
          : null,
    );
  }
}
