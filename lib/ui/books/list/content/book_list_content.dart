import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../book_list_state.dart';

class BookListContent extends StatefulWidget {
  final Content state;

  BookListContent(this.state);

  @override
  _BookListContentState createState() => _BookListContentState(state);
}

class _BookListContentState extends State<BookListContent> {
  Content state;

  _BookListContentState(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.books.length,
      itemBuilder: (context, index) {
        final item = state.books[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Card(
            child: InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  item.name,
                ),
                subtitle: Text(
                  item.released,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
