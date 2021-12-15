import 'package:flutter_test/flutter_test.dart';
import 'package:jack_johnson/services/album.dart';
import 'package:jack_johnson/services/album_view_model.dart';

void main() {
  test('test data by inserting directly into Albums, AVM', () async {
    var abm = Album(
        albumImage: 'https://is4-ssl.mzstatic.com/image/thumb/Music125/v4/db/d9/1a/dbd91afa-044d-637b-c557-847863c85a79/source/100x100bb.jpg',
        albumName: 'test_Album_name',
        albumReleaseDate: '2005-03-01T08:00:00Z',
        albumPrice: 10.99);

    var avm = AlbumViewModel(album: abm);
    expect(avm.albumPrice, 10.99);
    expect(avm.albumImage, "https://is4-ssl.mzstatic.com/image/thumb/Music125/v4/db/d9/1a/dbd91afa-044d-637b-c557-847863c85a79/source/100x100bb.jpg");
    expect(avm.albumName, 'test_Album_name');
    expect(avm.releaseDate, '2005-03-01T08:00:00Z');
  });
  test('test functions in fn favorite_collections', () async {
    var abm = Album(
        albumImage: 'https://is4-ssl.mzstatic.com/image/thumb/Music125/v4/db/d9/1a/dbd91afa-044d-637b-c557-847863c85a79/source/100x100bb.jpg',
        albumName: 'test_Album_name',
        albumReleaseDate: '2005-03-01T08:00:00Z',
        albumPrice: 10.99);

    var avm = AlbumViewModel(album: abm);
    List<AlbumViewModel> _albums = <AlbumViewModel>[];
    _albums.add(avm);
    expect(_albums.length, 1);

    var allAlbums = _albums.map((e) => e.albumName).toList();
    expect(allAlbums.length, 1);

    _albums.removeWhere((element) => element.albumName == 'test_Album_name');
    expect(_albums.length, 0);

  });
}
