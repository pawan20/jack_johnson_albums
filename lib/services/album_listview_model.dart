import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jack_johnson/services/album_view_model.dart';
import 'web_services.dart';

class AlbumListViewModel extends ChangeNotifier {
  // Stores instance of all Albums in here
  List<AlbumViewModel> albums = <AlbumViewModel>[];

  // "fetchAlbums" called from AlbumScreen to retrive data from the provided link
  Future<void> fetchAlbums(String url) async {
    final result = await Webservice().fetchAlbums(url);
    albums = result.map((item) => AlbumViewModel(album: item)).toList();    
    notifyListeners();
  }
}
