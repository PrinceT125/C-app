// import 'package:flutter/material.dart';
//
//
// class Cattle {
//   String name;
//   String breed;
//   String age;
//   String gender;
//   String description;
//
//   Cattle({
//     required this.name,
//     required this.breed,
//     required this.age,
//     required this.gender,
//     required this.description,
//   });
// }
//
// class AddCattlePage extends StatelessWidget {
//
//
//   final _formKey = GlobalKey<FormState>();
//
//   AddCattlePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final nameController = TextEditingController();
//     final breedController = TextEditingController();
//     final ageController = TextEditingController();
//     final descriptionController = TextEditingController();
//     String? gender;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add New Cattle"),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.green[50],
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               _buildTextField(controller: nameController, label: 'Cattle Name'),
//               _buildTextField(controller: breedController, label: 'Breed'),
//               _buildTextField(controller: ageController, label: 'Age'),
//               _buildDropdown(
//                 label: 'Gender',
//                 items: ['Male', 'Female'],
//                 onChanged: (value) {
//                   gender = value;
//                 },
//               ),
//               _buildTextField(
//                 controller: descriptionController,
//                 label: 'Description',
//                 maxLines: 3,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate() && gender != null) {
//                     // Create a new cattle object
//                     final newCattle = Cattle(
//                       name: nameController.text,
//                       breed: breedController.text,
//                       age: ageController.text,
//                       gender: gender!,
//                       description: descriptionController.text,
//                     );
//
//                     // Return the new cattle to the HomePage
//                     Navigator.pop(context, newCattle);
//                   }
//                 },
//                 child: const Text("Save", style: TextStyle(fontSize: 16)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({required TextEditingController controller, required String label, int maxLines = 1}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         controller: controller,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.green),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.green, width: 2),
//           ),
//           border: const OutlineInputBorder(),
//         ),
//         validator: (value) =>
//         value == null || value.isEmpty ? 'Please enter $label' : null,
//       ),
//     );
//   }
//
//   Widget _buildDropdown({required String label, required List<String> items, required ValueChanged<String?> onChanged}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.green),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.green, width: 2),
//           ),
//           border: const OutlineInputBorder(),
//         ),
//         onChanged: onChanged,
//         items: items
//             .map((item) => DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         ))
//             .toList(),
//         validator: (value) => value == null ? 'Please select a $label' : null,
//       ),
//     );
//   }
// }