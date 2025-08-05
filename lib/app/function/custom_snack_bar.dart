import 'package:flutter/material.dart';
import 'package:my_debts/app/utils/theme.dart';

void customSnackBar(BuildContext context, String title, {bool label = false}) {
  var snackDemo = SnackBar(
    content: Text(title),
    backgroundColor: const Color.fromARGB(255, 33, 33, 33),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    action: label
        ? SnackBarAction(
            label: 'label',
            onPressed: () {},
            textColor: primaryClr,
          )
        : null,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackDemo);
}
