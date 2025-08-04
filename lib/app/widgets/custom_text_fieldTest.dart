import 'package:flutter/material.dart';

import 'package:testing_2/theme.dart';

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
    this.prefix,
  }) : super(key: key);
  final String title;
  final String? hint;
  final String? errorText1;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Widget? widget;
  final Widget? prefix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
            decoration: BoxDecoration(
              border: Border.all(
                // color: Colors.grey,
                color: primaryClr,
                width: 1.0,
              ),
              // color: primaryClr,
              borderRadius: BorderRadius.circular(8.0),
            ),
            // width: SizeConfig.screenWidth,
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10, left: 5),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search),
                ),
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
                      // suffixIcon: Icon(Icons.person),
                      // prefix: widget.prefix,
                      filled: true,
                      border: InputBorder.none,
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
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: const BorderSide(
                      //     // color: Color.fromARGB(255, 88, 127, 210),
                      //     color: Color.fromARGB(255, 145, 166, 210),
                      //   ),
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      // border: OutlineInputBorder(
                      //   borderSide: const BorderSide(
                      //     // color: Color.fromARGB(255, 159, 159, 29),
                      //     color: primaryClr,
                      //   ),
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.clear),
                ),
                // widget.widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField22 extends StatefulWidget {
  const CustomTextField22({
    Key? key,
    required this.title,
    this.hint,
    required this.onChange,
    this.obscureText,
    this.controller,
    this.textInputType,
    this.errorText1,
    this.widget,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
  }) : super(key: key);
  final String title;
  final String? hint;
  final String? errorText1;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Widget? widget;
  final Widget? prefix;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  State<CustomTextField22> createState() => _CustomTextField22State();
}

class _CustomTextField22State extends State<CustomTextField22> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        isFocused ? primaryClr : Color.fromARGB(255, 145, 166, 210);
    // Color backgroundColor = isFocused ? Colors.white : Colors.grey[200]!;
    Color backgroundColor = isFocused ? Colors.white : Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: titleStyle),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 5),
            height: 50,
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
                      // suffix: Text('llllll'),
                      // suffixIcon: Text('suffixIcon'),
                      // suffix: IconButton(
                      //     onPressed: () {}, icon: const Icon(Icons.lock)),

                      prefixIcon:
                          Icon(widget.prefixIcon, color: Themes.fontColor),
                      // prefixIcon: IconButton(
                      //     onPressed: () {}, icon: const Icon(Icons.lock)),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon:
                              Icon(widget.suffixIcon, color: Themes.fontColor)),
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
        ),
      ],
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
