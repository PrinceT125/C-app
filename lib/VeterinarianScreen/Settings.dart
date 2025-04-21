import 'package:catele/CattleOwnerScreen/CaOwData.dart';
import 'package:flutter/material.dart';
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
//       home: SettingsPage(),
//     );
//   }
// }

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationsEnabled = true;
  bool isDarkMode = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Profile Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Name Field
            _buildTextField(
              label: 'Full Name',
              controller: _nameController,
              hintText: 'Dr. ${UserData.name}',
              icon: Icons.person,
            ),

            // Email Field
            SizedBox(height: 40),
            _buildTextField(
              label: 'Email Address',
              controller: _emailController,
              hintText: 'Enter your email address',
              icon: Icons.email,
            ),

            // Notifications Toggle
            SizedBox(height: 20),
            // _buildSwitchTile(
            //   label: 'Enable Notifications',
            //   value: isNotificationsEnabled,
            //   onChanged: (value) {
            //     setState(() {
            //       isNotificationsEnabled = value;
            //     });
            //   },
            //   icon: Icons.notifications,
            // ),

            // Dark Mode Toggle
            SizedBox(height: 50),
            // _buildSwitchTile(
            //   label: 'Dark Mode',
            //   value: isDarkMode,
            //   onChanged: (value) {
            //     setState(() {
            //       isDarkMode = value;
            //     });
            //   },
            //   icon: Icons.dark_mode,
            // ),

            // Save Button
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Text('Save Settings', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build text input fields
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Method to build a switch list tile with icons
  Widget _buildSwitchTile({
    required String label,
    required bool value,
    required Function(bool) onChanged,
    required IconData icon,
  }) {
    return SwitchListTile(
      title: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
      secondary: Icon(icon, color: Colors.green),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  // Save settings method
  void _saveSettings() {
    final String name = _nameController.text;
    final String email = _emailController.text;

    if (name.isEmpty || email.isEmpty) {
      // If any field is empty, show a warning
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields!')),
      );
    } else {
      // Save the settings (you can implement actual saving logic here)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Settings Saved Successfully')),
      );
    }
  }
}
