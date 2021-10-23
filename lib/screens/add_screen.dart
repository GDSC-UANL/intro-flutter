// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:taller_intro_flutter/models/models.dart';

class AddScreen extends StatefulWidget {
  Function(Contact contact) contactSaved;

  AddScreen({
    Key? key,
    required this.contactSaved,
  }) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  Contact contact = Contact();

  bool isButtonDisabled() {
    return contact.name.isEmpty ||
        contact.lastname.isEmpty ||
        contact.email.isEmpty ||
        contact.phonenumber.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Agregar Contacto",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                contact.name = value;
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Nombre"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                contact.lastname = value;
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Apellido"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                contact.phonenumber = value;
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Teléfono"),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                contact.email = value;
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Email"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: isButtonDisabled()
                ? null
                : () {
                    widget.contactSaved(contact);
                    Navigator.pop(context);
                  },
            child: Text("Guardar"),
          )
        ],
      ),
    );
  }
}
