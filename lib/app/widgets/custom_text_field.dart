import 'package:flutter/material.dart';

import 'package:my_debts/app/utils/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.hint,
    required this.onChange,
    this.obscureText,
    this.controller,
    this.textInputType,
    this.errorText1,
    this.widget,
  }) : super(key: key);
  final String title;
  final String? hint;
  final String? errorText1;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Widget? widget;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  Color? backgroundColor = Colors.grey[200];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: titleStyle),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.obscureText ?? false,
                    keyboardType: widget.textInputType ?? TextInputType.text,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 242, 206, 24),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: backgroundColor,
                      hintText: widget.hint,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 145, 166, 210),
                      ),
                      errorText: widget.errorText1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: primaryClr,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 145, 166, 210),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: primaryClr,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    cursorColor: primaryClr,
                    onTap: () {
                      setState(() {
                        isFocused = true;
                        backgroundColor = Colors.white;
                      });
                    },
                    onChanged: widget.onChange,
                  ),
                ),
                widget.widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
