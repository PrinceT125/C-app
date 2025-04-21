import 'package:catele/CattleOwnerScreen/C_listScreen.dart';
import 'package:catele/Consult_Confirm.dart';
import 'package:catele/Consultation_Page.dart';
import 'package:flutter/material.dart';



class Consultation extends StatefulWidget {
  @override
  State<Consultation> createState() => _Consultation();
}

class _Consultation extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cattle Telemedicine'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for veterinarians...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Quick Access Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAccessButton(context,Icons.medical_services, "Consult a Vet","a"),
                _buildQuickAccessButton(context,Icons.book, "Health Records","abc"),
                _buildQuickAccessButton(context,Icons.fastfood, "Diet Plans","abc"),
              ],
            ),
            SizedBox(height: 20),

            // Available Veterinarians
            Text(
              "Available Veterinarians",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildVetCard("Dr. A. Sharma", "Large Animal Specialist"),
                  _buildVetCard("Dr. B. Kumar", "Dairy Cattle Expert"),
                  _buildVetCard("Dr. C. Patel", "General Veterinary Care"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessButton(BuildContext context,IconData icon, String label,String route) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, route),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green[200],
            child: Icon(icon, size: 30, color: Colors.green[700]),

          ),
        ),
        SizedBox(height: 5),

        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],

    );
  }

  Widget _buildVetCard(String name, String specialty) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[400],
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CattleListPage()),
            );
          },
          child: Text("Consult"),
        ),
      ),
    );
  }
}