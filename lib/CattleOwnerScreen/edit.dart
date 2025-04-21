import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';





class AddCattlePage extends StatefulWidget {
  const AddCattlePage({Key? key}) : super(key: key);

  @override
  _AddCattlePageState createState() => _AddCattlePageState();
}

class _AddCattlePageState extends State<AddCattlePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController breedController;
  late TextEditingController ageController;
  late TextEditingController descriptionController;
  String? gender;
  File? _image;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    breedController = TextEditingController();
    ageController = TextEditingController();
    descriptionController = TextEditingController();
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Cattle"),
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Display the cattle image at the top
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green.shade200,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage('assets/placeholder_image.png') as ImageProvider,
                    child: _image == null
                        ? const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 40,
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(controller: nameController, label: 'Cattle Name'),
              _buildTextField(controller: breedController, label: 'Breed'),
              _buildTextField(controller: ageController, label: 'Age'),
              _buildDropdown(
                label: 'Gender',
                items: ['Male', 'Female'],
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              _buildTextField(
                controller: descriptionController,
                label: 'Description',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() && gender != null) {
                    // Create a new cattle object
                    final newCattle = Cattle(
                      name: nameController.text,
                      breed: breedController.text,
                      age: ageController.text,
                      gender: gender!,
                      description: descriptionController.text,
                      imagePath: _image?.path ?? '', // Save image path if available
                    );

                    // Return the new cattle to the HomePage
                    Navigator.pop(context, newCattle);
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        validator: (value) =>
        value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        onChanged: onChanged,
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        validator: (value) => value == null ? 'Please select a $label' : null,
      ),
    );
  }
}



class Cattle {
  final String name;
  final String breed;
  final String age;
  final String gender;
  final String description;
  final String imagePath;

  Cattle({
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.description,
    this.imagePath = '',  // Optional image path
  });
}

class EditCattlePage extends StatefulWidget {
  final Cattle cattle;

  const EditCattlePage({Key? key, required this.cattle}) : super(key: key);

  @override
  _EditCattlePageState createState() => _EditCattlePageState();
}

class _EditCattlePageState extends State<EditCattlePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController breedController;
  late TextEditingController ageController;
  late TextEditingController descriptionController;
  String? gender;
  File? _image;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.cattle.name);
    breedController = TextEditingController(text: widget.cattle.breed);
    ageController = TextEditingController(text: widget.cattle.age);
    descriptionController = TextEditingController(text: widget.cattle.description);
    gender = widget.cattle.gender;
    _image = widget.cattle.imagePath.isNotEmpty ? File(widget.cattle.imagePath) : null;
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Use .camera for camera

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Cattle Profile"),
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Display the cattle image at the top
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green.shade200,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage('assets/placeholder_image.png') as ImageProvider,
                    child: _image == null
                        ? const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 40,
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(controller: nameController, label: 'Cattle Name'),
              _buildTextField(controller: breedController, label: 'Breed'),
              _buildTextField(controller: ageController, label: 'Age'),
              _buildDropdown(
                label: 'Gender',
                items: ['Male', 'Female'],
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              _buildTextField(
                controller: descriptionController,
                label: 'Description',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() && gender != null) {
                    // Update the cattle with new data
                    final updatedCattle = Cattle(
                      name: nameController.text,
                      breed: breedController.text,
                      age: ageController.text,
                      gender: gender!,
                      description: descriptionController.text,
                      imagePath: _image?.path ?? '', // Save image path if available
                    );

                    // Return the updated cattle to the previous page
                    Navigator.pop(context, updatedCattle);
                  }
                },
                child: const Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        validator: (value) =>
        value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items, required ValueChanged<String?> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        onChanged: onChanged,
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        validator: (value) => value == null ? 'Please select a $label' : null,
      ),
    );
  }
}
