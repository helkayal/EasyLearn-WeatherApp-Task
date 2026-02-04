class ConditionModel {
  final String text;
  final String icon;

  const ConditionModel({required this.text, required this.icon});

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'] as String,
      icon: _normalizeIcon(json['icon']),
    );
  }

  static String _normalizeIcon(String icon) {
    // API returns //cdn...
    if (icon.startsWith('//')) {
      return 'https:$icon';
    }
    return icon;
  }
}
