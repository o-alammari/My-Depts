import 'package:flutter/material.dart';
import 'package:intl/src/intl/date_format.dart';

import 'package:my_debts/app/utils/theme.dart';

class SelectDate extends StatefulWidget {
  final String title;
  final Function(String? result) onResult;

  const SelectDate({
    Key? key,
    required this.title,
    required this.onResult,
  }) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime _selectedDate = DateTime.now();
  String? selectedValue = 'Select ';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: titleStyle),
        InkWell(
          onTap: () async => getDateFromUser(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      _selectedDate != null
                          ? DateFormat.yMd().format(_selectedDate)
                          : 'Select',
                      style: const TextStyle(
                        fontSize: 15,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      widget.onResult(pickedDate.toString());
      setState(() => _selectedDate = pickedDate);
    }
  }
}
