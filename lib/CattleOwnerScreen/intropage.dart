import 'package:catele/SplashScreen.dart';
import 'package:catele/CattleOwnerScreen/StartConsultation.dart';
import 'package:catele/CattleOwnerScreen/cattleRecord.dart';
import 'package:catele/consultation.dart';
import 'package:catele/CattleOwnerScreen/Farmer_Profile.dart';
import 'package:catele/CattleOwnerScreen/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catele/authscreen.dart';
import 'package:catele/CattleOwnerScreen/main.dart';
import 'CaOwData.dart';




class IntroPage extends StatefulWidget{
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Dairy Cattle', 'image': "assets/images/h.jpg"},
    {'title': 'Draught Breeds Cattle', 'image': 'assets/images/b.jpg'},
    {'title': ' Dual Purpose Breeds Cattles', 'image': 'assets/images/d.jpg'},
    {'title': 'Exotic / Crossbred Cattles', 'image': 'assets/images/c.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(





      appBar: AppBar(

        // title: Text('IntroPage'),
        // backgroundColor: Colors.purple[200],
        // actions: [
        //   ElevatedButton(
        //
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.red[500],
        //       foregroundColor: Colors.white,
        //     ),
        //
        //     onPressed: () {
        //       // Call the logout function here
        //       _logout(context);
        //     },child: Text('Logout', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        //   ),
        // ],




        backgroundColor: Colors.green[700],
        title: Text("Cattle Telemedicine"),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => notification()),
            );
          }),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }),
        ],



      ),

      drawer: CustomDrawer(),

      body:

      SingleChildScrollView(
        child: Column(
          children: [
            // Banner Image & Title
            Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                children: [
                  Container(
                    height: 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: Image.asset(
                          'assets/images/a.jpg', height: 210, width: double.infinity, fit: BoxFit.cover
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Reliable & Quick Cattle Care",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "I need consultation for:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Grid Layout
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConsultationScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(categories[index]['image']),
                          ),
                          SizedBox(height: 8),
                          Text(categories[index]['title'], textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.green[700],
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "Education"),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shop"),
      //     BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offers"),
      //   ],
      // ),


    );

  }

  void _logout(BuildContext context) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }}







class CustomDrawer extends StatelessWidget {
  // final String

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header with Profile Picture and Name
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: UserAccountsDrawerHeader(
              accountName: Text('${UserData.name}'),
              accountEmail: Text('${UserData.email}'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with actual profile image
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),

          // Drawer Menu Items
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle home navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text('Cattle Records'),
            onTap: () {
              // Handle cattle health navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CattleConsultationScreen()),
              ); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Virtual Consultation'),
            onTap: () {
              // Handle virtual consultation navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Handle notification navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              ); // Close the drawer
            },
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SplashScreen()),); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
