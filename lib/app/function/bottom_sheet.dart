import 'package:flutter/material.dart';
import 'package:testing_2/theme.dart';

void showBottomSheetSelect({
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
                child: titleBottomSheet(context: context, title: title)),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: bodyBottomSheet(
                title: subTitle1,
                function: function1,
                iconData: iconData1,
                edgeInsetsGeometry:
                    const EdgeInsets.only(left: 5, right: 5, top: 10),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: bodyBottomSheet(
                title: subTitle2,
                function: function2,
                iconData: iconData2,
                edgeInsetsGeometry:
                    const EdgeInsets.only(left: 20, right: 20, top: 20),
              ),
            ),

            // Container(
            //   margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
            //   child: ListTile(
            //     title: Center(
            //       child: Text(
            //         title,
            //         style: titleBottomSheetStyle,
            //       ),
            //     ),
            //     trailing: CircleAvatar(
            //       backgroundColor: Colors.grey[200],
            //       child: IconButton(
            //           onPressed: () => Navigator.of(context).pop(),
            //           icon: Icon(
            //             Icons.close_sharp,
            //             color: Colors.grey[500],
            //           )),
            //     ),
            //   ),
            // ),

            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     // color: Colors.grey[300],
            //     // color: Colors.white,
            //     color: const Color.fromARGB(147, 153, 195, 234),
            //   ),
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(iconData1, color: primaryClr),
            //         title: Text(
            //           subTitle1,
            //           style: const TextStyle(
            //               color: Themes.fontColor,
            //               fontWeight: FontWeight.w400),
            //         ),
            //         trailing: const Icon(
            //           Icons.arrow_forward_ios_outlined,
            //           color: Themes.fontColor,
            //           size: 20,
            //         ),
            //         onTap: function1,
            //       ),
            //     ],
            //   ),
            // ),

            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     // color: Colors.grey[300],
            //     // color: Colors.white,
            //     color: const Color.fromARGB(147, 153, 195, 234),
            //   ),
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(iconData2, color: primaryClr),
            //         title: Text(
            //           subTitle2,
            //           style: const TextStyle(
            //               color: Themes.fontColor,
            //               fontWeight: FontWeight.w400),
            //         ),
            //         trailing: const Icon(
            //           Icons.arrow_forward_ios_outlined,
            //           color: Themes.fontColor,
            //           size: 20,
            //         ),
            //         onTap: function2,
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

Widget titleBottomSheet(
    {required BuildContext context, required String title}) {
  return ListTile(
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
  );
}

Widget bodyBottomSheet(
    {required String title,
    required Function() function,
    required IconData iconData,
    required EdgeInsetsGeometry edgeInsetsGeometry}) {
  return Container(
    // margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
    // margin: edgeInsetsGeometry,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromARGB(147, 153, 195, 234),
    ),
    child: Column(
      children: [
        ListTile(
          leading: Icon(iconData, color: primaryClr),
          title: Text(
            title,
            style: const TextStyle(
                color: Themes.fontColor, fontWeight: FontWeight.w400),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Themes.fontColor,
            size: 20,
          ),
          onTap: function,
        ),
      ],
    ),
  );
}
