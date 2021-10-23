import 'package:flutter/material.dart';
import 'package:taller_intro_flutter/models/models.dart';
import 'package:taller_intro_flutter/screens/add_screen.dart';
import 'package:taller_intro_flutter/widgets/search_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];
  List<Contact> filteredList = [];

  Widget bodyBuilder() {
    if (contacts.length == 0)
      return Center(
        child: Text("No hay contactos agregados"),
      );

    if (filteredList.length == 0)
      return Center(
        child: Text("No hay resultados para tu busqueda"),
      );

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final currentContact = filteredList[index];

        return Dismissible(
          key: Key(currentContact.id),
          onDismissed: (direction) {
            setState(() {
              contacts.removeAt(index);
              filteredList = contacts;
            });
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: currentContact.color,
              child: Text(currentContact.name.characters.first.toUpperCase()),
              radius: 18,
            ),
            title: Text("${currentContact.name} ${currentContact.lastname}"),
          ),
        );
      },
    );
  }

  void search(String query) {
    setState(() {
      filteredList = contacts
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.lastname.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SearchAppBar(
          onSearch: search,
        ),
      ),
      body: bodyBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddScreen(
                contactSaved: (contact) {
                  setState(() {
                    contacts.add(contact);
                    filteredList = contacts;
                  });
                },
              );
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
