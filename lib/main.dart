import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contact_manager/screens/contact_list_screen.dart';
import 'package:contact_manager/screens/create_contact_screen.dart';
import 'package:contact_manager/screens/delete_contact_screen.dart';
import 'package:contact_manager/screens/edit_contact_screen.dart';
import 'package:contact_manager/screens/login_screen.dart';

import 'models/contact.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLoggedIn ? '/contacts' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/contacts': (context) => ContactListScreen(),
        '/create_contact': (context) => CreateContactScreen(),
        '/edit_contact': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return EditContactScreen(contact: args as Contact);
        },
        '/delete_contact': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return DeleteContactScreen(contact: args as Contact);
        }
      },
    );
  }
}

