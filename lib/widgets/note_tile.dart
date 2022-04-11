import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

// ignore: must_be_immutable
class NoteTile extends StatelessWidget {
  Note item;

  NoteTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "note-viewer", arguments: item.toJson());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[400] as Color),
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
