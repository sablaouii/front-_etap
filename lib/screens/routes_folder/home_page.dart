import 'package:flutter/material.dart';
import 'package:newapp/models/project_model.dart';
import 'package:newapp/screens/components/nouvaute_verticale_widget.dart';

import '../components/nouvaute_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [Text("List Horizentale"),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: projectlist.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: 
            ((context,index)=>NouvauteWidget(projectModel:projectlist[index]))
            ),
        ),
        Text("Liste vertical"),
        Expanded(
          child: ListView.builder(
            itemCount:projectlist.length,
            scrollDirection:Axis.vertical,
            itemBuilder:
             ((context,index)=>NouvauteVerticalWidget(projectModel: projectlist[index],)),
          
          ),
        ),

        ],
      ),
    );
  }
}

