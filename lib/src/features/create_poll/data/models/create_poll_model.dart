class CreatePollModelFields {
  static const String id = "id";
  static const String createdAt = "updatedAt";
  static const String updatedAt = "updatedAt";
  static const String name = "name";
  static const String authorId = "authorId";
  static const String topicId = "topicId";
  static const String archived = "archived";
}

class CreatePollModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final int authorId;
  final int topicId;
  final bool archived;

  CreatePollModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.authorId,
    required this.topicId,
    required this.archived,
  });

  CreatePollModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    int? authorId,
    int? topicId,
    bool? archived,
  }) {
    return CreatePollModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      authorId: authorId ?? this.authorId,
      topicId: topicId ?? this.topicId,
      archived: archived ?? this.archived,
    );
  }

  factory CreatePollModel.fromJson(Map<String, dynamic> json) => CreatePollModel(
        id: json[CreatePollModelFields.id] as int? ?? 0,
        createdAt:
            DateTime.parse(json[CreatePollModelFields.createdAt]) as DateTime? ?? DateTime.now(),
        updatedAt:
            DateTime.parse(json[CreatePollModelFields.updatedAt]) as DateTime? ?? DateTime.now(),
        name: json[CreatePollModelFields.name] as String? ?? "",
        authorId: json[CreatePollModelFields.authorId] as int? ?? 0,
        topicId: json[CreatePollModelFields.topicId] as int? ?? 0,
        archived: json[CreatePollModelFields.archived] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        CreatePollModelFields.id: id,
        CreatePollModelFields.createdAt: createdAt,
        CreatePollModelFields.updatedAt: updatedAt,
        CreatePollModelFields.name: name,
        CreatePollModelFields.authorId: authorId,
        CreatePollModelFields.topicId: topicId,
        CreatePollModelFields.archived: archived,
      };
  CreatePollModel.empty()
      : this(
            id: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            name: "",
            authorId: 0,
            topicId: 0,
            archived: false);
}
