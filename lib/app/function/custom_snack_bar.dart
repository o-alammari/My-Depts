import 'package:flutter/material.dart';
import 'package:testing_2/theme.dart';

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

class snackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed: () {
          const snackdemo = SnackBar(
            content: Text('Hii this is GFG\'s SnackBar'),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);

          // 'showSnackBar' is deprecated and shouldn't be used.
          //Use ScaffoldMessenger.showSnackBar.
          // Scaffold.of(context).showSnackBar(snackdemo);
        },
        child: const Text('Click Here'),
      ),

      // RaisedButton is deprecated and shouldn't be used.

      // child: RaisedButton(
      //     child: const Text('Click Here!'),
      //     color: Colors.green,
      //     onPressed: () {
      //       const snackdemo = SnackBar(
      //         content: Text('Hii this is GFG\'s SnackBar'),
      //         backgroundColor: Colors.green,
      //         elevation: 10,
      //         behavior: SnackBarBehavior.floating,
      //         margin: EdgeInsets.all(5),
      //       );
      //       Scaffold.of(context).showSnackBar(snackdemo);
      //     }),,
    );
  }
}
