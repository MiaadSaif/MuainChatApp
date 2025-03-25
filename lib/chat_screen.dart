import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String avatar;

  ChatScreen(this.name, this.avatar);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [
    {
      "text": "Hello, I'm Dr. Jamal Smulikov\nIs there anything I can help?",
      "sender": "other",
    },
    {
      "text": "Hi, Dr. Jamal! I have a toothache since yesterday morning",
      "sender": "me",
    },
    {"text": "Have you taken any medicine so far?", "sender": "other"},
    {"text": "Not yet, doctor", "sender": "me"},
    {
      "text": "You must take Proris medicine, to ease the pain in your teeth",
      "sender": "other",
    },
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

  // Method to handle file attachment
  Future<void> attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Handle web platform differently
      if (result.files.single.bytes != null) {
        // On web, access bytes property and add a placeholder file name
        print("File selected: ${result.files.single.name}");
        setState(() {
          messages.add({
            "text": "📎 File attached: ${result.files.single.name}",
            "sender": "me",
          });
        });
      } else if (result.files.single.path != null) {
        // Handle non-web platforms (mobile/desktop)
        String fileName = result.files.single.name;
        print("File selected: $fileName");
        setState(() {
          messages.add({"text": "📎 File attached: $fileName", "sender": "me"});
        });
      }
    } else {
      print("File selection canceled or failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.avatar),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  "DENTIST",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.settings, size: 26, color: Colors.black54),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:
                            isMe
                                ? Color(0xFF567C8D)
                                : Color.fromARGB(255, 251, 236, 232),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft:
                              isMe ? Radius.circular(20) : Radius.circular(0),
                          bottomRight:
                              isMe ? Radius.circular(0) : Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        messages[index]["text"]!,
                        style: TextStyle(
                          fontSize: 16,
                          color: isMe ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: attachFile,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: sendMessage,
                  backgroundColor: Color(0xFF567C8D),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
