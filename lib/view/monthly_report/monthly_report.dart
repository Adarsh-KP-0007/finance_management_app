import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackizer/services/ems_pdf_service.dart';

class DateSelectionPage extends StatefulWidget {
  const DateSelectionPage({super.key});

  @override
  State<DateSelectionPage> createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                  'Select Start Date: ${DateFormat('yyyy-MM-dd').format(_startDate)}'), // Display selected start date
              trailing: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectStartDate(context),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                  'Select End Date: ${DateFormat('yyyy-MM-dd').format(_endDate)}'), // Display selected end date
              trailing: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectEndDate(context),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                generateMonthlyExpenseReport(_startDate, _endDate);
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Generate PDF Report'),
            ),
          ],
        ),
      ),
    );
  }
}
