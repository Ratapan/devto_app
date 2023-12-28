


import 'dart:convert';


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
    String? coverImage;
    List<String> tagList;
    String canonicalUrl;
    int readingTimeMinutes;
    User user;

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
                 this.coverImage,
        required this.tagList,
        required this.canonicalUrl,
        required this.readingTimeMinutes,
        required this.user,
    });

    get backgroundImage {
      if ( coverImage != null ) {
        return coverImage;
      }

      return 'https://i.stack.imgur.com/GNhxO.png';
    }

factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        typeOf: json['type_of'],
        id: json['id'],
        title: json['title'],
        description: json['description'],
        published: json['published'],
        publishedAt: json['published_at'],
        slug: json['slug'],
        path: json['path'],
        url: json['url'],
        commentsCount: json['comments_count'],
        publicReactionsCount: json['public_reactions_count'],
        pageViewsCount: json['page_views_count'],
        publishedTimestamp: json['published_timestamp'],
        bodyMarkdown: json['body_markdown'],
        positiveReactionsCount: json['positive_reactions_count'],
        coverImage: json['cover_image'],
        tagList: List<String>.from(json['tag_list'].map((x) => x)),
        canonicalUrl:json['canonical_url'],
        readingTimeMinutes:json['reading_time_minutes'],
        user:json['user'],
    );
}

class User {
    String name;
    String username;
    dynamic twitterUsername;
    String githubUsername;
    int userId;
    dynamic websiteUrl;
    String profileImage;
    String profileImage90;

    User({
        required this.name,
        required this.username,
        required this.twitterUsername,
        required this.githubUsername,
        required this.userId,
        required this.websiteUrl,
        required this.profileImage,
        required this.profileImage90,
    });
}
