class OptionModelFields {
  static const String id = "id";
  static const String text = "text";
  static const String image = "image";
}
class OptionModel {
  final int id;
  final String text;
  final String image;
  OptionModel({required this.id, required this.text, required this.image});
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json[OptionModelFields.id] as int? ?? 0,
      text: json[OptionModelFields.text] as String? ?? "",
      image: json[OptionModelFields.image] as String? ?? "",
    );
  }
  OptionModel copyWith({
    int? id,
    String? text,
    String? image,
  }) {
    return OptionModel(id: id ?? this.id, text: text ?? this.text, image: image ?? this.image);
  }
  Map<String,dynamic>toJson()=>{
    OptionModelFields.id:id,
    OptionModelFields.text:text,
    OptionModelFields.image:image
  };
  @override
  String toString() {
    return 'OptionModel(id: $id, text: $text, image: $image)';
  }
}
