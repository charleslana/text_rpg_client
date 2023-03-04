import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.text,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final Function(String? value) validator;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: text,
        errorMaxLines: 2,
      ),
    );
  }
}
