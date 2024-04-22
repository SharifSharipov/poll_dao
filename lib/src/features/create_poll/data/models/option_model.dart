class OptionModel {
  final DateTime? createdAt;
  final String? text;
  final String? image;

  const OptionModel({this.text, this.image, this.createdAt});

  OptionModel copyWith({
    String? text,
    String? image,
  }) {
    return OptionModel(
      createdAt: createdAt,
      text: text ?? this.text,
      image: image ?? this.image,
    );
  }
}
