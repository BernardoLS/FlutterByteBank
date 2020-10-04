import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameControlller = TextEditingController();
  final TextEditingController _accountControlller = TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget> [
            TextField(
              controller: _nameControlller,
                decoration: InputDecoration(
                  labelText: 'Full name',
                ),
                style: TextStyle(
                  fontSize: 24.0
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: TextField(
                controller: _accountControlller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(
                  fontSize: 24.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('create'),
                  onPressed: () {
                    final String name = _nameControlller.text;
                    final int accountNumber = int.tryParse(_accountControlller.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}