import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/characters/list/character_list_bloc.dart';
import 'package:app_of_ice_and_fire/ui/characters/list/content/character_list_content.dart';
import 'package:app_of_ice_and_fire/ui/widgets/iceandfire_bottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Characters"),
        ),
      ),
      bottomNavigationBar: IceAndFireBottomNavigationBar(context, 1),
      body: BlocProvider(
        create: (context) => injector<CharacterListBloc>(),
        child: CharacterListContent(),
      ),
    );
  }
}
