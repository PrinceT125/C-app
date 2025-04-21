import 'package:flutter/material.dart';
import 'package:catele/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CattleConsultationScreen extends StatefulWidget {
  @override
  _CattleConsultationScreenState createState() =>
      _CattleConsultationScreenState();
}

class _CattleConsultationScreenState extends State<CattleConsultationScreen> {
  List<String> cattleList = [];

  void _navigateToAddCattleScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCattleScreen(
          onCattleAdded: (newCattle) {
            setState(() {
              cattleList.add(newCattle);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cattle Records"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Update or Add the Cattle Record",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Cattle List
            Expanded(
              child: ListView(
                children: cattleList
                    .map((cattle) => Card(
                  child: ListTile(
                    title: Text(cattle),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          cattleList.remove(cattle);
                        });
                      },
                    ),
                  ),
                ))
                    .toList(),
              ),
            ),

            // Add New Cattle Button
            ElevatedButton.icon(
              onPressed: _navigateToAddCattleScreen,
              icon: Icon(Icons.add),
              label: Text("Add New Cattle"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================
// Add New Cattle Screen
// ==========================
class AddCattleScreen extends StatefulWidget {
  final Function(String) onCattleAdded;

  AddCattleScreen({required this.onCattleAdded});

  @override
  _AddCattleScreenState createState() => _AddCattleScreenState();
}

class _AddCattleScreenState extends State<AddCattleScreen> {


  File? _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  TextEditingController petNameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String? selectedCategory;
  String? selectedBreed;
  String? selectedGender;
  int? selectedYears;
  int? selectedMonths;

  List<String> petCategories =  [
    'Dairy Cattle',
    'Draught Breeds Cattle',
    ' Dual Purpose Breeds Cattles',
    'Exotic / Crossbred Cattles'
  ];
  List<String> petBreeds = [
    "Gir (Gujarat)",
    "Sahiwal (Punjab, Haryana)",
    "Tharparkar (Rajasthan, Haryana)",
    "Kankrej (Gujarat, Rajasthan)",
    "Red Sindhi (Sindh, Punjab)",
    "Rathi (Rajasthan)",
    "Ongole (Andhra Pradesh)",
    "Deoni (Maharashtra, Karnataka)",
    // "Malvi (Madhya Pradesh)","Holstein Friesian (Europe)",
    // "Jersey (Isle of Jersey)",
    // "Swiss Brown (Switzerland)","Karan Swiss (Kankrej + Swiss Brown)",
    // "Karan Fries (Holstein Friesian + Tharparkar)",
    // "Sindh-Holstein Cross (Holstein Friesian + Red Sindhi)"
  ];

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController breedController = TextEditingController();
  // final TextEditingController ageController = TextEditingController();

  void _saveCattle() {
    if (_formKey.currentState!.validate()) {
      String cattleDetails =
          "${petNameController.text} (${selectedBreed}, Weight: ${weightController.text})";
      widget.onCattleAdded(cattleDetails);
      Navigator.pop(context);
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cattle Profile"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: petNameController,
                  decoration: InputDecoration(labelText: "Cattle's Name (Optional)"),
                ),
                DropdownButtonFormField(
                  value: selectedCategory,
                  items: petCategories.map((String category) {
                    return DropdownMenuItem(value: category, child: Text(category));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value as String;
                    });
                  },
                  decoration: InputDecoration(labelText: "Cattle Category"),
                ),

                DropdownButtonFormField(
                  value: selectedBreed,
                  items: petBreeds.map((String breed) {
                    return DropdownMenuItem(value: breed, child: Text(breed));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBreed = value as String;
                    });
                  },
                  decoration: InputDecoration(labelText: "Cattle's Breed (Optional)"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedYears,
                        items: List.generate(20, (index) => index).map((int value) {
                          return DropdownMenuItem(value: value, child: Text("$value Years"));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYears = value as int;
                          });
                        },
                        decoration: InputDecoration(labelText: "Age (Years)"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: selectedMonths,
                        items: List.generate(12, (index) => index).map((int value) {
                          return DropdownMenuItem(value: value, child: Text("$value Months"));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMonths = value as int;
                          });
                        },
                        decoration: InputDecoration(labelText: "Age (Months)"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gender"),
                    ChoiceChip(
                      label: Text("Male"),
                      selected: selectedGender == "Male",
                      onSelected: (selected) {
                        setState(() {
                          selectedGender = selected ? "Male" : null;
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Female"),
                      selected: selectedGender == "Female",
                      onSelected: (selected) {
                        setState(() {
                          selectedGender = selected ? "Female" : null;
                        });
                      },
                    ),
                  ],
                ),
                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Weight in Kg (Approx)"),
                ),
                // TextFormField(
                //   controller: dobController,
                //   decoration: InputDecoration(labelText: "Date of Birth (Optional)"),
                //   readOnly: true,
                //   onTap: () async {
                //     DateTime? pickedDate = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime(2000),
                //       lastDate: DateTime.now(),
                //     );
                //     if (pickedDate != null) {
                //       setState(() {
                //         dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                //       });
                //     }
                //   },
                // ),
                SizedBox(height: 40),
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: Colors.teal,
    //                 minimumSize: Size(double.infinity, 50),
    //               ),
    //               onPressed: () {
    //
    //                 if (_formKey.currentState!.validate()) {
    //                   // Submit form
    //                   _saveCattle;
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                     SnackBar(content: Text("Profile Saved")),
    //                   );
    //
    //               }
    //
    //               },
    //               child: Text("Save & Continue",
    //                 style: TextStyle(color: Colors.black45,fontSize: 20, fontWeight: FontWeight.bold),
    //                 textAlign: TextAlign.center,),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );






  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Add New Cattle")),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               controller: nameController,
  //               decoration: InputDecoration(labelText: "Cattle Name"),
  //               validator: (value) =>
  //               value!.isEmpty ? "Please enter a name" : null,
  //             ),
  //             SizedBox(height: 10),
  //             TextFormField(
  //               controller: breedController,
  //               decoration: InputDecoration(labelText: "Breed"),
  //               validator: (value) =>
  //               value!.isEmpty ? "Please enter the breed" : null,
  //             ),
  //             SizedBox(height: 10),
  //             TextFormField(
  //               controller: ageController,
  //               decoration: InputDecoration(labelText: "Age (years)"),
  //               keyboardType: TextInputType.number,
  //               validator: (value) => value!.isEmpty ? "Please enter age" : null,
  //             ),
  //             SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCattle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Save Cattle"),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
