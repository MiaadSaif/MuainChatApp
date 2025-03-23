import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatsListScreen extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      "name": "Johnny Doe",
      "message": "Lorem ipsum is simply...",
      "time": "08:10",
      "avatar": "1.png",
    },
    {
      "name": "Adrian",
      "message": "Exception sint occaecat...",
      "time": "03:11",
      "avatar": "2.png",
    },
    {
      "name": "Fiona",
      "message": "It has survived not only...",
      "time": "02:53",
      "avatar": "3.png",
    },
    {
      "name": "Emma",
      "message": "Consectetur adipiscing elit",
      "time": "11:38",
      "avatar": "4.png",
    },
    {
      "name": "Alexander",
      "message": "Duis aute irure dolor...",
      "time": "09:19",
      "avatar": "5.png",
    },
    {
      "name": "Alisher",
      "message": "Duis aute irure dolor in...",
      "time": "00:19",
      "avatar": "6.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center content
              children: [
                Expanded(
                  child: Center(child: Image.asset("moeen1.png", height: 60)),
                ),
                Icon(Icons.search, color: Colors.white, size: 28),
              ],
            ),
          ),

          // Chats List
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 68, 107, 180),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView.builder(
                itemCount: chats.length,
                padding: EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  var chat = chats[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(chat["avatar"]!),
                    ),
                    title: Text(
                      chat["name"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      chat["message"]!,
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    trailing: Text(
                      chat["time"]!,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ChatScreen(chat["name"]!, chat["avatar"]!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
