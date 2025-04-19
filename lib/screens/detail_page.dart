import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/models/project_model.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.projectModel});
  final ProjectModel projectModel;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          title: Text(widget.projectModel.titre,
          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
        ),
        
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.projectModel.id,
                  child: Image.asset(
                  widget.projectModel.photo,
                  width: double.infinity,
                  fit: BoxFit.fill,),
                ),
              Text(widget.projectModel.categorie,
              style: TextStyle(color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              ),
              ),
              SizedBox(height: 10),
              Text(widget.projectModel.categorie,
              style: TextStyle(color:Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              ),
              ),
              SizedBox(height: 10),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                IconButton(
                  onPressed: (){},
                   icon:Icon(CupertinoIcons.heart,color: Colors.grey) 
                  ),
                  IconButton(
                  onPressed: (){},
                   icon:Icon(CupertinoIcons.download_circle,color: Colors.grey) 
                  ),
                  IconButton(
                  onPressed: (){},
                   icon:Icon(CupertinoIcons.ellipsis_vertical,color: Colors.grey) 
                  ),
                  Spacer(),
                  IconButton(
                  onPressed: (){},
                   icon:Icon(CupertinoIcons.add_circled,color: Colors.grey) 
                  ),
                  IconButton(
                  onPressed: (){},
                   icon:Icon(CupertinoIcons.play_rectangle,color: Colors.grey) 
                  ),
              ],
              ),
              SizedBox(height: 10),
             ReadMoreText(
              widget.projectModel.description,
              trimMode: TrimMode.Line,
              trimLines:4,
              style: TextStyle(color: Colors.white),
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
            
            ],
            ),
          ),
        ),
        ),
        );
  }
}