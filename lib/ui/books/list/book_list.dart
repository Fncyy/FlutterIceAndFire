import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_bloc.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_event.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_state.dart';
import 'package:app_of_ice_and_fire/ui/books/list/content/book_list_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatelessWidget {
  void _onTabItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Books"),
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
        ],
        currentIndex: 0,
        onTap: (index) {
          _onTabItemTapped(context, index);
        },
      ),
      body: BlocProvider(
        create: (context) => injector<BookListBloc>(),
        child: BlocBuilder<BookListBloc, BookListState>(
          builder: (context, state) {
            if (state is Loading) {
              BlocProvider.of<BookListBloc>(context).add(LoadBooksEvent());
              return ListLoading();
            } else if (state is ContentReady) {
              return BookListContent(state);
            }

            return const Center(
              child: Text("Something went wrong"),
            );
          },
        ),
      ),
    );
  }
}

class ListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
