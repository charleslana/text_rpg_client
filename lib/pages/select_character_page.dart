import 'package:flutter/material.dart';

class SelectCharacterPage extends StatelessWidget {
  const SelectCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text('Select Character Page'),
          ),
        ),
      ),
    );
  }
}
