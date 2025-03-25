import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatsListScreen extends StatefulWidget {
  @override
  _ChatsListScreenState createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  List<Map<String, String>> chats = [
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

  List<Map<String, String>> filteredChats = []; // For search results
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredChats = chats; // Initialize filteredChats with all chats
  }

  void filterChats(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredChats = chats; // Show all chats if query is empty
      } else {
        filteredChats =
            chats
                .where(
                  (chat) =>
                      chat["name"]!.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF567C8D),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        elevation: 5,
        selectedItemColor: Color(0xFF4169E1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Jared!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E4C5E),
                      ),
                    ),
                    Text(
                      "23 Jan, 2021",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                Icon(Icons.notifications, color: Colors.grey, size: 28),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterChats, // Call filter function on input change
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Chats List
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                var chat = filteredChats[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(chat["avatar"]!),
                    ),
                    title: Text(
                      chat["name"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      chat["message"]!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    trailing: Text(
                      chat["time"]!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
