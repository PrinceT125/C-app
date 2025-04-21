import 'package:flutter/material.dart';

class CattleListPage extends StatefulWidget {
  @override
  _CattleListPageState createState() => _CattleListPageState();
}

class _CattleListPageState extends State<CattleListPage> {
  List<Map<String, String>> cattle = [
    {'name': 'Bella', 'age': '4 years', 'breed': 'Holstein'},
    {'name': 'Max', 'age': '3 years', 'breed': 'Jersey'},
    {'name': 'Daisy', 'age': '5 years', 'breed': 'Guernsey'},
  ];

  void _addCattle(Map<String, String> newCattle) {
    setState(() {
      cattle.add(newCattle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cattle List'),
        backgroundColor: Colors.green[700],
      ),
      body: cattle.isEmpty
          ? Center(
        child: Text(
          'No cattle added yet. Click + to add.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: cattle.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown[300],
                child: Icon(Icons.pets, color: Colors.white),
              ),
              title: Text(
                cattle[index]['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${cattle[index]['breed']} • ${cattle[index]['age']}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, 'c', arguments: cattle[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: Icon(Icons.add),
        onPressed: () async {
          final newCattle = await Navigator.pushNamed(context, 'b');
          if (newCattle != null && newCattle is Map<String, String>) {
            _addCattle(newCattle);
          }
        },
      ),
    );
  }
}
