import 'package:catele/VeterinarianScreen/vetUi.dart';
import 'package:flutter/material.dart';

class ConsultationPage extends StatefulWidget {
  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void _sendMessage(String text, bool isUser) {
    setState(() {
      messages.add({'text': text, 'isUser': isUser});
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation'),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              // Implement video call functionality
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoCallPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index]['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: messages[index]['isUser']
                          ? Colors.green[300]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      messages[index]['text'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                _sendMessage(messageController.text, true);
              }
            },
            backgroundColor: Colors.green[700],
            child: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

