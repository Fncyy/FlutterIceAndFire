import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/houses/list/content/house_list_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'house_list_bloc.dart';

class HouseListPage extends StatelessWidget {
  void _onTabItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(BOOK_LIST_PAGE, (route) => false);
        }
        break;
      case 1:
        {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(CHARACTER_LIST_PAGE, (route) => false);
        }
        break;
      case 2:
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
          child: Text("Houses"),
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
        currentIndex: 2,
        onTap: (index) {
          _onTabItemTapped(context, index);
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
      body: BlocProvider(
        create: (context) => injector<HouseListBloc>(),
        child: HouseListContent(),
      ),
    );
  }
}
