import 'package:app_of_ice_and_fire/di/di_utils.dart';
import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/houses/list/content/house_list_content.dart';
import 'package:app_of_ice_and_fire/ui/widgets/iceandfire_bottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'house_list_bloc.dart';

class HouseListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Houses"),
        ),
      ),
      bottomNavigationBar: IceAndFireBottomNavigationBar(context, 2),
      body: BlocProvider(
        create: (context) => injector<HouseListBloc>(),
        child: HouseListContent(),
      ),
    );
  }
}
