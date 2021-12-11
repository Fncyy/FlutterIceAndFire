import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/book_detail.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list.dart';
import 'package:flutter/material.dart';

void main() {
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(IceAndFireApp());
}

const BOOK_LIST_PAGE = '/bookList';
const BOOK_DETAIL_PAGE = '/bookDetail';
const CHARACTER_LIST_PAGE = '/characterList';
const CHARACTER_DETAIL_PAGE = '/characterDetail';
const HOUSE_LIST_PAGE = '/houseList';
const HOUSE_DETAIL_PAGE = '/houseDetail';

class IceAndFireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ice and Fire',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              scaffoldBackgroundColor: Colors.grey,
            ),
            home: BookListPage(),
            onGenerateRoute: (settings) {
              final name = settings.name ?? "";
              if (name.startsWith(BOOK_LIST_PAGE)) {
                return MaterialPageRoute(builder: (context) {
                  return BookListPage();
                });
              }
              if (name.startsWith(BOOK_DETAIL_PAGE)) {
                return MaterialPageRoute(builder: (context) {
                  return BookDetail(settings.arguments as int);
                });
              }
            },
          );
        }
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
