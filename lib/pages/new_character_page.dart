import 'package:flutter/material.dart';

class NewCharacterPage extends StatelessWidget {
  const NewCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
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
