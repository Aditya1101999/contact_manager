import 'package:flutter/material.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/screens/edit_contact_screen.dart';
import 'package:contact_manager/screens/delete_contact_screen.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  ContactListItem({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactScreen(contact: contact),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeleteContactScreen(contact: contact),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

