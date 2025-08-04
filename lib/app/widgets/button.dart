// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.lable,
    required this.onTap,
  }) : super(key: key);
  final String lable;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryClr,
        ),
        child: Text(
          lable,
          style: const TextStyle(
              // color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
