import 'package:flutter/material.dart';
import 'package:jack_johnson/services/album_view_model.dart';

class FavoritesCollection with ChangeNotifier {
  // Saves favorite albums in _albums
  final List<AlbumViewModel> _albums = <AlbumViewModel>[];

  // onPress on Favorite Icon, the album is added to the list
  //****     
  //  instead of setting data to "_albums" List. 
  //You could store it in local storage or on a Server into a Database and have it linked to a user
  //****
  setData(AlbumViewModel album) {
    _albums.add(album);
    notifyListeners();
  }

  // Returns list of favorited albums from the _albums list
  getData() {
    return _albums;
  }

  // Checks if albums is already in Favorite list or not
  isAlbum() {
    var allAlbums = _albums.map((e) => e.albumName).toList();
    return allAlbums;
  }

  // get the count of favorite albums to show in Navigation bar
  int getLength() {
    var kkk = _albums.map((e) => e.albumName).toList();
    return kkk.length;
  }

  // onPress on Favorite Icon (sold Icon), the album is removed if it's in the favorite list
  removeFav(String albumName) {
    _albums.removeWhere((element) => element.albumName == albumName);
    notifyListeners();
  }
}
