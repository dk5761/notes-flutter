import 'package:flutter/material.dart';
import 'package:notes/provider/db_provider.dart';
import 'package:notes/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  String appBarTitle = "Add";

  bool isNew = true;
  String? id;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final dynamic item = ModalRoute.of(context)?.settings.arguments;

    if (isNew) {
      if (item != null) {
        if (item["id"] != null) {
          id = item["id"];
          titleController.text = item['title'];
          bodyController.text = item['body'];
        }
      }

      isNew = false;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titleController.dispose();
    bodyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DBProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(appBarTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: const Center(
                  child: Icon(Icons.check_rounded),
                )),
            onTap: () {
              if (titleController.text.toString() != "") {
                if (id != null) {
                  provider.updateItem(
                      id as String,
                      titleController.text.toString(),
                      bodyController.text.toString());
                } else {
                  provider.addItem(titleController.text.toString(),
                      bodyController.text.toString());
                }
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (Route<dynamic> route) => false);
              }
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 12),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          TextField(
            cursorColor: Theme.of(context)
                .inputDecorationTheme
                .labelStyle
                ?.decorationColor,
            controller: titleController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .border
                          ?.borderSide
                          .color as Color)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .inputDecorationTheme
                        .labelStyle
                        ?.decorationColor as Color),
              ),
              labelText: 'Title',
              labelStyle: TextStyle(
                  color: Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.decorationColor),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: TextField(
              cursorColor: Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.decorationColor,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              controller: bodyController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .border
                            ?.borderSide
                            .color as Color)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .labelStyle
                          ?.decorationColor as Color),
                ),
                labelText: 'Content',
                labelStyle: TextStyle(
                    color: Theme.of(context)
                        .inputDecorationTheme
                        .labelStyle
                        ?.decorationColor),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
