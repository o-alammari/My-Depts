import 'package:flutter/material.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/app/widgets/main_drawer.dart';
import 'package:testing_2/app/function/bottom_sheet.dart';

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

  // final listRoute = [
  //   Name.iDAllCustomer,
  //   Name.iDAddCustomer,
  //   Name.iDAddProcedure,
  //   Name.iDReportCustomer
  // ];

  @override
  Widget build(BuildContext context) {
    List<Function> operations = [
      () => Navigator.of(context).pushNamed(Name.iDAllCustomer),
      () => Navigator.of(context).pushNamed(Name.iDAllCustomer),
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
          )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        // leading: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        //     IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        //   ],
        // ),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
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
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          // ),
          itemCount: listName.length,
          itemBuilder: (BuildContext context, int index) {
            return SelectItem(
              name: listName[index],
              color: const Color.fromARGB(147, 153, 195, 234),
              icon: listIcon[index],
              onClick: operations[index](),
              // onClick: (index == 0 || index == 1)
              //     ? () => Navigator.of(context).pushNamed(listRoute[index])
              //     : index == 3
              //         ? () => showBottomSheetSelect(
              //               context: context,
              //               title: 'Reports',
              //               subTitle1: 'Reports Month',
              //               subTitle2: 'Report for Customer',
              //               function1: () {
              //                 Navigator.of(context).pop();
              //                 Navigator.of(context)
              //                     .pushNamed(Name.iDReportCustomer);
              //               },
              //               function2: () {
              //                 Navigator.of(context).pop();
              //                 Navigator.of(context)
              //                     .pushNamed(Name.iDReportCustomer);
              //               },
              //               iconData1: Icons.app_registration_outlined,
              //               iconData2: Icons.app_registration_outlined,
              //             )
              //         : () => showBottomSheetSelect(
              //               context: context,
              //               title: 'Select Type',
              //               subTitle1: 'Credit',
              //               subTitle2: 'Debit',
              //               function1: () {
              //                 Navigator.of(context).pop();
              //                 Navigator.of(context).pushNamed(
              //                     Name.iDAddProcedure,
              //                     arguments: 'Credit');
              //               },
              //               function2: () {
              //                 Navigator.of(context).pop();
              //                 Navigator.of(context).pushNamed(
              //                     Name.iDAddProcedure,
              //                     arguments: 'Debit');
              //               },
              //               iconData1: Icons.arrow_downward_sharp,
              //               iconData2: Icons.arrow_upward_sharp,
              //             ),
            );
          },
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
