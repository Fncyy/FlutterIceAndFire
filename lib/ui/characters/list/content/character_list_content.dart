import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/characters/list/character_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/pagination_view.dart';

class CharacterListContent extends StatefulWidget {
  @override
  _CharacterListContentState createState() => _CharacterListContentState();
}

class _CharacterListContentState extends State<CharacterListContent> {
  final List<Character> _characters = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterListBloc, CharacterListState>(
      listener: (context, state) {
        if (state is CharacterListLoadingState && _characters.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Loading more characters")));
        } else if (state is CharacterListContentReadyState &&
            state.characters.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("No more characters")));
        } else if (state is CharacterListErrorState) {
          BlocProvider.of<CharacterListBloc>(context).isFetching = false;
        }
      },
      builder: (context, state) {
        debugPrint("${state.runtimeType}");
        if (state is CharacterListLoadingState && _characters.isEmpty) {
          BlocProvider.of<CharacterListBloc>(context)
              .add(CharacterListLoadCharactersEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CharacterListContentReadyState) {
          _characters.addAll(state.characters);
          BlocProvider.of<CharacterListBloc>(context).isFetching = false;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (state is CharacterListErrorState && _characters.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CharacterListBloc>(context)
                    ..isFetching = true
                    ..add(CharacterListLoadCharactersEvent());
                },
                icon: const Icon(Icons.refresh),
              )
            ],
          );
        }
        return Scrollbar(
          child: ListView.builder(
            itemCount: _characters.length,
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<CharacterListBloc>(context).isFetching) {
                  BlocProvider.of<CharacterListBloc>(context)
                    ..isFetching = true
                    ..add(CharacterListLoadCharactersEvent());
                }
              }),
            itemBuilder: (context, index) {
              final item = _characters[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CHARACTER_DETAIL_PAGE,
                        arguments: item.id,
                      );
                    },
                    child: ListTile(
                      title: Text(
                        item.name.isNotEmpty ? item.name : "Unknown",
                      ),
                      subtitle: Text(
                        item.aliases.first.isNotEmpty
                            ? item.aliases.first
                            : "Has no known alias",
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
