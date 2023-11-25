// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:testing_2/alert_dialog_box.dart';
import 'package:testing_2/model/model_customer.dart';

class SelectBox extends StatefulWidget {
  final Function(String? result) onResult;
  List<ModelCustomer> nameCustomer;
  SelectBox({
    Key? key,
    required this.onResult,
    required this.nameCustomer,
  }) : super(key: key);

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  String? selectedValue = 'Select';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        selectedValue = await showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (context) {
            return DialogBox_1(names: widget.nameCustomer);
            // return const DialogBox();
            // return DialogBox1()
            // .dialog1(context: context, listCustomer: listCustomer);
          },
        );
        setState(() {});
        if (selectedValue != null) {
          widget.onResult(selectedValue!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        // padding:
        //     const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            // color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  // selectedValue,
                  selectedValue ?? 'Select',
                  style: const TextStyle(
                    fontSize: 17,
                    // color: Color.fromARGB(255, 27, 65, 146)
                    color: Color.fromARGB(255, 59, 103, 199),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  // Icons.keyboard_arrow_up_rounded,
                  Icons.keyboard_arrow_down_outlined,
                  color: Color.fromARGB(255, 27, 65, 146),
                  size: 30,
                ),
                // child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
              ),
              // const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
