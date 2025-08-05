import 'package:flutter/material.dart';
import 'package:my_debts/app/utils/theme.dart';

class SelectItem extends StatelessWidget {
  final String name;
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: primaryClr),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(
                color: Themes.fontColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
