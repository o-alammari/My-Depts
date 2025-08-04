import 'package:flutter/material.dart';

import 'package:testing_2/theme.dart';

class CustomTextFieldWithoutTitle extends StatefulWidget {
  const CustomTextFieldWithoutTitle({
    Key? key,
    this.hint,
    required this.onChange,
    this.obscureText = false,
    this.controller,
    this.textInputType,
    this.errorText1,
    this.widget,
    this.suffixIcon,
    this.prefixIcon,
    this.visibilityPass = false,
    this.prefix,
  }) : super(key: key);
  final String? hint;
  final String? errorText1;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? textInputType;
  final Widget? widget;
  final Widget? prefix;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool visibilityPass;

  @override
  State<CustomTextFieldWithoutTitle> createState() =>
      _CustomTextFieldWithoutTitleState();
}

class _CustomTextFieldWithoutTitleState
    extends State<CustomTextFieldWithoutTitle> {
  bool isFocused = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        isFocused ? primaryClr : const Color.fromARGB(255, 145, 166, 210);
    // Color backgroundColor = isFocused ? Colors.white : Colors.grey[200]!;
    Color backgroundColor = isFocused ? Colors.white : Colors.white;

    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 0),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            // if (widget.prefix != null)
            //   const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 8.0),
            //     child: Icon(Icons.search),
            //   )
            // else
            //   const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: widget.controller,
                obscureText: _obscureText && widget.obscureText,
                keyboardType: widget.textInputType ?? TextInputType.text,
                style: const TextStyle(
                  fontSize: 17,
                  color: Themes.fontColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                    // color: Color.fromARGB(255, 152, 175, 224)),
                    color: Color.fromARGB(255, 145, 166, 210),
                  ),
                  prefixIcon: Icon(widget.prefixIcon, color: Themes.fontColor),
                  suffixIcon: widget.visibilityPass
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.fontColor),
                        )
                      : null,
                ),
                cursorColor: primaryClr,
                onChanged: widget.onChange,
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Icon(Icons.clear),
            // ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   Color borderColor =
  //       isPressed ? Color.fromARGB(255, 145, 166, 210) : primaryClr;
  //   Color backgroundColor =
  //       isPressed ? Colors.green.withOpacity(0.2) : Colors.transparent;

  //   return GestureDetector(
  //     onTapDown: (details) {
  //       setState(() {
  //         isPressed = true;
  //       });
  //     },
  //     onTapUp: (details) {
  //       setState(() {
  //         isPressed = false;
  //       });
  //     },
  //     onTapCancel: () {
  //       setState(() {
  //         isPressed = false;
  //       });
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: borderColor,
  //           width: 1.0,
  //         ),
  //         borderRadius: BorderRadius.circular(8.0),
  //         color: backgroundColor,
  //       ),
  //       child: Row(
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Icon(Icons.search),
  //           ),
  //           Expanded(
  //             child: TextField(
  //               onTapOutside: (event) {},
  //               decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 hintText: 'ابحث هنا...',
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Icon(Icons.clear),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
