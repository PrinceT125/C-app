import 'package:flutter/material.dart';



class VetProfilePage extends StatelessWidget {
  const VetProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF1A6F69);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'CattlesApp',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Profile Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage('assets/images/doctor.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr. Samarjeet Yadav",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "BVSc&AH • 2+ yrs Experience",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Online",
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              const Text("5.00 (518)"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            buildSectionTitle("Qualification"),
            buildListTile("BVSc&AH"),

            buildSectionTitle("Vet Regd. S. No."),
            buildListTile("VCI-13015"),

            buildSectionTitle("Areas of Expertise"),
            buildList([
              "Cat", "Dog", "Other", "Poultry", "Dairy", "Farm Animal"
            ]),

            buildSectionTitle("Speaks"),
            buildList(["English", "Hindi"]),

            buildSectionTitle("Specialization"),
            buildList([
              "Physician",
              "Surgeon",
              "Gynecology",
              "Dentistry",
              "Dermatology (Skin Expert)",
              "Diet & Nutrition",
              "Pathology",
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.star, size: 20, color: Colors.teal),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.teal[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => buildListTile(item)).toList(),
    );
  }

  Widget buildListTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
