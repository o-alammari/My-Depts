import 'package:flutter/material.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/theme.dart';

class AllProceduresItems extends StatefulWidget {
  ModelProcedures modelProcedure;
  TextEditingController? input1;
  TextEditingController? input2;
  Function() onDeletePress;
  Function() onEditPress;

  AllProceduresItems(
      {required this.modelProcedure,
      this.input1,
      this.input2,
      required this.onDeletePress,
      required this.onEditPress,
      super.key});
  @override
  State<AllProceduresItems> createState() => _AllProceduresItemsState();
}

class _AllProceduresItemsState extends State<AllProceduresItems> {
  // List<TextEditingController> myControllersList = [
  //   TextEditingController(),
  //   TextEditingController(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          // leading: Text(widget.modelProcedure.amountProcedures),
          title: Text(
            widget.modelProcedure.nameProcedures,
            style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 27, 65, 146),
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(widget.modelProcedure.dateProcedures),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                // '${widget.modelProcedure.debit}.00',
                '${widget.modelProcedure.credit != '0' ? widget.modelProcedure.credit : widget.modelProcedure.debit}.00',
                style: const TextStyle(
                  fontSize: 15,
                  // color: Color.fromARGB(255, 27, 65, 146),
                  color: Color.fromARGB(255, 40, 82, 174),
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                widget.modelProcedure.credit != '0'
                    ? Icons.arrow_downward_sharp
                    : Icons.arrow_upward_sharp,
                size: 25,
                opticalSize: 1,
                color: Themes.fontColor,
              ),
            ],
          ),
          onTap: () => showBottomSheet(context),
          // trailing: CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: IconButton(
          //     onPressed: () {
          //       showBottomSheet(context);
          //     },
          //     icon: const Icon(Icons.more_vert, color: Themes.fontColor),
          //   ),
          // ),
        ),
        const Divider(
          height: 0,
          thickness: 1.5,
          indent: 10,
          // indent: MediaQuery.of(context).size.width * .15,
          endIndent: 15,
        ),
        // const Divider(
        //   height: 3,
        //   thickness: 1.5,
        // ),
        // const SizedBox(height: 20),
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    // myControllersList[0].text = widget.modelProcedure.idCustomer.toString();
    // myControllersList[1].text = widget.modelProcedure.credit;
    showModalBottomSheet(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.38,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
            // color: Colors.white,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  leading: Text(widget.modelProcedure.nameProcedures,
                      style: titleBottomSheetStyle),
                  trailing: CircleAvatar(
                    // foregroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // maxRadius: 6,
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // backgroundColor: Colors.grey,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   // crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       'Name Procedure',
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     // Container(
              //     //   margin: const EdgeInsets.only(top: 20, left: 23),
              //     //   child: const Text(
              //     //     'Name Procedure',
              //     //     style:
              //     //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     //   ),
              //     // ),
              //     IconButton(onPressed: () {}, icon: Icon(Icons.close))
              //   ],
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 20, left: 23),
              //   child: const Text(
              //     'Name Procedure',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text('Edit Procedure'),
                      trailing: const Icon(
                        Icons.edit_sharp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Name.iDEditProcedure,
                            arguments: widget.modelProcedure);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text(
                        'Delete Procedure',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showBottomSheetDelete(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheetDelete(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // useSafeArea: true,
      backgroundColor: Colors.grey[300],
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  title: Text('Delete Procedure Name...?',
                      style: titleBottomSheetStyle),
                  trailing: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    // backgroundColor: Colors.grey,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 15),
              //   child: const Text(
              //     'Delete Procedure Name...?',
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),

                // margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.grey[300],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.photo),
                      title: const Text(
                        'Delete Procedure',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(Icons.delete, color: Colors.red),
                      // onTap: () => widget.onDeletePress,
                      onTap: () {
                        // Fun Delete
                        deleteProcedures();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  deleteProcedures() async {
    await ProceduresServices()
        .deleteProcedures(widget.modelProcedure.idProcedures);
  }
}
