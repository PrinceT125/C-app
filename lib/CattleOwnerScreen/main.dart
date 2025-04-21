import 'package:catele/CattleOwnerScreen/edit.dart';
import 'package:catele/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:catele/Add_CPage.dart';
import 'package:catele/CattleOwnerScreen/C_listScreen.dart';
import 'package:catele/CattleOwnerScreen/CaProfile_Page.dart';
import 'package:catele/Cons_BookPage.dart';
import 'package:catele/Consult_Confirm.dart';
import 'package:catele/Consultation_Page.dart';
import 'package:catele/Payment_Page.dart';

void main() {
  runApp(PetProfileApp());
}

class PetProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'a': (context) => CattleListPage(),
        'b': (context) => AddCattlePage(),
        'c': (context) => CattleProfilePage(),
        'd': (context) => ConsultationBookingPage(),
        'e': (context) => PaymentPage(),
        'f': (context) => ConsultationConfirmationPage(),
        'g': (context) => ConsultationPage(),
        VideoCallPage.routeName: (context) => VideoCallPage(),
        ConsultationHistoryPage.routeName: (context) => ConsultationHistoryPage(),

      },
    );
  }
}

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
              'Connecting with ',
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
