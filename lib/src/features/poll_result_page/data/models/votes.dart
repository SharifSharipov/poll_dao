class Votes {
  final int totalVotes;
  final List<int> voteResults;

  Votes({required this.totalVotes, required this.voteResults});

  factory Votes.fromJson(Map<String, dynamic> json) {
    return Votes(
      totalVotes: int.parse(json['totalVotes'].toString()),
      voteResults: json['voteResults'] != null ? List<int>.from(json['voteResults']) : <int>[],
    );
  }
}
