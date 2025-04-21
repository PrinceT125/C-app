// import 'package:flutter/material.dart';
//
// class AddCattlePage extends StatefulWidget {
//   @override
//   _AddCattlePageState createState() => _AddCattlePageState();
// }
//
// class _AddCattlePageState extends State<AddCattlePage> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '', age = '', breed = '';
//
//   void _submit() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Navigator.pop(context, {'name': name, 'age': age, 'breed': breed});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add New Cattle'), backgroundColor: Colors.green[700]),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Cattle Name'),
//                 validator: (value) => value!.isEmpty ? 'Enter a name' : null,
//                 onSaved: (value) => name = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Age'),
//                 validator: (value) => value!.isEmpty ? 'Enter age' : null,
//                 onSaved: (value) => age = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Breed'),
//                 validator: (value) => value!.isEmpty ? 'Enter breed' : null,
//                 onSaved: (value) => breed = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submit,
//                 child: Text('Add Cattle'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
