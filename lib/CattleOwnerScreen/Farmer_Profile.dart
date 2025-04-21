import 'package:flutter/material.dart';
import 'CaOwData.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String gender = "Male";
  String state = "${UserData.location}";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobNoController = TextEditingController();
  final locationController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E6153),
        title: Center(child: Text("Cattle", style: TextStyle(color: Colors.white))),
        // actions: [
        //   IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {}),
        //   IconButton(icon: Icon(Icons.account_circle, color: Colors.white), onPressed: () {}),
        // ],
      ),
      // drawer: Drawer(), // Drawer menu
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {}, // Profile picture change action
                child: Column(
                  children: [
                    Icon(Icons.camera_alt, size: 50, color: Colors.teal),
                    Text("Change profile", style: TextStyle(color: Colors.teal))
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("${UserData.name}", nameController),
              _buildTextField("${UserData.email}",emailController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                    height: 31,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Mobile No. ${UserData.mobno}", style: TextStyle(color: Colors.black , fontSize: 20)),
                      ],
                    )),
              ),
              _buildTextField("Age",ageController),
              SizedBox(height: 10),
              _buildGenderSelection(),
              _buildTextField("${UserData.location}", locationController),
              // _buildTextField("Referral Code"),
              // SizedBox(height: 10),
              // _buildStateSelection(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E6153),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                ),
                onPressed: () {
                  final updatedName = nameController.text.isNotEmpty ? nameController.text : UserData.name;
                  final updatedEmail = emailController.text.isNotEmpty ? emailController.text : UserData.email;
                  final updatedLocation = locationController.text.isNotEmpty ? locationController.text : UserData.location;
                  final updatedMobNo = mobNoController.text.isNotEmpty ? mobNoController.text : UserData.mobno;

                  UserData.setUser(
                    name: updatedName,
                    email: updatedEmail,
                    location: updatedLocation,

                  );
                  UserData.setMob(mobno: updatedMobNo,);

                  Navigator.pop(context);
                },

                child: Text("Update Profile", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText ,TextEditingController controller ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      children: [
        Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 20),
        ChoiceChip(
          label: Text("Male"),
          selected: gender == "Male",
          onSelected: (selected) => setState(() => gender = "Male"),
          selectedColor: Colors.teal,
        ),
        SizedBox(width: 10),
        ChoiceChip(
          label: Text("Female"),
          selected: gender == "Female",
          onSelected: (selected) => setState(() => gender = "Female"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }

  Widget _buildStateSelection() {
    return Row(
      children: [
        Text("State: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(state, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
        TextButton(
          onPressed: () {},
          child: Text("Change State", style: TextStyle(color: Colors.teal)),
        ),
      ],
    );
  }
}