import 'package:flutter/material.dart';
import 'package:jack_johnson/services/album_listview_model.dart';
import 'package:jack_johnson/widgets/album_list_widget.dart';
import 'package:provider/provider.dart';
import 'fav_screen.dart';
import 'features/favorites_collection.dart';

class JackJohnsonAlbumScreen extends StatefulWidget {
  const JackJohnsonAlbumScreen({Key? key}) : super(key: key);
  @override
  _JackJohnsonAlbumScreenState createState() => _JackJohnsonAlbumScreenState();
}

class _JackJohnsonAlbumScreenState extends State<JackJohnsonAlbumScreen> {
  // On start, it calls the fetchAlbums method to retrive all the Albums from the API call
  @override
  void initState() {
    super.initState();
    Provider.of<AlbumListViewModel>(context, listen: false).fetchAlbums("https://itunes.apple.com/lookup?id=909253&entity=album&sort=recent");
  }

  @override
  Widget build(BuildContext context) {
    // Once data has been added to the, it passes to the AlbumListWidgt()'s constructor to be shown as a ListTile
    final albumListVM = Provider.of<AlbumListViewModel>(context);
    // Number of Albums Favorited
    int favCount = Provider.of<FavoritesCollection>(context, listen: true).getLength();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jack Johnson"),
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
      body: albumListVM.albums.isEmpty
          ? const Center(
              child: Text("No Albums found"),
            )
          : AlbumListWidgt(albums: albumListVM.albums),
    );
  }
}
