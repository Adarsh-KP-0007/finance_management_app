// Import the necessary packages
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<void> generateMonthlyExpenseReport(
  DateTime startDate,
  DateTime endDate,
) async {
  // Fetch expense data for the specified date range from Firestore
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('transaction')
      .where('StartDate',
          isGreaterThanOrEqualTo: startDate, isLessThanOrEqualTo: endDate)
      .get();

  // Prepare PDF document
  final pdf = pw.Document();

  // Add header to the PDF
  pdf.addPage(pw.Page(
    build: (pw.Context context) {
      return pw.Center(
        child: pw.Text(
            'Expense Report - ${startDate.day}/${startDate.month}/${startDate.year} to ${endDate.day}/${endDate.month}/${endDate.year}',
            style: pw.TextStyle(fontSize: 20)),
      );
    },
  ));

  // Create a table for expense data
  List<List<String>> tableData = [
    ['Date', 'Expense'], // Table header
    for (var doc in snapshot.docs)
      [doc['StartDate'].toDate().toString(), doc['expense'].toString()],
  ];

  // Add the table to the PDF
  pdf.addPage(pw.Page(
    build: (pw.Context context) {
      return pw.TableHelper.fromTextArray(
        context: context,
        data: tableData,
        border: pw.TableBorder.all(),
        headerAlignment: pw.Alignment.center,
        cellAlignment: pw.Alignment.center,
      );
    },
  ));

  // Generate the PDF
  final Uint8List pdfBytes = await pdf.save();

  // Share the PDF directly without saving locally
  await Printing.sharePdf(
    bytes: pdfBytes,
    filename:
        'expense_report_${startDate.year}_${startDate.month}_${startDate.day}_to_${endDate.year}_${endDate.month}_${endDate.day}.pdf',
  );
}
