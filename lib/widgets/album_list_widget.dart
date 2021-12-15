import 'package:flutter/material.dart';
import 'package:jack_johnson/features/favorites_collection.dart';
import 'package:jack_johnson/services/album_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AlbumListWidgt extends StatelessWidget {
  final List<AlbumViewModel> albums;
  AlbumListWidgt({required this.albums});

  final dateFormat = DateFormat('MMMM dd yyyy');
  @override
  Widget build(BuildContext context) {
    List favAlbums = Provider.of<FavoritesCollection>(context, listen: true).isAlbum();
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return album.albumName == " "
            ? const Text(" ")
            : ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(album.albumImage),
                    ),
                  ),
                  width: 50,
                  height: 100,
                ),
                title: Text(album.albumName, style: const TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(album.releaseDate),
                    Text(
                      dateFormat.format(
                        DateTime.parse(album.releaseDate),
                      ),
                    ),
                    Text(
                      "${album.albumPrice}",
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                // isThreeLine: true,
                trailing: IconButton(
                  icon: favAlbums.contains(album.albumName) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                  onPressed: () {
                    if (favAlbums.contains(album.albumName)) {
                      Provider.of<FavoritesCollection>(context, listen: false).removeFav(album.albumName);
                      Provider.of<FavoritesCollection>(context, listen: false).removeFav(album.albumName);
                    } else {
                      Provider.of<FavoritesCollection>(context, listen: false).setData(album);
                    }
                  },
                ));
      },
    );
  }
}
