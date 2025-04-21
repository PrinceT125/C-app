import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = 'Credit Card';

  void _confirmPayment() {
    Navigator.pushNamed(context, 'f', arguments: {
      'paymentMethod': selectedPaymentMethod,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildPaymentOption('Credit Card', Icons.credit_card),
            _buildPaymentOption('Debit Card', Icons.account_balance_wallet),
            _buildPaymentOption('UPI', Icons.qr_code),
            _buildPaymentOption('Net Banking', Icons.laptop),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _confirmPayment,
                child: Text('Make Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method, IconData icon) {
    return RadioListTile<String>(
      title: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(method),
        ],
      ),
      value: method,
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        setState(() {
          selectedPaymentMethod = value!;
        });
      },
    );
  }
}
