class FlareTag {
  String name;
  String bgColorHex;
  String textColorHex;

  FlareTag({
    required this.name,
    required this.bgColorHex,
    required this.textColorHex,
  });
  factory FlareTag.fromMap(Map<String, dynamic> json) {
    return FlareTag(
      name: json['name'] ?? '',
      bgColorHex: json['bg_color_hex'] ?? '',
      textColorHex: json['text_color_hex'] ?? '',
    );
  }
}
