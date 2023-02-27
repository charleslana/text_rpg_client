import 'package:flutter/material.dart';
import 'package:text_rpg_client/themes/text_style_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: getSonySketchEF().copyWith(fontSize: 30),
      ),
      actions: actions,
    );
  }
}
