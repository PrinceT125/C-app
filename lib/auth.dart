import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_screen.dart'; // Import the OTP screen
import 'CattleOwnerScreen/CaOwData.dart';
void main(){
  runApp(Login());
}
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('', height: 80),
            // Replace with actual image

            SizedBox(height: 20),
            Text(
              "Cattle",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Login via OTP", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            IntlPhoneField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
            ),
            SizedBox(height: 10),
            Text(
              "I agree to Cattle Terms and Conditions & Privacy Policy",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  if (phoneNumber.isNotEmpty) {
                    UserData.setMob(
                      mobno: phoneController.text,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: phoneNumber)),
                    );
                  }
                },
                child: Text("Agree & Login", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            SizedBox(height: 10),
            // Text("Sign up to Dr. PetsApp and get ₹25 (For Indian users only)", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}