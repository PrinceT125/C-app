
import 'package:flutter/material.dart';
import 'package:catele/VeterinarianScreen/Appointment.dart';
import 'package:catele/VeterinarianScreen/Settings.dart';
import 'package:catele/CattleOwnerScreen/CaOwData.dart';

// void main() {
//   runApp(VeterinaryApp());
// }
//
// class VeterinaryApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cattle Telemedicine',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),  // Set HomePage as the starting page
//       routes: {
//         // Define the named routes here
//         VideoCallPage.routeName: (context) => VideoCallPage(),
//         ConsultationHistoryPage.routeName: (context) => ConsultationHistoryPage(),
//       },
//     );
//   }
// }

class Vetui extends StatefulWidget {
  @override
  State<Vetui> createState() => _HomePageState();
}

class _HomePageState extends State<Vetui> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Define pages for each tab
    HomeContentPage(),  // Home content page as the first page
    AppointmentsScreen(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;  // Update the index when a tab is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cattle Telemedicine'),
        elevation: 0,
      ),
      body: _pages[_currentIndex],  // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the active tab index
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// HomeContentPage as the content for the home page
class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildUpcomingAppointments(context),
          _buildCattleInfo(),
          _buildConsultationCard(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.green[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, Dr. ${UserData.name}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'You have 3 upcoming consultations.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppointments(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Appointments',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildAppointmentCard(
            context,
            'Cattle #42 - Farmer Joe',
            'Scheduled for 10:30 AM',
            Icons.video_call,
          ),
          _buildAppointmentCard(
            context,
            'Cattle #57 - Farmer Anne',
            'Scheduled for 2:00 PM',
            Icons.video_call,
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(Icons.pets, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(icon, color: Colors.green),
          onPressed: () {
            Navigator.pushNamed(context, VideoCallPage.routeName);
          },
        ),
      ),
    );
  }

  Widget _buildCattleInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cattle Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildCattleCard('Cattle #42', 'Age: 3 years', 'Weight: 500kg'),
          _buildCattleCard('Cattle #57', 'Age: 4 years', 'Weight: 550kg'),
        ],
      ),
    );
  }

  Widget _buildCattleCard(String title, String age, String weight) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(age),
            Text(weight),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Icon(Icons.medical_services, color: Colors.green),
          title: Text('Consultation History'),
          subtitle: Text('View past consultation details'),
          onTap: () {
            Navigator.pushNamed(context, ConsultationHistoryPage.routeName);
          },
        ),
      ),
    );
  }
}

// Page to simulate Video Call
class VideoCallPage extends StatelessWidget {
  static const routeName = '/video-call';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Consultation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_call, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Connecting with Farmer Joe...',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate ending the call
                Navigator.pop(context);
              },
              child: Text('End Call'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page for Consultation History
class ConsultationHistoryPage extends StatelessWidget {
  static const routeName = '/consultation-history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation History'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Consultation with Farmer Joe'),
            subtitle: Text('Cattle #42 - Diagnosis: Healthy'),
          ),
          ListTile(
            title: Text('Consultation with Farmer Anne'),
            subtitle: Text('Cattle #57 - Diagnosis: Mild Fever'),
          ),
        ],
      ),
    );
  }
}
