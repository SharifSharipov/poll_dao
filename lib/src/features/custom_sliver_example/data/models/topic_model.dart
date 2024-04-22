class TopicModelFields {
  static const String name = "name";
  static const String id = "id";
}

class TopicModel {
  final String name;
  final int id;
  TopicModel({required this.name, required this.id});
  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      name: json[TopicModelFields.name] as String? ?? "",
      id: json[TopicModelFields.id] as int? ?? 0,
    );
  }
  TopicModel copyWith({
    String? name,
    int? id,
  }) {
    return TopicModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      TopicModelFields.name: name,
      TopicModelFields.id: id,
    };
  }
  @override
  String toString() {
    return 'TopicModel(name: $name, id: $id)';
  }
}
