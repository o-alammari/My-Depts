import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testing_2/alert_dialog_box.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';

class SelectBox extends StatefulWidget {
  final Function(String? result) onResult;
  const SelectBox({
    Key? key,
    required this.onResult,
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
        context
            .read<CustomerBloc>()
            .add(const CustomerSearchChangedEvent(customerSearch: ''));

        selectedValue = await showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (context) {
            return const DialogBox();
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
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
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
                    color: Color.fromARGB(255, 59, 103, 199),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
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
