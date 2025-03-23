import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String avatar;

  ChatScreen(this.name, this.avatar);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [
    {"text": "Lorem ipsum is simply dummy text", "sender": "other"},
    {"text": "Okay 😃", "sender": "me"},
    {"text": "It has survived not only five centuries...", "sender": "other"},
    {
      "text": "Contrary to popular belief, Lorem Ipsum is not random text.",
      "sender": "me",
    },
    {
      "text":
          "The generated Lorem Ipsum is therefore always free from repetition.",
      "sender": "other",
    },
    {"text": "😎😂😃", "sender": "me"},
  ];

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add({"text": messageController.text, "sender": "me"});
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A4FC1),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A4FC1),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(widget.avatar)),
            SizedBox(width: 10),
            Text(widget.name, style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          Icon(Icons.call, size: 26, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.video_call, size: 26, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool isMe = messages[index]["sender"] == "me";
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isMe
                                ? Color.fromARGB(255, 68, 107, 180)
                                : const Color.fromARGB(255, 133, 133, 133),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        messages[index]["text"]!,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Input Field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: sendMessage,
                  child: Icon(Icons.send, color: Colors.white),
                  backgroundColor: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
