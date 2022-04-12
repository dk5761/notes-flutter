import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/provider/theme_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NoteTile extends StatelessWidget {
  Note item;

  NoteTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "note-viewer", arguments: item.toJson());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(
                color: themeProvider.isDarkMode
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorDark),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(item.body,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 16)),
          )
        ]),
      ),
    );
  }
}
