import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

  final tableHeaders = ['ايداع', 'سحب', 'التاريخ', 'الاســـــــــــــم'];

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
            children: [
              pw.Text('  كشف حساب  من تاريخ  $formDate الى تاريخ $toDate',
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: pw.TextAlign.center),
              pw.Table.fromTextArray(
                cellAlignment: pw.Alignment.center,
                data: tableRows,
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
}
