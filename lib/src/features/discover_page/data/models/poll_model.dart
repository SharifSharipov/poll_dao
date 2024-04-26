class Poll {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final int authorId;
  final int? topicId;
  final bool archived;
  final Audience? audience;
  final Topic? topic;
  final List<Option> options;
  final Author author;
  final int? userVote;
  final PollResult? pollResult;

  Poll(
      {required this.id,
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
      required this.pollResult,
      required this.userVote});

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        name: json['name'],
        authorId: json['authorId'],
        topicId: json['topicId'],
        archived: json['archived'],
        audience: Audience.fromJson(json['audience']),
        topic: null,
        options: (json['options'] as List)
            .map((optionJson) => Option.fromJson(optionJson))
            .toList(),
        author: Author.fromJson(json['author']),
        pollResult: PollResult(totalVotes: json['totalVotes'], voteResults: json['voteResult']),
        userVote: json['userVote']);
  }
}

class Audience {
  final String? maternalLang;
  final String? age;
  final String? gender;
  final String? location;
  final String? education;
  final String? nationality;
  final bool? biometryPassed;

  Audience({
    this.maternalLang,
    this.age,
    this.gender,
    this.location,
    this.education,
    this.nationality,
    this.biometryPassed,
  });

  factory Audience.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Audience();
    }

    return Audience(
      maternalLang: json['maternalLang'],
      age: json['age'],
      gender: json['gender'],
      location: json['location'],
      education: json['education'],
      nationality: json['nationality'],
      biometryPassed: json['biometryPassed'],
    );
  }
}

class Topic {
  final String name;
  final int id;

  Topic({
    required this.name,
    required this.id,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      name: json['name'],
      id: json['id'],
    );
  }
}

class Option {
  final int id;
  final String? text;
  final String? image;

  Option({
    required this.id,
    required this.text,
    this.image,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      text: json['text'],
      image: json['image'],
    );
  }
}

class Author {
  final int id;
  final String email;
  final String name;
  final String? uniqueToken;

  Author({
    required this.id,
    required this.email,
    required this.name,
    this.uniqueToken,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      uniqueToken: json['uniqueToken'],
    );
  }
}


class PollResult {
  final int? totalVotes;
  final List<int>? voteResults;

  PollResult({required this.totalVotes, required this.voteResults});

  factory PollResult.fromJson(Map<String, dynamic> json) {
    return PollResult(
      totalVotes: json['totalVotes'],
      voteResults: List<int>.from(json['voteResults']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalVotes': totalVotes,
      'voteResults': voteResults,
    };
  }
}



