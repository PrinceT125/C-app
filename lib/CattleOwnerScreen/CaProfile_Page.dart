import 'package:flutter/material.dart';

class CattleProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? cattle = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(cattle?['name'] ?? 'Cattle Profile'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(Icons.pets, size: 80, color: Colors.brown[400]),
                ),
                SizedBox(height: 16),
                _buildProfileDetail('Name', cattle?['name']),
                _buildProfileDetail('Age', cattle?['age']),
                _buildProfileDetail('Breed', cattle?['breed']),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    icon: Icon(Icons.medical_services),
                    label: Text('Book Consultation'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'd', arguments: cattle);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value ?? 'N/A',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
