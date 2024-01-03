class User {
  String name;
  String username;
  String twitterUsername;
  String githubUsername;
  int userId;
  String websiteUrl;
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
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        name: json['name'] ?? '',
        username: json['username'] ?? '',
        twitterUsername: json['twitter_username'] ?? '',
        githubUsername: json['github_username'] ?? '',
        userId: json['user_id'] ?? -1,
        websiteUrl: json['website_url'] ?? '',
        profileImage: json['profile_image'] ?? 'default',
        profileImage90: json['profile_image_90'] ?? 'default');
  }
}
