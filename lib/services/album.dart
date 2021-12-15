class Album {
  final String albumImage;
  final String albumName;
  final String albumReleaseDate;
  final double albumPrice;

  Album({required this.albumImage, required this.albumName, required this.albumReleaseDate, required this.albumPrice});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        albumImage: json["artworkUrl60"] ?? " ",
        albumName: json["collectionName"] ?? " ",
        albumReleaseDate: json["releaseDate"] ?? " ",
        albumPrice: json["collectionPrice"]?? 0.0
        );
  }
}
