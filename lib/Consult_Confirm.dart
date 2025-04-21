import 'package:flutter/material.dart';

class ConsultationConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? details =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation Confirmed'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(Icons.check_circle, size: 80, color: Colors.green),
                ),
                SizedBox(height: 20),
                Text('Your consultation has been confirmed!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildDetailRow('Date', details?['date']),
                _buildDetailRow('Time', details?['time']),
                _buildDetailRow('Reason', details?['reason']),
                _buildDetailRow('Payment Method', details?['paymentMethod'] ?? 'Not required'),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'g');
                    },
                    child: Text('Join Consultation'),
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
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value ?? 'N/A', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
