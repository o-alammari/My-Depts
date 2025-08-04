// import 'package:pdf/pdf.dart' as pw;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share/share.dart';

Future<void> generateAndPrintArabicPdf(String formDate, String toDate,
    List<Map<String, dynamic>> tableList) async {
  formDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(formDate)).toString();

  toDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(toDate)).toString();
  var arabicFont =
      pw.Font.ttf(await rootBundle.load('assets/fonts/Hacen Tunisia.ttf'));
  final pdf = pw.Document();
  print(tableList);

  var tableListConvert = tableList.map((item) {
    var formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(item['dateProcedures']));

    return {...item, 'dateProcedures': formattedDate};
  });

  // List<Map<String, dynamic>> v1 = [];
  // for (var item in tableList) {
  //   var formattedDate =
  //       DateFormat('yyyy-MM-dd').format(DateTime.parse(item['dateProcedures']));
  //   var formattedItem = {...item, 'dateProcedures': formattedDate};
  //   v1.add(formattedItem);
  // }
  // tableList.map((item) {
  //   var formattedDate =
  //       DateFormat('yyyy-MM-dd').format(DateTime.parse(item['dateProcedures']));
  //   return {...item, 'dateProcedures': formattedDate};
  // });
  // for (var item in tableList) {
  //   var dateString = item['dateProcedures'];
  //   item['dateProcedures'] =
  //       DateFormat('yyyy-MM-dd').format(DateTime.parse(dateString));
  // }
  // final tableHeaders = ['المبلغ', 'التاريخ', 'النوع', 'الاســـــــــــــم'];

  final tableHeaders = [
    'ايداع',
    'سحب',
    'التاريخ',
    // 'النوع',
    'الاســـــــــــــم'
  ];

  final tableRows =
      tableListConvert.map((item) => item.values.toList()).toList();

  pdf.addPage(
    pw.Page(
      theme: pw.ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.roll80,
      build: (pw.Context context) {
        return pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            // crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('  كشف حساب  من تاريخ  $formDate الى تاريخ $toDate',
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: pw.TextAlign.center),
              pw.Table.fromTextArray(
                cellAlignment: pw.Alignment.center,
                data: tableRows,
                // data: tableList,
                headers: tableHeaders,
                cellStyle: const pw.TextStyle(
                  fontSize: 8,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ' المبلغ الاجمالي  المتبقي  حسب الجدول  sum3 newValue',
                style: pw.TextStyle(fontSize: 8),
              ),
              // pw.Text('المبلغ الاجمالي الكلي المتبقي  $v2 $newValue',
              //     style: pw.TextStyle(fontSize: 8)),
            ],
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async {
      return pdf.save();
    },
  );
  // await Share.shareFiles(pdf.);
}
