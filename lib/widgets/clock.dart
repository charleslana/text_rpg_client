import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key, this.dateTime}) : super(key: key);

  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream<dynamic>.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(
          DateFormat('HH:mm:ss').format(
            DateTime.now().copyWith(
              day: dateTime?.day ?? DateTime.now().day,
              hour: dateTime?.hour ?? DateTime.now().hour,
              minute: dateTime?.minute ?? DateTime.now().minute,
            ),
          ),
        );
      },
    );
  }
}
