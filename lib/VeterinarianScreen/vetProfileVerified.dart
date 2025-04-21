import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:catele/VeterinarianScreen/vetUi.dart';

class VerifiedPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Verified'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success icon
            Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[50],
              ),
              child: Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 24),

            // Title text for verification success
            Text(
              'Your profile has been successfully verified!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),

            // Subtext explaining next steps
            Text(
              'You can now proceed to your Veterinarian Dashboard.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Button to navigate to Vet Dashboard
            ElevatedButton(
              onPressed: () {
                // Navigate to Veterinarian Dashboard
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vetui(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Go to Veterinarian Dashboard'),
            ),
            SizedBox(height: 20),

            // Contact admin option
            TextButton(
              onPressed: () {
                // Show a contact admin dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Contact Admin'),
                    content: Text('For inquiries, please contact the admin.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Need help? Contact Admin',
                style: TextStyle(color: Colors.green[700], fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RejectionPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Rejected'),
        backgroundColor: Colors.red[700],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Rejection icon
            Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[50],
              ),
              child: Icon(
                Icons.cancel,
                size: 100,
                color: Colors.red[700],
              ),
            ),
            SizedBox(height: 24),

            // Title text for rejection
            Text(
              'Your profile has been rejected.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),

            // Subtext explaining rejection
            Text(
              'Unfortunately, your application was not accepted. Please contact the admin for further details.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Button to contact admin
            ElevatedButton(
              onPressed: () {
                // Contact admin for further explanation
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Contact Admin'),
                    content: Text('Please reach out to the admin for more details regarding the rejection.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Contact Admin'),
            ),
          ],
        ),
      ),
    );
  }
}


