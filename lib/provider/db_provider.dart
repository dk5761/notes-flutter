import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:notes/utils/db_helper.dart';
import 'package:uuid/uuid.dart';

import '../models/note.dart';

class DBProvider extends ChangeNotifier {
  List _items = [];

  int get length => _items.length;

  List get items {
    return [..._items];
  }

  Note note(String id) {
    return _items.firstWhere(
      (e) => e.id == id,
      orElse: () => null,
    );
  }

  Future addItem(String title, String body) async {
    final date = DateTime.now();

    final note = Note(Uuid().v4(), title, body,
        DateFormat('EEE h:mm a, dd/MM/yyyy').format(date));

    _items.insert(0, note);
    notifyListeners();

    await DBHelper.insert({
      'id': note.id,
      'title': note.title,
      'body': note.body,
      'dt': note.date
    });
  }

  Future updateItem(String id, String title, String body) async {
    final date = DateTime.now();

    final notex = Note(
        id, title, body, DateFormat('EEE h:mm a, dd/MM/yyyy').format(date));

    _items[_items.indexWhere((note) => note.id == id)] = notex;

    notifyListeners();

    await DBHelper.insert(
        {'id': id, 'title': notex.title, 'body': notex.body, 'dt': notex.date});
  }

  Future deleteItem(String id) async {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
    return DBHelper.delete(id);
  }

  Future getNotes() async {
    final notesList = await DBHelper.getAllItems();

    _items = notesList
        .map(
          (item) => Note(item['id'], item['title'], item['body'], item['dt']),
        )
        .toList();

    notifyListeners();
  }
}
