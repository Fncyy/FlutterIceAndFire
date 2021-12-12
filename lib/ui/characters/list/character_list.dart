import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/characters/list/character_list_bloc.dart';
import 'package:app_of_ice_and_fire/ui/characters/list/content/character_list_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListPage extends StatelessWidget {
  void _onTabItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(BOOK_LIST_PAGE, (route) => false);
        }
        break;
      case 1:
        break;
      case 2:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HOUSE_LIST_PAGE, (route) => false);
        }
        break;
      case 3:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(SEARCH_PAGE, (route) => false);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Characters"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book), label: 'Books'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), label: 'Houses'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Search'),
        ],
        currentIndex: 1,
        onTap: (index) {
          _onTabItemTapped(context, index);
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
      body: BlocProvider(
        create: (context) => injector<CharacterListBloc>(),
        child: CharacterListContent(),
      ),
    );
  }
}
