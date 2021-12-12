import 'package:app_of_ice_and_fire/main.dart';
import 'package:app_of_ice_and_fire/ui/widgets/iceandfire_bottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseDetailLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House details'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: IceAndFireBottomNavigationBar(context, 3)
    );
  }
}