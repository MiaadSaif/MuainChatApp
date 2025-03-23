import 'package:flutter/material.dart';
import 'chats_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ChatsListScreen(), // Load the new home page
    );
  }
}
