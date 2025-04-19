import 'package:flutter/material.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(title: Text("Files"),),
      body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/poo.png"),
          fit: BoxFit.cover,
      ),
      ),
      child: Column(
        children: [
          Text("Hello from Files page",style: TextStyle(color: Colors.white),),
        ],
      ),
      ),

      ),
    );
  
  }
}