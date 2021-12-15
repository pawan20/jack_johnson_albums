import 'package:flutter/material.dart';
import 'package:jack_johnson/album_screen.dart';
import 'package:jack_johnson/features/favorites_collection.dart';
import 'package:provider/provider.dart';
import 'services/album_listview_model.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AlbumListViewModel()),
          ChangeNotifierProvider(create: (context) => FavoritesCollection()),
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jack Johnson Flutter Challenge',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),      
      home:  const JackJohnsonAlbumScreen(),      
    );
  }
}
