import 'package:flutter/material.dart';
// Assuming the veterinarian dashboard is named VeterinarianDashboard

class VeterinarianVerificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Under Verification'),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon to indicate verification status
            Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[50],
              ),
              child: Icon(
                Icons.pending,
                size: 100,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 24),

            // Title text for the status
            Text(
              'Your profile is under verification.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),

            // Subtext to explain the next steps
            Text(
              'After approval by the admin, you will have access to the Veterinarian Dashboard.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Button to go to the Dashboard (this can be replaced with actual verification check logic)
            ElevatedButton(
              onPressed: () {
                // For now, just redirect to the dashboard page for the sake of demonstration
                // Replace with actual logic after profile approval by admin
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VeterinarianDashboard(),
                //   ),
                // );
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
              child: Text('Go to Dashboard'),
            ),
            SizedBox(height: 20),

            // Option for contacting the admin if needed
            TextButton(
              onPressed: () {
                // Logic to let users know how to contact admins for updates
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Contact Admin'),
                    content: Text(
                        'If you have any questions about your verification status, please contact the admin.'),
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
