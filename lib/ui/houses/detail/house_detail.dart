import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/house_detail_bloc.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/widgets/house_detail_loading.dart';
import 'package:app_of_ice_and_fire/ui/widgets/row_element.dart';
import 'package:app_of_ice_and_fire/ui/widgets/section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class HouseDetail extends StatelessWidget {
  final int houseId;

  const HouseDetail(this.houseId, {Key? key}) : super(key: key);

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
      create: (context) => injector<HouseDetailBloc>(),
      child: BlocBuilder<HouseDetailBloc, HouseDetailState>(
        builder: (context, state) {
          if (state is HouseDetailLoadingState) {
            BlocProvider.of<HouseDetailBloc>(context)
                .add(HouseDetailLoadHouseEvent(houseId));
            return HouseDetailLoading();
          }
          if (state is HouseDetailContentReadyState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.house.name),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Section(
                      title: 'General',
                      children: [
                        RowElement(
                          title: 'Region',
                          description: state.house.region,
                        ),
                        RowElement(
                          title: 'Coat of Arms',
                          description: state.house.coatOfArms.isNotEmpty
                              ? state.house.coatOfArms
                              : "Unknown",
                        ),
                        RowElement(
                          title: 'Words',
                          description: state.house.words.isNotEmpty
                              ? state.house.words
                              : "Unknown",
                        ),
                        if (state.house.currentLord != null)
                          RowElement(
                            title: 'Current lord',
                            description: state.house.currentLord!.name,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.house.currentLord!.id,
                              );
                            },
                          ),
                        if (state.house.heir != null)
                          RowElement(
                            title: 'Heir',
                            description: state.house.heir!.name,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.house.heir!.id,
                              );
                            },
                          ),
                        if (state.house.overlord != null)
                          RowElement(
                            title: 'Overlord',
                            description: state.house.overlord!.name,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HOUSE_DETAIL_PAGE,
                                arguments: state.house.overlord!.id,
                              );
                            },
                          ),
                        RowElement(
                          title: 'Founded',
                          description: state.house.founded.isNotEmpty
                              ? state.house.founded
                              : "Unknown",
                        ),
                        if (state.house.founder != null)
                          RowElement(
                            title: 'Founder',
                            description: state.house.founder!.name,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CHARACTER_DETAIL_PAGE,
                                arguments: state.house.founder!.id,
                              );
                            },
                          ),
                        RowElement(
                          title: 'Died out',
                          description: state.house.diedOut.isNotEmpty
                              ? state.house.diedOut
                              : "Unknown",
                          dividerAfter: false,
                        ),
                      ],
                    ),
                    if (state.house.titles.first.isNotEmpty)
                      Section(
                        title: 'Titles',
                        children: [
                          for (int index = 0;
                              index < state.house.titles.length;
                              index++)
                            RowElement(
                              title: state.house.titles[index],
                              dividerAfter:
                                  index != state.house.titles.length - 1,
                            )
                        ],
                      ),
                    if (state.house.seats.first.isNotEmpty)
                      Section(
                        title: 'Seats',
                        children: [
                          for (int index = 0;
                              index < state.house.seats.length;
                              index++)
                            RowElement(
                              title: state.house.seats[index],
                              dividerAfter:
                                  index != state.house.seats.length - 1,
                            )
                        ],
                      ),
                    if (state.house.ancestralWeapons.first.isNotEmpty)
                      Section(
                        title: 'Ancestral Weapons',
                        children: [
                          for (int index = 0;
                              index < state.house.ancestralWeapons.length;
                              index++)
                            RowElement(
                              title: state.house.ancestralWeapons[index],
                              dividerAfter: index !=
                                  state.house.ancestralWeapons.length - 1,
                            )
                        ],
                      ),
                    if (state.house.cadetBranches.isNotEmpty)
                      Section(
                        title: 'Cadet branches',
                        children: [
                          for (int index = 0;
                              index < state.house.cadetBranches.length;
                              index++)
                            RowElement(
                              title: state.house.cadetBranches[index].name,
                              dividerAfter:
                                  index != state.house.cadetBranches.length - 1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  HOUSE_DETAIL_PAGE,
                                  arguments:
                                      state.house.cadetBranches[index].id,
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
