import 'package:flutter/material.dart';
import 'chats_list_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat App"), backgroundColor: Colors.teal),
      body: ListView(
        children: [
          _buildListItem(
            Icons.chat,
            "Chats",
            context,
            ChatsListScreen(),
          ), // Navigate to ChatScreen
          _buildListItem(Icons.palette, "Template", context, null),
          _buildListItem(Icons.message, "Recived", context, null),
          _buildListItem(Icons.settings, "Settings", context, null),
          _buildListItem(Icons.chat, "Tags", context, null),
          _buildListItem(Icons.palette, "Sent messages", context, null),
          _buildListItem(Icons.message, "Reports", context, null),
          _buildListItem(Icons.settings, "role and permissions", context, null),
          _buildListItem(Icons.settings, "history", context, null),
        ],
      ),
    );
  }

  Widget _buildListItem(
    IconData icon,
    String title,
    BuildContext context,
    Widget? page,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("$title clicked")));
          }
        },
      ),
    );
  }
}
