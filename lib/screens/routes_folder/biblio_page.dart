import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiblioPage extends StatefulWidget {
  const BiblioPage({super.key});

  @override
  State<BiblioPage> createState() => _BiblioPageState();
}

class _BiblioPageState extends State<BiblioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("hello from biblio page ")

        ],
      ),
    );
  }
}