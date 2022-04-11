import 'package:intl/intl.dart';

class Note {
  final String _id;
  final String _title;
  final String _body;
  final String _date;

  Note(this._id, this._title, this._body, this._date);

  String get id => _id;
  String get title => _title;
  String get body => _body;
  String get date => _date;

  Map<String, dynamic> toJson() => {
        'id': _id,
        'title': _title,
        'body': _body,
        'date': _date,
      };
}
