import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/character_detail_bloc.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/widgets/character_detail_loading.dart';
import 'package:app_of_ice_and_fire/ui/widgets/row_element.dart';
import 'package:app_of_ice_and_fire/ui/widgets/section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class CharacterDetail extends StatelessWidget {
  final int characterId;

  const CharacterDetail(this.characterId, {Key? key}) : super(key: key);

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
    return BlocProvider(
      create: (context) => injector<CharacterDetailBloc>(),
      child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        builder: (context, state) {
          if (state is CharacterDetailLoadingState) {
            BlocProvider.of<CharacterDetailBloc>(context)
                .add(CharacterDetailLoadCharacterEvent(characterId));
            return CharacterDetailLoading();
          }
          if (state is CharacterDetailContentReadyState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.character.name),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Section(
                      title: 'General',
                      children: [
                        RowElement(
                          title: 'Gender',
                          description: state.character.gender,
                        ),
                        RowElement(
                          title: 'Culture',
                          description: state.character.culture,
                        ),
                        RowElement(
                          title: 'Born',
                          description: state.character.born.isNotEmpty
                              ? state.character.born
                              : "Unknown",
                        ),
                        RowElement(
                          title: 'Died',
                          description: state.character.died.isNotEmpty
                              ? state.character.died
                              : "Unknown",
                          dividerAfter: state.character.father != null ||
                              state.character.mother != null ||
                              state.character.spouse != null,
                        ),
                        if (state.character.father != null)
                          RowElement(
                            title: 'Father',
                            description: state.character.father!.name,
                            dividerAfter: state.character.mother != null ||
                                state.character.spouse != null,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.character.father!.id,
                              );
                            },
                          ),
                        if (state.character.mother != null)
                          RowElement(
                            title: 'Mother',
                            description: state.character.mother!.name,
                            dividerAfter: state.character.spouse != null,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.character.mother!.id,
                              );
                            },
                          ),
                        if (state.character.spouse != null)
                          RowElement(
                            title: 'Spouse',
                            description: state.character.spouse!.name,
                            dividerAfter: false,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.character.spouse!.id,
                              );
                            },
                          ),
                      ],
                    ),
                    if (state.character.titles.first.isNotEmpty)
                      Section(
                        title: 'Titles',
                        children: [
                          for (int index = 0;
                              index < state.character.titles.length;
                              index++)
                            RowElement(
                              title: state.character.titles[index],
                              dividerAfter:
                                  index != state.character.titles.length - 1,
                            )
                        ],
                      ),
                    if (state.character.aliases.first.isNotEmpty)
                      Section(
                        title: 'Aliases',
                        children: [
                          for (int index = 0;
                              index < state.character.aliases.length;
                              index++)
                            RowElement(
                              title: state.character.aliases[index],
                              dividerAfter:
                                  index != state.character.aliases.length - 1,
                            )
                        ],
                      ),
                    if (state.character.allegiances.isNotEmpty)
                      Section(
                        title: 'Allegiances',
                        children: [
                          for (int index = 0;
                              index < state.character.allegiances.length;
                              index++)
                            RowElement(
                              title: state.character.allegiances[index].name,
                              dividerAfter: index !=
                                  state.character.allegiances.length - 1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  HOUSE_DETAIL_PAGE,
                                  arguments: state.character.allegiances[index].id,
                                );
                              },
                            )
                        ],
                      ),
                    if (state.character.books.isNotEmpty)
                      Section(
                        title: 'Books',
                        children: [
                          for (int index = 0;
                              index < state.character.books.length;
                              index++)
                            RowElement(
                              title: state.character.books[index].name,
                              dividerAfter:
                                  index != state.character.books.length - 1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  BOOK_DETAIL_PAGE,
                                  arguments: state.character.books[index].id,
                                );
                              },
                            )
                        ],
                      ),
                    if (state.character.povBooks.isNotEmpty)
                      Section(
                        title: 'Pov Books',
                        children: [
                          for (int index = 0;
                              index < state.character.povBooks.length;
                              index++)
                            RowElement(
                              title: state.character.povBooks[index].name,
                              dividerAfter:
                                  index != state.character.povBooks.length - 1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  BOOK_DETAIL_PAGE,
                                  arguments: state.character.povBooks[index].id,
                                );
                              },
                            )
                        ],
                      ),
                    if (state.character.tvSeries.first.isNotEmpty)
                      Section(
                        title: 'Tv Series',
                        children: [
                          for (int index = 0;
                              index < state.character.tvSeries.length;
                              index++)
                            RowElement(
                              title: state.character.tvSeries[index],
                              dividerAfter:
                                  index != state.character.tvSeries.length - 1,
                            )
                        ],
                      ),
                    if (state.character.playedBy.first.isNotEmpty)
                      Section(
                        title: 'Played By',
                        children: [
                          for (int index = 0;
                              index < state.character.playedBy.length;
                              index++)
                            RowElement(
                              title: state.character.playedBy[index],
                              dividerAfter:
                                  index != state.character.playedBy.length - 1,
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
