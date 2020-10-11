import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDao {
  static const tableSql = 'CREATE TABLE $_tableName('
      '$_contactId INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = "contacts";
  static const String _name = "name";
  static const String _contactId = "id";
  static const String _accountNumber = "account_number";

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    return await _toList(db);
  }

  Future<List<Contact>> _toList(Database db) async {
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Contact> contacts = List();
    result.forEach((map) {
      final Contact contact =
          Contact(map[_contactId], map[_name], map[_accountNumber]);
      contacts.add(contact);
    });
    return contacts;
  }
}
