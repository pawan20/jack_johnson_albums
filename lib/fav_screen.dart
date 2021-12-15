import 'package:flutter/material.dart';
import 'package:jack_johnson/features/favorites_collection.dart';
import 'package:provider/provider.dart';

import 'widgets/album_list_widget.dart';

class FavCollection extends StatefulWidget {
  FavCollection({Key? key}) : super(key: key);

  @override
  _FavCollectionState createState() => _FavCollectionState();
}

class _FavCollectionState extends State<FavCollection> {
  @override
  Widget build(BuildContext context) {
    // Retrieve Favorited Albums   
    var albums = Provider.of<FavoritesCollection>(context, listen: true).getData();
    // Retrieve Number os Favorited Albums
    int favCount = Provider.of<FavoritesCollection>(context, listen: true).getLength();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Albums"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavCollection(),
                ),
              );
            },
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, right: 15.0),
                  child: Icon(Icons.favorite),
                ),
                favCount == 0
                    ? const SizedBox.shrink()
                    : Positioned(
                        top: 3.0,
                        right: 4.0,
                        child: CircleAvatar(
                          radius: 12.0,
                          backgroundColor: Colors.amber,
                          child: Text(
                            favCount == 0 ? ' ' : favCount.toString(),
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
      body: favCount == 0 ? const Center(child: Text("No Favorite Albums"),) : AlbumListWidgt(albums: albums),
    );
  }
}
