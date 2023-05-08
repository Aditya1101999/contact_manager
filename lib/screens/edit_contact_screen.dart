import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/widgets/contact_form.dart';

class EditContactScreen extends StatefulWidget {
  final Contact contact;

  EditContactScreen({required this.contact});

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContactForm(
          formKey: _formKey,
          initialContact: widget.contact,
          onSave: (Contact contact) async {
            final user = FirebaseAuth.instance.currentUser;
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user?.uid)
                .collection('contacts')
                .doc(widget.contact.id)
                .update(contact.toMap());
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
