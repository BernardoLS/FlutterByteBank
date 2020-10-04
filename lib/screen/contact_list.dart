import 'package:bytebank/screen/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Alex',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                subtitle: Text(
                  '1000',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(), 
            ),
          ).then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}