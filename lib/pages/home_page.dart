import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/widgets/custom_bottom_navigation_bar.dart';
import 'package:text_rpg_client/widgets/side_bar.dart';

import '../controllers/side_bar_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SideBarController sideBarController = Get.find<SideBarController>();

    return SafeArea(
      child: Scaffold(
        key: sideBarController.key,
        drawerEnableOpenDragGesture: false,
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text('Home Page'),
          ),
        ),
        drawer: const SideBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
