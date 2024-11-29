class Movie {
  final String? name;
  final String? summary;
  final String? imageUrl;
  final String? officialSite;
  final double? rating;

  Movie({
    required this.name,
    required this.summary,
    required this.imageUrl,
    this.officialSite,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final show = json['show']; // Access the nested 'show' object
    return Movie(
      name: show?['name'], // Get the name of the show
      summary: show?['summary'], // Get the summary
      imageUrl: show?['image']?['medium'], // Get medium image URL
      officialSite: show?['officialSite'], // Get official site URL
      rating: show?['rating']?['average']?.toDouble(), // Get average rating
    );
  }
}
