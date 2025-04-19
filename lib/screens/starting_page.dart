import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/screens/login_page.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black,
        body:Container(
          padding: EdgeInsets.symmetric(horizontal: 70),
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/icons/spotify.256x256.png" ,width: 50,
                                    height: 50,),
          Spacer(),
          Column(
            children: [
            Text(
            "Millions of songs",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight:FontWeight.bold,
          ),
          ),
          SizedBox(height: 10,),
          Text(
            "Free on spotify",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight:FontWeight.bold,
          ),
          ),
          ],),
           Spacer(),
          SizedBox(height: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoButton(
            onPressed: (){},
           color: Colors.green,
           borderRadius: BorderRadius.circular(30),
            child:Text(
              "sign up for free" , 
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
                ),
            ),
           ),
           SizedBox(height: 10),
           OutlinedButton(
            onPressed: (){},
             style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white,width: 2),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))
              ),
             child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                           Image.asset("assets/icons/facebook.256x256.png",height: 50,),
                           SizedBox(width: 10),
                           Text("Continue with Facebook",style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                  ),),
                          ],
                          ),
             ),
           ),
            SizedBox(height: 10),
           OutlinedButton(
            onPressed: (){},
             style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white,width: 2),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))
              ),
             child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                           Image.asset("assets/icons/apple.213x256.png",height: 50,),
                           SizedBox(width: 10),
                           Text("Continue with Apple",style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                  ),),
                          ],
                          ),
             ),
           ),
            SizedBox(height: 10),
           OutlinedButton(
            onPressed: (){
              //Navigator.pop(context);
            },
             style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white,width: 2),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))
              ),
             child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                           Image.asset("assets/icons/gmail.256x194.png",height: 50,),
                           SizedBox(width: 10),
                           Text("Continue with Gmail",style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                  ),),
                          ],
                          ),
             ),
           ),
           SizedBox(height: 10),
           TextButton(
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),
            );
           }, 
           child:Text(
            "login",
           style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize:20 ),),
           ),
           ],
           ),
          Spacer(),
           
          ],

        ),
        ),
        )
        );
  }
}