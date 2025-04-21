import 'package:catele/CattleOwnerScreen/vetsProfile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

String _getCurrentTimeStatic() {
  final now = DateTime.now();
  final month = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ][now.month - 1];
  int hour = now.hour;
  final suffix = hour >= 12 ? 'PM' : 'AM';
  hour = hour > 12 ? hour - 12 : hour == 0 ? 12 : hour;
  final minute = now.minute.toString().padLeft(2, '0');
  return "${now.day.toString().padLeft(2, '0')}-$month $hour:$minute $suffix";
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> messages = [
    {
      'sender': 'assistant',
      'text': "Hey, I am Doctor’s Assistant: Is this issue older than one week?",
      'time': _getCurrentTimeStatic()
    },
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          'sender': 'user',
          'text': text,
          'time': _getCurrentTime(),
        });
        _controller.clear();
      });
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.day.toString().padLeft(2, '0')}-${_monthToStr(now.month)} ${_formatTime(now)}";
  }

  String _monthToStr(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime time) {
    int hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final suffix = hour >= 12 ? 'PM' : 'AM';
    hour = hour > 12 ? hour - 12 : hour == 0 ? 12 : hour;
    return "$hour:$minute $suffix";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C5D50),
        title: Row(
          children: [
             GestureDetector(
               onTap:(){ Navigator.push(context, MaterialPageRoute(builder:(context) => VetProfilePage(),),);},
               child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 18,
                ),
             ),

            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CattlesApp', style: TextStyle(fontSize: 16)),
                Text('CA232123', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]['sender'] == 'user';
                return Align(
                  alignment:
                  isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Color(0xFFDCF8C6)
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft:
                        isUser ? Radius.circular(16) : Radius.circular(0),
                        bottomRight:
                        isUser ? Radius.circular(0) : Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    constraints: BoxConstraints(maxWidth: 280),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messages[index]['text']!,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 4),
                        Text(
                          messages[index]['time']!,
                          style:
                          TextStyle(fontSize: 11, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Color(0xFF1C5D50),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}