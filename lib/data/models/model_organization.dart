class Organization {
  String name;
  String username;
  String slug;
  String profileImage;
  String profileImage90;

  Organization({
    required this.name,
    required this.username,
    required this.slug,
    required this.profileImage,
    required this.profileImage90,
  });

  factory Organization.fromMap(Map<String, dynamic> json) {
    return Organization(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      slug: json['slug'] ?? '',
      profileImage: json['profile_image'] ?? '',
      profileImage90: json['profile_image_90'] ?? '',
    );
  }
}
