import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/screens/routes_folder/biblio_page.dart';
import 'package:newapp/screens/routes_folder/files_page.dart';
import 'package:newapp/screens/routes_folder/home_page.dart';
import 'package:newapp/screens/routes_folder/profile_page.dart';
import 'package:newapp/screens/routes_folder/search_page.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  List<Widget> _screens =[
  HomePage(),
  SearchPage(),
  BiblioPage(),
  ProfilePage(),
  ];
  List<String> _titles =[
  "home",
  "search",
  "biblio",
  "profile",
  ];
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex],
        style: TextStyle( fontSize: 30),
        ),
        
        ),
        drawer: Drawer(width:MediaQuery.of(context).size.width *0.6,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 116, 115, 115)),
          child: UserAccountsDrawerHeader(
            accountName: Text("Sablaoui Mariem"), 
            accountEmail: Text("sablaouimariem@gmail.com"),
            currentAccountPicture:CircleAvatar(backgroundImage: AssetImage(
              "assets/images/pic2.jpg"),
              ),
              currentAccountPictureSize: Size.square(50),
            decoration: BoxDecoration(color: Colors.grey),
            ),
            ),
            ListTile(
              leading: Icon(Icons.file_copy_rounded),
              title: Text("My Files"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FilesPage()),
              );
            },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("change profile"),
            onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text("download"),
            onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
            onTap: (){},
            ),
            ],),
        ),
        body:_screens[_selectedIndex],
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.shifting,// icon avec animation
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 82, 82, 82),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"search",),
          BottomNavigationBarItem(icon: Icon(Icons.book_online_rounded),label:"biblio",),
         BottomNavigationBarItem(icon: Icon(Icons.person),label:"profile",),

   
        ],
        onTap: _onItemTapped,
        currentIndex:_selectedIndex,
        ),
    );
  }
}