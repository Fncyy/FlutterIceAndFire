import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/book_detail_bloc.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/widgets/book_detail_loading.dart';
import 'package:app_of_ice_and_fire/ui/widgets/row_element.dart';
import 'package:app_of_ice_and_fire/ui/widgets/section.dart';
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
          if (state is BookDetailLoadingState) {
            BlocProvider.of<BookDetailBloc>(context)
                .add(BookDetailLoadBookEvent(bookId));
            return BookDetailLoading();
          }
          if (state is BookDetailContentReadyState) {
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
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search), label: 'Search'),
                ],
                currentIndex: 0,
                onTap: (index) {
                  _onTabItemTapped(context, index);
                },
                selectedItemColor: Colors.brown,
                unselectedItemColor: Colors.grey,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Section(
                      title: 'General',
                      children: [
                        RowElement(
                          title: 'ISBN',
                          description: state.book.isbn,
                        ),
                        RowElement(
                          title: 'Pages',
                          description: state.book.numberOfPages.toString(),
                        ),
                        RowElement(
                          title: 'Publisher',
                          description: state.book.publisher,
                        ),
                        RowElement(
                          title: 'Country',
                          description: state.book.country,
                        ),
                        RowElement(
                          title: 'Media',
                          description: state.book.mediaType,
                        ),
                        RowElement(
                          title: 'Released',
                          description: state.book.released,
                          dividerAfter: false,
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
                              dividerAfter: index != state.book.authors.length - 1,
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
                              dividerAfter:
                                  index != state.book.povCharacters.length - 1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  CHARACTER_DETAIL_PAGE,
                                  arguments:
                                      state.book.povCharacters[index].id,
                                );
                              },
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
