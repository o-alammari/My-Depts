import 'package:flutter/material.dart';
import 'package:testing_2/theme.dart';

class SelectItem extends StatelessWidget {
  final String name;
  // final String onClick;

  final Color? color;
  final IconData icon;
  final Function() onClick;
  const SelectItem({
    Key? key,
    required this.name,
    required this.onClick,
    this.color,
    required this.icon,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('route');
  }

  void selectCategory2(BuildContext ctx, String title) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: onClick,
      // onTap: name.contains('Add')
      //     ? () => selectCategory(context)
      //     : () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          // gradient: LinearGradient(
          //   colors: [
          //     color!.withOpacity(0.4),
          //     color!,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Image(image: image)
            Icon(icon, size: 30, color: primaryClr),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(
                // color: Color.fromARGB(255, 10, 52, 143),
                color: Themes.fontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
