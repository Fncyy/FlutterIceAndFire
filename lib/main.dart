import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list.dart';
import 'package:flutter/material.dart';

void main() {
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(IceAndFireApp());
}

const BOOK_DETAILS_PAGE = '/bookDetails';
const CHARACTER_DETAILS_PAGE = '/characterDetails';
const HOUSE_DETAILS_PAGE = '/houseDetails';

class IceAndFireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Ice and Fire',
            theme: ThemeData(
              primarySwatch: Colors.brown,
            ),
            home: BookListPage(),
            onGenerateRoute: (settings) {
              final name = settings.name ?? "";
              if (name.startsWith(BOOK_DETAILS_PAGE)) {
                return MaterialPageRoute(builder: (context) {
                  return BookDetails(settings.arguments as int);
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
