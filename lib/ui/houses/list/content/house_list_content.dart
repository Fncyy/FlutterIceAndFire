import 'package:app_of_ice_and_fire/domain/model/house.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/houses/list/house_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/pagination_view.dart';

class HouseListContent extends StatefulWidget {
  @override
  _HouseListContentState createState() => _HouseListContentState();
}

class _HouseListContentState extends State<HouseListContent> {
  final List<House> _houses = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HouseListBloc, HouseListState>(
      listener: (context, state) {
        if (state is HouseListLoadingState && _houses.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Loading more houses")));
        } else if (state is HouseListContentReadyState &&
            state.houses.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("No more houses")));
        } else if (state is HouseListErrorState) {
          BlocProvider.of<HouseListBloc>(context).isFetching = false;
        }
      },
      builder: (context, state) {
        debugPrint("${state.runtimeType}");
        if (state is HouseListLoadingState && _houses.isEmpty) {
          BlocProvider.of<HouseListBloc>(context)
              .add(HouseListLoadHousesEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HouseListContentReadyState) {
          _houses.addAll(state.houses);
          BlocProvider.of<HouseListBloc>(context).isFetching = false;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (state is HouseListErrorState && _houses.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<HouseListBloc>(context)
                    ..isFetching = true
                    ..add(HouseListLoadHousesEvent());
                },
                icon: const Icon(Icons.refresh),
              )
            ],
          );
        }
        return Scrollbar(
          child: ListView.builder(
            itemCount: _houses.length,
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<HouseListBloc>(context).isFetching) {
                  BlocProvider.of<HouseListBloc>(context)
                    ..isFetching = true
                    ..add(HouseListLoadHousesEvent());
                }
              }),
            itemBuilder: (context, index) {
              final item = _houses[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HOUSE_DETAIL_PAGE,
                        arguments: item.id,
                      );
                    },
                    child: ListTile(
                      title: Text(
                        item.name.isNotEmpty ? item.name : "Unknown",
                      ),
                      subtitle: Text(
                        item.region.isNotEmpty
                            ? item.region
                            : "Has no known region",
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
