import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveCustomButton extends StatelessWidget {
  final String textDescription;
  final Function handler;

  AdaptiveCustomButton(this.textDescription, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            borderRadius: BorderRadius.circular(8),
            onPressed: () {
              handler();
            },
            child: Text(textDescription),
          )
        : TextButton(
            style: TextButton.styleFrom(
              primary: Colors.purple,
              backgroundColor: Theme.of(context).textTheme.button?.color,
            ),
            onPressed: () {
              handler();
            },
            child: Text(textDescription),
          );
  }
}
