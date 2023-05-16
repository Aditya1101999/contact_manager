import 'package:flutter/material.dart';
import 'package:contact_manager/models/contact.dart';


class ContactForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Contact? initialContact;
  final Function(Contact) onSave;

  const ContactForm({super.key, required this.formKey, this.initialContact, required this.onSave});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
        text: widget.initialContact?.name ?? '');
    _emailController = TextEditingController(
        text: widget.initialContact?.email ?? '');
    _phoneController = TextEditingController(
        text: widget.initialContact?.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                final contact = Contact(
                  id: widget.initialContact?.id ?? '',
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                );
                widget.onSave(contact);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
