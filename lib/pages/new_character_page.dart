import 'package:flutter/material.dart';
import 'package:text_rpg_client/widgets/custom_app_bar.dart';

class NewCharacterPage extends StatelessWidget {
  const NewCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Criar personagem'),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text('New Character Page'),
          ),
        ),
      ),
    );
  }
}
