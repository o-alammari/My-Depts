// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';


// Future<void> generateAndPrintArabicPdf() async {
//     var arabicFont =
//         pw.Font.ttf(await rootBundle.load('images/Hacen Tunisia.ttf'));
//     final pdf = pw.Document();

//     final tableHeaders = ['المبلغ', 'التاريخ', 'النوع', 'الاســـــــــــــم'];

//     final tableRows = _accountList.map((rowData) {
//       return [
//         rowData.balance.toString(),
//         rowData.date.toString(),
//         rowData.details.toString(),
//         rowData.name.toString(),
//       ];
//     }).toList();

//     pdf.addPage(
//       pw.Page(
//         theme: pw.ThemeData.withFont(
//           base: arabicFont,
//         ),
//         pageFormat: PdfPageFormat.roll80,
//         build: (pw.Context context) {
//           return pw.Directionality(
//             textDirection: pw.TextDirection.rtl,
//             child: pw.Column(
//               // crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 pw.Text(
//                     '  كشف حساب كلي  من تاريخ  $formattedDate1 الى تاريخ $formattedDate',
//                     style: pw.TextStyle(
//                       fontSize: 10,
//                     ),
//                     textAlign: pw.TextAlign.center),
//                 pw.Table.fromTextArray(
//                   cellAlignment: pw.Alignment.center,
//                   data: tableRows,
//                   headers: tableHeaders,
//                   cellStyle: const pw.TextStyle(
//                     fontSize: 8,
//                   ),
//                 ),
//                 pw.Text(
//                     ' المبلغ الاجمالي  المتبقي  حسب الجدول  $sum3 $newValue',
//                     style: pw.TextStyle(fontSize: 8)),
//                 pw.Text('المبلغ الاجمالي الكلي المتبقي  $v2 $newValue',
//                     style: pw.TextStyle(fontSize: 8)),
//               ],
//             ),
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }