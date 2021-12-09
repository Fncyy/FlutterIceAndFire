import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_bloc.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_event.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_state.dart';
import 'package:app_of_ice_and_fire/ui/books/list/content/book_list_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Books"),
        ),
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
