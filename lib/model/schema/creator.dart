part of model;

class Creator {
  final String name;
  final List<dynamic> urls;
  final String? oaissRating;
  final String? oaissRatingDate;
  final String? oaissNotes;
  final String? communityRating;
  final Map<String, dynamic>? attributes;

  Creator(
      {required this.name,
      required this.urls,
      this.oaissRating,
      this.oaissRatingDate,
      this.oaissNotes,
      this.communityRating,
      this.attributes});

  factory Creator.fromRTDB(Map<dynamic, dynamic> json, String creatorName) {
    return Creator(
        name: creatorName,
        urls: json['creator_urls'] as List<dynamic>,
        oaissRating: json['oaiss_rating'] ?? 'N/A',
        oaissRatingDate: json['oaiss_rating_date'] ?? 'N/A',
        oaissNotes: json['oaiss_notes'] ?? 'N/A',
        communityRating: json['community_rating'] ?? 'N/A');
  }
}
