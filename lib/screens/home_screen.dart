import 'package:flutter/material.dart';
import 'package:notes/provider/db_provider.dart';
import 'package:notes/screens/edit_screen.dart';
import 'package:notes/widgets/note_tile.dart';
import 'package:notes/widgets/theme_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DBProvider>(context, listen: false).getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            final items = Provider.of<DBProvider>(context).items;
            return Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  "Notes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                actions: [
                  Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const ThemeButton()),
                  )
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Dismissible(
                        onDismissed: (direction) {
                          Provider.of<DBProvider>(context, listen: false)
                              .deleteItem(items[index].id);
                        },
                        key: Key(items[index].id),
                        child: NoteTile(
                          key: Key(items[index].id),
                          item: items[index],
                        ),
                      ));
                },
                itemCount: items.length,
              ),
              floatingActionButton: FloatingActionButton(
                // backgroundColor: Colors.black,
                heroTag: null,
                child: const Icon(Icons.add, size: 23),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoteEditScreen()));
                },
              ),
            );
          }
        }
        return Container();
      },
    );
  }
}
