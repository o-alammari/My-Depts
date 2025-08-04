import 'package:flutter/material.dart';

Widget closeBottomSheetWithWhiteBackground(BuildContext context) {
  return CircleAvatar(
    backgroundColor: Colors.grey[200],
    child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.close_sharp,
          color: Colors.grey[500],
        )),
  );
}
