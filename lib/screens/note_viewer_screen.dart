import 'package:flutter/material.dart';
import 'package:notes/provider/db_provider.dart';
import 'package:provider/provider.dart';

class NoteViewer extends StatelessWidget {
  const NoteViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic item = ModalRoute.of(context)?.settings.arguments;
    // print(item['title']);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(item['title'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'insert-edit',
                  arguments: item);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: const Icon(
                Icons.edit,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<DBProvider>(context, listen: false)
                  .deleteItem(item["id"]);
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: const Icon(
                Icons.delete,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,

          child: Text(item["body"]),
        ),
      ),
    );
  }
}
