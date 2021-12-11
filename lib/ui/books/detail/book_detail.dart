import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/book_detail_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class BookDetail extends StatelessWidget {
  final int bookId;

  const BookDetail(this.bookId, {Key? key}) : super(key: key);

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<BookDetailBloc>(),
      child: BlocBuilder<BookDetailBloc, BookDetailState>(
        builder: (context, state) {
          if (state is Loading) {
            BlocProvider.of<BookDetailBloc>(context).add(LoadBookEvent(bookId));
            return BookDetailLoading();
          }
          if (state is ContentReady) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.book.name),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Section(
                      title: 'General',
                      children: [
                        RowElementWithTitle(
                          title: 'ISBN',
                          description: state.book.isbn,
                        ),
                        RowElementWithTitle(
                          title: 'Pages',
                          description: state.book.numberOfPages.toString(),
                        ),
                        RowElementWithTitle(
                          title: 'Publisher',
                          description: state.book.publisher,
                        ),
                        RowElementWithTitle(
                          title: 'Country',
                          description: state.book.country,
                        ),
                        RowElementWithTitle(
                          title: 'Media',
                          description: state.book.mediaType,
                        ),
                        RowElementWithTitle(
                          title: 'Released',
                          description: state.book.released,
                          divider: false,
                        ),
                      ],
                    ),
                    if (state.book.authors.isNotEmpty)
                      Section(
                        title: 'Authors',
                        children: [
                          for (int index = 0;
                              index < state.book.authors.length;
                              index++)
                            RowElement(
                              title: state.book.authors[index],
                              divider: index != state.book.authors.length - 1,
                            )
                        ],
                      ),
                    if (state.book.povCharacters.isNotEmpty)
                      Section(
                        title: 'Pov Characters',
                        children: [
                          for (int index = 0;
                              index < state.book.povCharacters.length;
                              index++)
                            RowElement(
                              title: state.book.povCharacters[index].name,
                              divider:
                                  index != state.book.povCharacters.length - 1,
                            )
                        ],
                      ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Text(
              "Something went wrong",
            ),
          );
        },
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget? child;
  final List<Widget>? children;

  const Section({
    Key? key,
    required this.title,
    this.child,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (child != null) child! else if (children != null) ...children!,
            ],
          ),
        ),
      ),
    );
  }
}

class RowElement extends StatelessWidget {
  final String title;
  final bool divider;

  const RowElement({Key? key, required this.title, this.divider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(title),
                ],
              ),
            ],
          ),
        ),
        if (divider)
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Divider(),
          ),
      ],
    );
  }
}

class RowElementWithTitle extends StatelessWidget {
  final String title;
  final String description;
  final bool divider;

  const RowElementWithTitle(
      {Key? key,
      required this.title,
      required this.description,
      this.divider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(title),
                  const Spacer(),
                  Text(
                    description,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (divider)
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Divider(),
          ),
      ],
    );
  }
}

class BookDetailLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book details'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
