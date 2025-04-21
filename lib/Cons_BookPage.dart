import 'package:flutter/material.dart';

class ConsultationBookingPage extends StatefulWidget {
  @override
  _ConsultationBookingPageState createState() => _ConsultationBookingPageState();
}

class _ConsultationBookingPageState extends State<ConsultationBookingPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedReason = '';

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _bookConsultation() {
    if (_formKey.currentState!.validate() && selectedDate != null && selectedTime != null) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, 'e', arguments: {
        'date': selectedDate.toString().split(' ')[0],
        'time': selectedTime!.format(context),
        'reason': selectedReason,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Consultation'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                title: Text(selectedDate == null ? 'Choose a date' : '${selectedDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 10),
              Text('Select Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                title: Text(selectedTime == null ? 'Choose a time' : selectedTime!.format(context)),
                trailing: Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Reason for Consultation'),
                validator: (value) => value!.isEmpty ? 'Enter a reason' : null,
                onSaved: (value) => selectedReason = value!,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _bookConsultation,
                  child: Text('Confirm Booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
