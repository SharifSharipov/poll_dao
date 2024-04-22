import 'package:poll_dao/src/features/custom_sliver_example/data/models/audence_model.dart';
import 'package:poll_dao/src/features/custom_sliver_example/data/models/author_model.dart';
import 'package:poll_dao/src/features/custom_sliver_example/data/models/option_model.dart';
import 'package:poll_dao/src/features/custom_sliver_example/data/models/topic_model.dart';

class CreatePollModelFields {
  static const String id = "id";
  static const String createdAt = "createdAt";
  static const String updatedAt = "updatedAt";
  static const String name = "name";
  static const String authorId = "authorId";
  static const String topicId = "topicId";
  static const String archived = "archived";
  static const String audience = "audience";
  static const String topic = "topic";
  static const String options = "options";
  static const String author = "author";
  static const String totalVotes = "totalVotes";
}

class CreatedPollModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int authorId;
  int topicId;
  bool archived;
  AudienceModel audience;
  TopicModel topic;
  List<OptionModel> options;
  AuthorModel author;
  int totalVotes;
  CreatedPollModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.authorId,
    required this.topicId,
    required this.archived,
    required this.audience,
    required this.topic,
    required this.options,
    required this.author,
    required this.totalVotes,
  });
  CreatedPollModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    int? authorId,
    int? topicId,
    bool? archived,
    AudienceModel? audience,
    TopicModel? topic,
    List<OptionModel>? options,
    AuthorModel? author,
    int? totalVotes,
  }) {
    return CreatedPollModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        authorId: authorId ?? this.authorId,
        topicId: topicId ?? this.topicId,
        archived: archived ?? this.archived,
        audience: audience ?? this.audience,
        topic: topic ?? this.topic,
        options: options ?? this.options,
        author: author ?? this.author,
        totalVotes: totalVotes ?? this.totalVotes);
  }

  factory CreatedPollModel.fromJson(Map<String, dynamic> json) {
    return CreatedPollModel(
        id: json[CreatePollModelFields.id] as int? ?? 0,
        createdAt: DateTime.parse(json[CreatePollModelFields.createdAt] as String? ?? ""),
        updatedAt: DateTime.parse(json[CreatePollModelFields.updatedAt] as String? ?? ""),
        name: json[CreatePollModelFields.name] as String? ?? "",
        authorId: json[CreatePollModelFields.authorId] as int? ?? 0,
        topicId: json[CreatePollModelFields.topicId] as int? ?? 0,
        archived: json[CreatePollModelFields.archived] as bool? ?? false,
        audience:  AudienceModel.fromJson(json[CreatePollModelFields.audience]),
        topic:TopicModel.fromJson( json[CreatePollModelFields.topic]) ,
        options: List<OptionModel>.from(json[CreatePollModelFields.options].map((x) => OptionModel.fromJson(x))),
        author: AuthorModel.fromJson(json[CreatePollModelFields.author]),
        totalVotes: json[CreatePollModelFields.totalVotes] as int? ?? 0,);
  }
  Map<String, dynamic> toJson() {
    return {
      CreatePollModelFields.id: id,
      CreatePollModelFields.createdAt: createdAt,
      CreatePollModelFields.updatedAt: updatedAt,
      CreatePollModelFields.name: name,
      CreatePollModelFields.authorId: authorId,
      CreatePollModelFields.topicId: topicId,
      CreatePollModelFields.archived: archived,
      CreatePollModelFields.audience: audience,
      CreatePollModelFields.topic: topic,
      CreatePollModelFields.options: options,
      CreatePollModelFields.author: author,
      CreatePollModelFields.totalVotes: totalVotes,
    };
  }
}
