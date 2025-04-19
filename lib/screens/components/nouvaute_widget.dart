import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/models/project_model.dart';
import 'package:newapp/screens/detail_page.dart';

class NouvauteWidget extends StatelessWidget {
  const NouvauteWidget({
    super.key,required this.projectModel
  });
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:() {
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>DetailPage(projectModel:projectModel)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 150,
        //color: Colors.grey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: 
            Hero(
              tag: projectModel.id,
              child: Image.asset(projectModel.photo,
              fit: BoxFit.cover
              ),
            ),
            ),
          SizedBox(height: 5,),
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
          
        ],),
        ),
    );
  }
}