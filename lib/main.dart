import 'package:flutter/material.dart';
import 'login_screen.dart';
//import 'chats_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/', // Set initial route to login
      routes: {
        // '/': (context) => ChatsListScreen(), // Login screen as the home page
        '/': (context) => LoginScreen(), // Login screen as the home page
      },
    );
  }
}
