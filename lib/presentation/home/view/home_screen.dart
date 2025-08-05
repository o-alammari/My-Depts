import 'package:flutter/material.dart';
import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/app/utils/theme.dart';
import 'package:my_debts/app/widgets/main_drawer.dart';
import 'package:my_debts/app/function/bottom_sheet.dart';

import 'widgets/select_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final listName = ["All Customer", "Add Customer", "Add Procedure", "Reports"];

  final listIcon = [
    Icons.group,
    Icons.person_add_alt_1_outlined,
    Icons.wifi_protected_setup,
    Icons.print_outlined
  ];

  @override
  Widget build(BuildContext context) {
    final operations = [
      () => Navigator.of(context).pushNamed(Name.iDAllCustomer),
      () => Navigator.of(context).pushNamed(Name.iDAddCustomer),
      () => showBottomSheetSelect(
            context: context,
            title: 'Select Type',
            subTitle1: 'Credit',
            subTitle2: 'Debit',
            function1: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushNamed(Name.iDAddProcedure, arguments: 'Credit');
            },
            function2: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushNamed(Name.iDAddProcedure, arguments: 'Debit');
            },
            iconData1: Icons.arrow_downward_sharp,
            iconData2: Icons.arrow_upward_sharp,
          ),
      () => showBottomSheetSelect(
            context: context,
            title: 'Reports',
            subTitle1: 'Reports Month',
            subTitle2: 'Report for Customer',
            function1: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(Name.iDReportCustomer);
            },
            function2: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(Name.iDReportCustomer);
            },
            iconData1: Icons.app_registration_outlined,
            iconData2: Icons.app_registration_outlined,
          ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        title: Text('Debts', style: titleAppBarStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: listName.length,
          itemBuilder: (BuildContext context, int index) {
            return SelectItem(
              name: listName[index],
              color: const Color.fromARGB(147, 153, 195, 234),
              icon: listIcon[index],
              onClick: operations[index],
            );
          },
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
