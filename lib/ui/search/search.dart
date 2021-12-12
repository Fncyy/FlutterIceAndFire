import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/ui/search/search_bloc.dart';
import 'package:app_of_ice_and_fire/ui/search/search_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchType type = SearchType.book;

  _SearchPageState();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Search"),
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
        currentIndex: 3,
        onTap: (index) {
          _onTabItemTapped(context, index);
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
      body: BlocProvider(
          create: (context) => injector<SearchBloc>(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CupertinoSlidingSegmentedControl(
                      children: const {
                        SearchType.book: Text('Book'),
                        SearchType.character: Text('Character'),
                        SearchType.house: Text('House'),
                      },
                      onValueChanged: (value) {
                        setState(() {
                          debugPrint("$type -> $value");
                          type = value as SearchType;
                        });
                      },
                      groupValue: type,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CupertinoSearchTextField(
                        placeholder: "Type your query here...",
                        onChanged: (query) {
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchSendFetchEvent(type, query));
                        },
                      ),
                    ),
                    if (state is SearchContentReadyState)
                      for (var item in state.results)
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                var route = "";
                                if (item is Book) {
                                  route = BOOK_DETAIL_PAGE;
                                } else if (item is Character) {
                                  route = CHARACTER_DETAIL_PAGE;
                                } else {
                                  route = HOUSE_DETAIL_PAGE;
                                }

                                Navigator.pushNamed(
                                  context,
                                  route,
                                  arguments: item.id,
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  item.name,
                                ),
                              ),
                            ),
                          ),
                        ),
                  ],
                );
              },
            ),
          )),
    );
  }
}

/* BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInitialState) {

          }

          return const Center(
            child: Text(
              "Something went wrong",
            ),
          );
        },
      ),*/
