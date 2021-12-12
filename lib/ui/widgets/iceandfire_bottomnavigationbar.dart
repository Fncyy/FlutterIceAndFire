import 'package:app_of_ice_and_fire/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IceAndFireBottomNavigationBar extends BottomNavigationBar {
  final BuildContext context;
  final int currentIndex;

  IceAndFireBottomNavigationBar(this.context, this.currentIndex)
      : super(
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
          currentIndex: currentIndex,
          onTap: (index) {
            _onTabItemTapped(context, index);
          },
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
        );
}

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
