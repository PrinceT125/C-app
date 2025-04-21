import 'package:flutter/material.dart';

void main() {
  runApp(VeterinaryApp());
}

class VeterinaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cattle Telemedicine',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppointmentsScreen(),
    );
  }
}

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  // Sample data for appointments (in a real-world scenario, this would come from a database)
  List<Map<String, String>> appointments = [
    {
      'date': '2025-04-05',
      'time': '10:00 AM',
      'patient': 'Bessie (Cow)',
      'owner': 'John Doe',
    },
    {
      'date': '2025-04-06',
      'time': '12:30 PM',
      'patient': 'MooMoo (Cow)',
      'owner': 'Jane Smith',
    },
    {
      'date': '2025-04-07',
      'time': '2:00 PM',
      'patient': 'Lulu (Cow)',
      'owner': 'Bill Brown',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar (optional, you can add functionality to filter appointments)
            TextField(
              decoration: InputDecoration(
                labelText: 'Search appointments',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Appointments list
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return AppointmentCard(appointment: appointment);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 31),
          child: Container(
            height: 50,
            child: ElevatedButton(

              onPressed: () => _createAppointment(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              child: Text(
                'Create Appointment',
                style: TextStyle(fontSize: 25,color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to simulate the creation of a new appointment
  void _createAppointment(BuildContext context) {
    // In real apps, this would involve showing a form for new appointments
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create New Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Owner Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // In a real app, we would save the appointment to the database
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Map<String, String> appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${appointment['patient']} - ${appointment['owner']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${appointment['date']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time: ${appointment['time']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
