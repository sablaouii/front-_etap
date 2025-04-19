import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newapp/models/project_model.dart';

class NouvauteVerticalWidget extends StatelessWidget {
  const NouvauteVerticalWidget({
    super.key,required this.projectModel
  });
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.all(10),
     height: 300,
     child: Column(children: [
       Expanded(child: Image.asset(projectModel.photo,
       fit: BoxFit.cover ,
       ),
       ),
       SizedBox(height: 10),
       SizedBox(height: 5),
       Text(
              projectModel.titre,
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:16
              ),
              ),
            Text(
              projectModel.categorie,
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:16
              ),
              ),
     ],)
                );
  }
}