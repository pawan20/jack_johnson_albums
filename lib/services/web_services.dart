import 'dart:async';

import 'package:jack_johnson/services/album.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Album>> fetchAlbums(String albumUrl) async {
    final url = Uri.parse(albumUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final body2 = jsonDecode(response.body);
      List<dynamic> body = body2["results"];
      return body.map((album) {
        return Album.fromJson(album);
      }).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
