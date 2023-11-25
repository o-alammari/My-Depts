// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:testing_2/theme.dart';
// import 'package:testing_2/widgets/custom_button.dart';
// import 'package:testing_2/widgets/select_box.dart';
// import 'package:testing_2/widgets/select_date.dart';
// // import 'package:share_plus/share_plus.dart';
// import 'package:share/share.dart';

// class ReportCustomer extends StatefulWidget {
//   const ReportCustomer({super.key});

//   @override
//   State<ReportCustomer> createState() => _ReportCustomerState();
// }

// class _ReportCustomerState extends State<ReportCustomer> {
//   List<String> nameCustomer = ['omar', 'omar2'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Themes.backgroundColor,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 24,
//             // color: primaryClr,
//             color: Colors.white,
//           ),
//         ),
//         title: Text('Report Customer', style: titleAppBarStyle),
//         elevation: 0.1,
//         backgroundColor: primaryClr,
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 12),
//             Text('Customer', style: titleStyle),
//             SelectBox(nameCustomer: nameCustomer),
//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('From Date', style: titleStyle),
//                     const SelectDate(),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('To Date', style: titleStyle),
//                     const SelectDate(),
//                   ],
//                 ),
//                 // SelectDate(),
//               ],
//             ),
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: CustomButton(
//                       text: 'Print',
//                       // backgroundColor: Colors.white,
//                       backgroundColor: const Color.fromARGB(255, 27, 65, 146),
//                       textColor: Colors.white,
//                       fontSize: 17,
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(16),
//                         bottomLeft: Radius.circular(16),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                   Expanded(
//                     child: CustomButton(
//                       text: 'Share',
//                       // backgroundColor: const Color(0xffEF8262),
//                       backgroundColor: primaryClr,
//                       textColor: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                         topRight: Radius.circular(16),
//                         bottomRight: Radius.circular(16),
//                       ),
//                       fontSize: 17,
//                       onPressed: () async {
//                         // final result = await Share.shareXFiles(
//                         //     [XFile('${Directory('')}/image1.jpg')]);
//                         await Share.share(
//                             'check out my website https://example.com');

//                         // if (result.status == ShareResultStatus.dismissed) {
//                         //   print('Did you not like the pictures?');
//                         // }
//                         // File pdfFile = File("assets/my_pdf.pdf");

//                         // Share the PDF file
//                         // Share.shareFiles([pdfFile]);
//                         // launchCustomUr(context, bookModel.volumeInfo.previewLink);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
