import 'package:flutter/material.dart';
import 'package:testing_2/theme.dart';

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
          fontWeight: FontWeight.w600, // == bold
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
    // var lan = Provider.of<LanguageProvider>(context);
    return Directionality(
      // textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      textDirection: TextDirection.ltr,
      child: Drawer(
        // surfaceTintColor: Colors.black,
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              // alignment:
              //     lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
              alignment: Alignment.centerLeft,
              color: primaryClr,
              child: const Text(
                'drawer_name',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildListTile('Account Data', Icons.person, () {
              // Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            }, context),
            Divider(
              height: 0,
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width * .15,
              endIndent: 10,
            ),
            buildListTile('Settings', Icons.settings, () {
              // Navigator.of(context)
              //     .pushReplacementNamed(FiltersScreen.routeName);
            }, context),
            Divider(
              height: 0,
              thickness: 1.5,
              indent: MediaQuery.of(context).size.width * .15,
              endIndent: 10,
            ),
            buildListTile('drawer_item1', Icons.color_lens, () {
              // lan.getTexts('drawer_item3').toString(), Icons.color_lens, () {
              // Navigator.of(context).pushReplacementNamed(ThemeScreen.routeName);
            }, context),
            // const Divider(height: 10, color: Colors.black54),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 20, right: 22),
              child: Text(
                'drawer_switch',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 0,
                left: 20,
                bottom: 20,
                // right: (lan.isEn ? 0 : 20),
                // left: (lan.isEn ? 20 : 0),
                // bottom: (lan.isEn ? 20 : 9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'drawer_switch',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Switch(
                    value: true,
                    onChanged: (newValue) {
                      // Provider.of<LanguageProvider>(context, listen: false)
                      //     .changeLan(newValue);
                      // Navigator.of(context).pop();
                    },
                    // inactiveTrackColor: Provider.of<ThemeProvider>(context).tm == ThemeMode.dark? :,
                  ),
                  Text(
                    'switch',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            // const Divider(height: 10, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
