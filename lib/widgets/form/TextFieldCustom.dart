import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function onChanged;
  final bool autofocus;

  TextFieldCustom({this.label, this.controller, this.onChanged, this.autofocus});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          Padding(padding: EdgeInsets.only(right: 20), child: Text(label)),
          Flexible(
              child: TextField(
            autofocus: autofocus != null ? autofocus : false,
            controller: controller,
            onChanged: onChanged,
          )),
        ]));
  }
}
