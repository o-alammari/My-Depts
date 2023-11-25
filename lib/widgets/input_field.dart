import 'package:flutter/material.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.title,
    required this.hint,
    required this.onChange,
    this.controller,
    this.textInputType,
    this.widget,
    Key? key,
  }) : super(key: key);
  final String title;
  final String hint;
  Function(String)? onChange;

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          TextFormField(
            keyboardType: textInputType ?? TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // TextFormField(
          //   controller: controller,
          //   autofocus: false,
          //   readOnly: widget == null ? false : true,
          //   style: subTitleStyle,
          //   keyboardType: textInputType,
          //   // cursorColor:
          //   //     Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
          //   cursorColor: Colors.grey[700],
          //   decoration: InputDecoration(
          //     hintText: hint,
          //     hintStyle: subTitleStyle,
          //     enabledBorder: const UnderlineInputBorder(
          //       borderSide: BorderSide(
          //         // color: context.theme.backgroundColor,
          //         width: 0,
          //       ),
          //     ),
          //     focusedBorder: const UnderlineInputBorder(
          //       borderSide: BorderSide(
          //         // color: context.theme.backgroundColor,
          //         width: 0,
          //       ),
          //     ),
          //   ),
          // ),

          // Container(
          //   // width: SizeConfig.screenWidth,
          //   width: MediaQuery.of(context).size.width,
          //   height: 52,
          //   padding: const EdgeInsets.only(left: 14),
          //   margin: const EdgeInsets.only(top: 8),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //     border: Border.all(
          //       color: Colors.grey,
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         // child: TextFormField(
          //         //   keyboardType: textInputType ?? TextInputType.text,
          //         //   decoration: InputDecoration(
          //         //     hintText: hintText,
          //         //     enabledBorder: OutlineInputBorder(
          //         //       borderSide: const BorderSide(),
          //         //       borderRadius: BorderRadius.circular(8),
          //         //     ),
          //         //     border: OutlineInputBorder(
          //         //       borderSide: const BorderSide(),
          //         //       borderRadius: BorderRadius.circular(8),
          //         //     ),
          //         //   ),
          //         // ),
          //         child: TextFormField(
          //           controller: controller,
          //           autofocus: false,
          //           readOnly: widget == null ? false : true,
          //           style: subTitleStyle,
          //           keyboardType: textInputType,
          //           // cursorColor:
          //           //     Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
          //           cursorColor: Colors.grey[700],
          //           decoration: InputDecoration(
          //             hintText: hint,
          //             hintStyle: subTitleStyle,
          //             enabledBorder: const UnderlineInputBorder(
          //               borderSide: BorderSide(
          //                 // color: context.theme.backgroundColor,
          //                 width: 0,
          //               ),
          //             ),
          //             focusedBorder: const UnderlineInputBorder(
          //               borderSide: BorderSide(
          //                 // color: context.theme.backgroundColor,
          //                 width: 0,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       widget ?? Container(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class InputField1 extends StatefulWidget {
  const InputField1({
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
  final  Function(String)? onChange;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Widget? widget;

  @override
  State<InputField1> createState() => _InputField1State();
}

class _InputField1State extends State<InputField1> {
  bool isFocused = false;
  // Color? backgroundColor ;
  Color? backgroundColor = Colors.grey[200];
  // Color borderColor = Colors.black;
  // Color cursorColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: titleStyle),
          Container(
            // width: SizeConfig.screenWidth,
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
                      color: Themes.fontColor,
                    ),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: backgroundColor,
                      // fillColor: Color.fromARGB(147, 153, 195, 234),
                      hintText: widget.hint,
                      // focusColor: Color.fromARGB(255, 187, 167, 39),
                      hintStyle: const TextStyle(
                        // color: Color.fromARGB(255, 152, 175, 224)),
                        color: Color.fromARGB(255, 145, 166, 210),
                      ),
                      // icon: Icon(Icons.verified_user),
                      errorText: widget.errorText1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: primaryClr,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          // color: Color.fromARGB(255, 88, 127, 210),
                          color: Color.fromARGB(255, 145, 166, 210),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          // color: Color.fromARGB(255, 159, 159, 29),
                          color: primaryClr,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // onChanged: (value) => widget.onChange!(value),
                    onChanged: widget.onChange,

                    // onSaved: (value) {
                    //   setState(() {
                    //     // backgroundColor = Colors.black;
                    //     // backgroundColor = null;
                    //   });
                    // },
                    // onFieldSubmitted: (value) {
                    //   setState(() {
                    //     backgroundColor = Colors.black;
                    //     // backgroundColor = null;
                    //     // backgroundColor = Colors.grey[200];
                    //   });
                    // },
                    cursorColor: primaryClr,
                    onTap: () {
                      setState(() {
                        isFocused = true;
                        backgroundColor = Colors.white;
                      });
                    },
                  ),

                  // child: TextFormField(
                  //   controller: widget.controller,
                  //   obscureText: widget.obscureText ?? false,
                  //   keyboardType: widget.textInputType ?? TextInputType.text,
                  //   style: const TextStyle(
                  //       color: Color.fromARGB(255, 27, 65, 146)),
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: Color.fromARGB(147, 153, 195, 234),
                  //     hintText: widget.hint,
                  //     // focusColor: Color.fromARGB(255, 187, 167, 39),
                  //     hintStyle: const TextStyle(
                  //       // color: Color.fromARGB(255, 152, 175, 224)),
                  //       color: Color.fromARGB(255, 145, 166, 210),
                  //     ),
                  //     // icon: Icon(Icons.verified_user),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //           // color: Color.fromARGB(255, 88, 127, 210),
                  //           // color: Color.fromARGB(255, 145, 166, 210),
                  //           ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //           // color: Color.fromARGB(255, 159, 159, 29),
                  //           ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onChanged: widget.onChange,
                  // ),

                  // child: TextFormField(
                  //   controller: controller,
                  //   obscureText: obscureText ?? false,
                  //   keyboardType: textInputType ?? TextInputType.text,
                  //   style: const TextStyle(
                  //       color: Color.fromARGB(255, 27, 65, 146)),
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: Color.fromARGB(147, 153, 195, 234),
                  //     hintText: hint,
                  //     // focusColor: Color.fromARGB(255, 187, 167, 39),
                  //     hintStyle: const TextStyle(
                  //       // color: Color.fromARGB(255, 152, 175, 224)),
                  //       color: Color.fromARGB(255, 145, 166, 210),
                  //     ),
                  //     // icon: Icon(Icons.verified_user),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //         // color: Color.fromARGB(255, 88, 127, 210),
                  //         // color: Color.fromARGB(255, 145, 166, 210),
                  //       ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //           // color: Color.fromARGB(255, 159, 159, 29),
                  //           ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onChanged: onChange,
                  // ),
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
