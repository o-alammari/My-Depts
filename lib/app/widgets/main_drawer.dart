import 'package:flutter/material.dart';
import 'package:my_debts/app/utils/theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(
      String title, IconData iconLeading, Function() onTap, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        iconLeading,
        size: 23,
        color: primaryClr,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w600,
          color: Themes.fontColor,
        ),
      ),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
        color: Themes.fontColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: primaryClr,
              child: const Text(
                'My Debts',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildListTile('Account Data', Icons.person, () {}, context),
            Divider(
              height: 0,
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width * .15,
              endIndent: 10,
            ),
            buildListTile('Settings', Icons.settings, () {}, context),
            Divider(
              height: 0,
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width * .15,
              endIndent: 10,
            ),
            buildListTile('About Us', Icons.info_outline, () {}, context),
            Divider(
              height: 0,
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width * .15,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
