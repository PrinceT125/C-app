import 'package:catele/Add_CPage.dart';
import 'package:catele/CattleOwnerScreen/chatPage.dart';
import 'package:catele/CattleOwnerScreen/edit.dart';
import 'package:flutter/material.dart';



// class PetProfile {
//   final String name;
//   final String type;
//
//   PetProfile({required this.name, required this.type});
// }


class ConsultationScreen extends StatefulWidget {
  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  final List<Cattle> petProfiles = [

  ];

  List<Cattle> cattleList = []; // List to store all the cattle

  // Function to navigate to AddCattlePage
  void navigateToAddCattlePage() async {
    final newCattle = await Navigator.push<Cattle>(
      context,
      MaterialPageRoute(builder: (context) => AddCattlePage()),
    );
    if (newCattle != null) {
      setState(() {
        cattleList.add(newCattle);
      });
    }
  }


  void navigateToEditCattlePage(Cattle cattle) async {
    final editedCattle = await Navigator.push<Cattle>(
      context,
      MaterialPageRoute(
        builder: (context) => EditCattlePage(cattle: cattle),
      ),
    );
    if (editedCattle != null) {
      setState(() {
        int index = cattleList.indexOf(cattle);
        cattleList[index] = editedCattle; // Update the cattle in the list
      });
    }
  }
  Cattle? selectedPet;

  String selectedCategory = 'Dentistry';
  final List<String> categories = [
    'Dentistry',
    'General Checkup',
    'Vaccination',
    'Injury',
    'Skin Problems'
  ];

  final TextEditingController descriptionController = TextEditingController();

  // void _navigateToAddPet() {
  //   // Simulated new pet creation (you can navigate to another screen)
  //   setState(() {
  //     selectedPet = PetProfile(name: "New Pet", type: "Unknown Cattle");
  //     petProfiles.add(selectedPet!);
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("New pet profile added and selected.")),
  //   );
  // }

  void _editPetProfile() {
    // Edit logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Edit pet profile feature coming soon.")),
    );
  }

  // void _deletePetProfile() {
  //   if (selectedPet != null) {
  //     setState(() {
  //       petProfiles.remove(selectedPet);
  //       selectedPet = null;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Pet profile deleted.")),
  //     );
  //   }
  // }
  void _deletePetProfile(Cattle cattle) {
    if (cattle != null) {
      setState(() {
        cattleList.remove(cattle); // Removes the selected cattle from the list
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cattle profile deleted.")),
      );
    }
  }

  void _startConsultation() {
    if (selectedPet == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Cattle Selected"),
            content: Text("Please select a cattle or add a new one to proceed."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Just close the dialog
                },
                child: Text("Select Existing"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  navigateToAddCattlePage(); // Add new pet
                },
                child: Text("Add New Cattle"),
              ),
            ],
          );
        },
      );
    } else {
      // Proceed to consultation logic
      Navigator.push(context, MaterialPageRoute(builder:(context) => ChatPage(),),);
      print('Consultation started');
      print('Selected Pet: ${selectedPet!.name}');
      print('Concern: $selectedCategory');
      print('Details: ${descriptionController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Consultation started for ${selectedPet!.name}")),
      );
    }
  }

  void _selectCattle(Cattle cattle) {
    setState(() {
      if (selectedPet == cattle){
        selectedPet = null;
      }
      else{
        selectedPet = cattle;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cattle"),
        centerTitle: true,
        // leading: Icon(Icons.menu),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        //   IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        // ],
      ),
      // body: ListView.builder(
      //   itemCount: cattleList.length,
      //   itemBuilder: (context, index) {
      //     final cattle = cattleList[index];
      //     return ListTile(
      //       title: Text(cattle.name),
      //       subtitle: Text('Breed: ${cattle.breed}, Age: ${cattle.age}, Gender: ${cattle.gender}'),
      //
      //       trailing: IconButton(
      //         icon: Icon(Icons.edit),
      //         onPressed: () => navigateToEditCattlePage(cattle),
      //       ),
      //     );
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Choose your pet you want to consult for",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            _buildAddPetCard(),
            const SizedBox(height: 12),
            // Container(
            //   height: 200,
            //   child: ListView.builder(
            //     itemCount: cattleList.length,
            //     itemBuilder: (context, index) {
            //
            //       final cattle = cattleList[index];
            //       return ListTile(
            //         title: Text(cattle.name),
            //         subtitle: Text('Breed: ${cattle.breed}, Age: ${cattle.age}, Gender: ${cattle.gender}'),
            //
            //           tileColor: selectedPet == cattle ? Colors.green.shade100 : null,  // Highlight selected cattle
            //           onTap: () => _selectCattle(cattle),
            //         trailing: Row(
            //             mainAxisSize: MainAxisSize.min, // Ensures icons are placed at the end
            //             children: [
            //
            //         IconButton(
            //             onPressed:  () {
            //               _deletePetProfile(cattle); // Pass the selected cattle to the delete function
            //             },
            //             icon: Icon(Icons.delete, color: Colors.red)),
            //         IconButton(
            //           icon: Icon(Icons.edit),
            //           onPressed: () => navigateToEditCattlePage(cattle),
            //         ),
            //         ]
            //         )
            //       );
            //     },
            //   ),
            // ),

            // Container(
            //   height: 200,
            //   child: ListView.builder(
            //     itemCount: cattleList.length,
            //     itemBuilder: (context, index) {
            //       final cattle = cattleList[index];
            //       return GestureDetector(
            //         onTap: () => _selectCattle(cattle), // Handle tap to select/deselect cattle
            //         child: Container(
            //           margin: const EdgeInsets.symmetric(vertical: 8), // Spacing between items
            //           padding: const EdgeInsets.all(12), // Padding inside each card
            //           decoration: BoxDecoration(
            //             color: selectedPet == cattle ? Colors.green.shade100 : Colors.white, // Highlight selected item
            //             borderRadius: BorderRadius.circular(16), // Rounded corners
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.2),
            //                 spreadRadius: 2,
            //                 blurRadius: 4,
            //                 offset: Offset(0, 2), // Shadow effect
            //               ),
            //             ],
            //             border: Border.all(
            //               color: selectedPet == cattle ? Colors.green : Colors.grey.shade300, // Border color changes based on selection
            //               width: 1.5, // Border width
            //             ),
            //           ),
            //           child: Row(
            //             children: [
            //               CircleAvatar(
            //                 backgroundColor: Colors.teal,
            //                 child: Text(
            //                   cattle.name.substring(0, 1), // Display first letter of the cattle name
            //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //               SizedBox(width: 16),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       cattle.name,
            //                       style: TextStyle(
            //                         fontSize: 16,
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.black87,
            //                       ),
            //                     ),
            //                     SizedBox(height: 4),
            //                     Text(
            //                       'Breed: ${cattle.breed}, Age: ${cattle.age}, Gender: ${cattle.gender}',
            //                       style: TextStyle(fontSize: 14, color: Colors.black54),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisSize: MainAxisSize.min, // Ensures icons are placed at the end
            //                 children: [
            //                   IconButton(
            //                     onPressed: () => _deletePetProfile(cattle), // Delete selected cattle
            //                     icon: Icon(Icons.delete, color: Colors.red),
            //                   ),
            //                   IconButton(
            //                     onPressed: () => navigateToEditCattlePage(cattle), // Edit selected cattle
            //                     icon: Icon(Icons.edit, color: Colors.blue),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            Container(
              height: 200,
              child: ListView.builder(
                itemCount: cattleList.length,
                itemBuilder: (context, index) {
                  final cattle = cattleList[index];
                  return GestureDetector(
                    onTap: () => _selectCattle(cattle), // Handle tap to select/deselect cattle
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8), // Spacing between items
                      padding: const EdgeInsets.all(12), // Padding inside each card
                      decoration: BoxDecoration(
                        color: selectedPet == cattle ? Colors.green.shade100 : Colors.white, // Highlight selected item
                        borderRadius: BorderRadius.circular(16), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // Shadow effect
                          ),
                        ],
                        border: Border.all(
                          color: selectedPet == cattle ? Colors.green : Colors.grey.shade300, // Border color changes based on selection
                          width: 1.5, // Border width
                        ),
                      ),
                      child: Row(
                        children: [
                          // Display image or first letter based on availability
                          CircleAvatar(
                            radius: 30, // Size of the CircleAvatar
                            backgroundColor: Colors.teal,
                            backgroundImage: cattle.imagePath.isNotEmpty
                                ? AssetImage(cattle.imagePath) // Use AssetImage for assets
                                : null,
                            child: cattle.imagePath.isEmpty
                                ? Text(
                              cattle.name.substring(0, 1), // Display first letter of the cattle name
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )
                                : null,
                          ),

                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cattle.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Breed: ${cattle.breed}, Age: ${cattle.age}, Gender: ${cattle.gender}',
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min, // Ensures icons are placed at the end
                            children: [
                              IconButton(
                                onPressed: () => _deletePetProfile(cattle), // Delete selected cattle
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () => navigateToEditCattlePage(cattle), // Edit selected cattle
                                icon: Icon(Icons.edit, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),



            SizedBox(height: 20,),
            const SizedBox(height: 24),
            _buildCategoryDropdown(),
            const SizedBox(height: 20),
            _buildDescriptionInput(),
            const SizedBox(height: 20),
            _buildStartConsultationButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPetCard() {
    return GestureDetector(
      onTap: navigateToAddCattlePage,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: const [
            Icon(Icons.add_circle_outline, size: 30, color: Colors.teal),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add new pet",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Click to create profile",
                    style: TextStyle(color: Colors.grey)),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget _buildPetProfileCard(PetProfile pet) {
  //   final isSelected = selectedPet == pet;
  //   return GestureDetector(
  //     onTap: () => _selectPet(pet),
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 10),
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: isSelected ? Colors.teal.shade200 : Colors.grey.shade200,
  //         borderRadius: BorderRadius.circular(12),
  //         border: isSelected ? Border.all(color: Colors.teal, width: 2) : null,
  //       ),
  //       child: Row(
  //         children: [
  //           CircleAvatar(
  //             radius: 24,
  //             backgroundColor: Colors.teal,
  //             child: Text(pet.name.substring(0, 1),
  //                 style: TextStyle(color: Colors.white, fontSize: 18)),
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(pet.name,
  //                     style:
  //                     TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  //                 Text(pet.type,
  //                     style: TextStyle(fontSize: 14, color: Colors.black54)),
  //               ],
  //             ),
  //           ),
  //           IconButton(
  //               onPressed:  () {
  //                 _deletePetProfile(cattle); // Pass the selected cattle to the delete function
  //               },
  //               icon: Icon(Icons.delete, color: Colors.red)),
  //           IconButton(
  //               onPressed:  ()  => navigateToEditCattlePage,
  //
  //
  //               icon: Icon(Icons.edit, color: Colors.blue)),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        labelText: 'Select Concern',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: categories
          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
    );
  }

  Widget _buildDescriptionInput() {
    return TextFormField(
      controller: descriptionController,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: "Tell us more",
        hintText: "e.g.: My pet is not eating properly...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildStartConsultationButton() {
    return ElevatedButton(
      onPressed: _startConsultation,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: const Text("Start Consultation",
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}