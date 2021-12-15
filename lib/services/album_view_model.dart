import 'package:jack_johnson/services/album.dart';

class AlbumViewModel {
  final Album album;
  AlbumViewModel({required this.album});

  String get albumName {
    return album.albumName;
  }

  String get albumImage {
    return album.albumImage;
  }

   String get releaseDate {
    return album.albumReleaseDate;
  }

   double get albumPrice {
    return album.albumPrice;
  }
}
