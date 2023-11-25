import 'package:flutter/material.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/widgets/main_drawer.dart';

import 'alert_dialog_box.dart';
import 'select_item.dart';
import 'model/model_procedures.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listName = ["All Customer", "Add Customer", "Add Procedure", "Reports"];
  var listIcon = [
    Icons.group,
    Icons.person_add_alt_1_outlined,
    Icons.wifi_protected_setup,
    Icons.print_outlined
  ];

  var listRoute = [
    Name.iDAllCustomer,
    Name.iDAddCustomer,
    Name.iDAddProcedure,
    Name.iDReportCustomer
  ];
  // List<Function> listFun = [
  //   (){
  //     Navigator.of(context).pushNamed(onClick)
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
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
        // backgroundColoColor.fromARGB(255, 248, 88, 20)28),
        // backgroundColor: Color.fromARGB(214, 225, 135, 61),
        // backgroundColor: const Color.fromARGB(255, 0, 33, 90),
        // backgroundColor: const Color.fromRGBO(243, 125, 29, 1),
        // backgroundColor: const Color.fromRGBO(243, 125, 29, 1),
        // backgroundColor: Color(F37D1D),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return DialogBox_1().dialog(
          //         context: context,
          //         onPressed: () {
          //           model = Model(
          //               id: 0, fruitName: input1.text, quantity: input2.text);
          //           // dbManager.insertModel(model);
          //           setState(() {
          //             input1.text = '';
          //             input2.text = '';
          //           });
          //           Navigator.of(context).pop();
          //         },
          //         textEditingController1: input1,
          //         textEditingController2: input2,
          //         // input1FocusNode: input1FocusNode!,
          //         // input2FocusNode: input2FocusNode!,
          //       );
          //     });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
              onClick: (index == 0 || index == 1)
                  ? () => Navigator.of(context).pushNamed(listRoute[index])
                  : index == 3
                      ? () => showBottomSheet1(
                            context: context,
                            title: 'Reports',
                            subTitle1: 'Reports Month',
                            subTitle2: 'Report for Customer',
                            function1: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(Name.iDReportCustomer);
                            },
                            function2: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(Name.iDReportCustomer);
                            },
                            iconData1: Icons.app_registration_outlined,
                            iconData2: Icons.app_registration_outlined,
                          )
                      : () => showBottomSheet1(
                            context: context,
                            title: 'Select Type',
                            subTitle1: 'Credit',
                            subTitle2: 'Debit',
                            function1: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed(
                                  Name.iDAddProcedure,
                                  arguments: 'Credit');
                            },
                            function2: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed(
                                  Name.iDAddProcedure,
                                  arguments: 'Debit');
                            },
                            iconData1: Icons.arrow_downward_sharp,
                            iconData2: Icons.arrow_upward_sharp,
                          ),
              color: const Color.fromARGB(147, 153, 195, 234),
              icon: listIcon[index],
            );
          },
        ),
      ),
      drawer: const MainDrawer(),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: const Text('Go to Main Screen', style: TextStyle(fontSize: 20)),
      //         subtitle: const Text('Go to Main Screen'),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         //  ,
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: Text('Go to Screen 1', style: TextStyle(fontSize: 30)),
      //         subtitle: Text('Go to Screen 1'),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         //  ,
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: Text('Go to Screen 2', style: TextStyle(fontSize: 30)),
      //         subtitle: Text('Go to Screen 2'),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );

    // return Directionality(
    //   textDirection:  TextDirection.rtl,
    //   child: Scaffold(
    //     // appBar: AppBar(
    //     //   title: Text('Meal'),
    //     // ),
    //     body: GridView(
    //       padding: const EdgeInsets.all(25),
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 200,
    //         childAspectRatio: 3 / 2,
    //         crossAxisSpacing: 20,
    //         mainAxisSpacing: 20,
    //       ),
    //       children: Provider.of<MealProvider>(context)
    //           .availableCategory
    //           .map(
    //             (catData) => CategoryItem(catData.id, catData.color),
    //           )
    //           .toList(),
    //     ),
    //   ),
    // );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white70,
      // backgroundColor: const Color.fromARGB(147, 153, 195, 234),
      barrierColor: const Color.fromARGB(215, 47, 107, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            // color: Colors.grey[300],
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Reports',
                      style: titleBottomSheetStyle,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close_sharp,
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  // color: Colors.white,
                  color: const Color.fromARGB(147, 153, 195, 234),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.app_registration_outlined,
                          color: primaryClr),
                      title: const Text(
                        'Reports Month',
                        style: TextStyle(
                            color: Themes.fontColor,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Themes.fontColor,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Name.iDAllProcedures);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  // color: Colors.white,
                  color: const Color.fromARGB(147, 153, 195, 234),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.app_registration_outlined,
                          color: primaryClr),
                      title: const Text(
                        'Report for Customer',
                        style: TextStyle(
                            color: Themes.fontColor,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Themes.fontColor,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Name.iDReportCustomer);
                      },
                    ),
                  ],
                ),
              ),

              // Container(
              //   margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              //   // margin: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     // color: Colors.grey[300],
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     children: [
              //       ListTile(
              //         // leading: Icon(Icons.photo),
              //         title: const Text('Edit Customer'),
              //         trailing: const Icon(
              //           Icons.edit_sharp,
              //           color: Colors.black,
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pop();
              //           Navigator.of(context).pushNamed(Name.iDEditCustomer,
              //               arguments: myControllersList);
              //         },
              //       ),
              //       const Divider(),
              //       ListTile(
              //         // leading: Icon(Icons.photo),
              //         title: const Text(
              //           'Delete Customer',
              //           style: TextStyle(color: Colors.red),
              //         ),
              //         trailing: const Icon(
              //           Icons.delete,
              //           color: Colors.red,
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pop();
              //           // showBottomSheetDelete(context);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheet1({
    required BuildContext context,
    required String title,
    required String subTitle1,
    required String subTitle2,
    required Function() function1,
    required Function() function2,
    required IconData iconData1,
    required IconData iconData2,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.white70,
      // backgroundColor: const Color.fromARGB(147, 153, 195, 234),
      barrierColor: const Color.fromARGB(215, 47, 107, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            // color: Colors.grey[300],
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  title: Center(
                    child: Text(
                      title,
                      style: titleBottomSheetStyle,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close_sharp,
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  // color: Colors.white,
                  color: const Color.fromARGB(147, 153, 195, 234),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(iconData1, color: primaryClr),
                      title: Text(
                        subTitle1,
                        style: const TextStyle(
                            color: Themes.fontColor,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Themes.fontColor,
                        size: 20,
                      ),
                      onTap: function1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  // color: Colors.white,
                  color: const Color.fromARGB(147, 153, 195, 234),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(iconData2, color: primaryClr),
                      title: Text(
                        subTitle2,
                        style: const TextStyle(
                            color: Themes.fontColor,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Themes.fontColor,
                        size: 20,
                      ),
                      onTap: function2,
                    ),
                  ],
                ),
              ),

              // Container(
              //   margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              //   // margin: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     // color: Colors.grey[300],
              //     color: Colors.white,
              //   ),
              //   child: Column(
              //     children: [
              //       ListTile(
              //         // leading: Icon(Icons.photo),
              //         title: const Text('Edit Customer'),
              //         trailing: const Icon(
              //           Icons.edit_sharp,
              //           color: Colors.black,
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pop();
              //           Navigator.of(context).pushNamed(Name.iDEditCustomer,
              //               arguments: myControllersList);
              //         },
              //       ),
              //       const Divider(),
              //       ListTile(
              //         // leading: Icon(Icons.photo),
              //         title: const Text(
              //           'Delete Customer',
              //           style: TextStyle(color: Colors.red),
              //         ),
              //         trailing: const Icon(
              //           Icons.delete,
              //           color: Colors.red,
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pop();
              //           // showBottomSheetDelete(context);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
