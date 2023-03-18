import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_rpg_client/controllers/bottom_navigation_bar_controller.dart';
import 'package:text_rpg_client/controllers/side_bar_controller.dart';
import 'package:text_rpg_client/widgets/rpg_awesome_icons.dart';

class CustomBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SideBarController sideBarController = Get.find<SideBarController>();

    void changePage(int index) {
      if (index == 0) {
        sideBarController.open();
      }
      controller.changeIndex(index);
    }

    return Obx(() {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(RpgAwesome.scroll_unfurled),
            label: 'Mapas',
          ),
          BottomNavigationBarItem(
            icon: Icon(RpgAwesome.spinning_sword),
            label: 'Batalhas',
          ),
          BottomNavigationBarItem(
            icon: Icon(RpgAwesome.burning_book),
            label: 'Habilidades',
          ),
          BottomNavigationBarItem(
            icon: Icon(RpgAwesome.dragon),
            label: 'Chefes',
          ),
        ],
        currentIndex: controller.index.value,
        onTap: changePage,
        showUnselectedLabels: false,
      );
    });
  }
}
