import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:newapp/screens/login_page.dart';
import 'package:newapp/screens/logo_page.dart';
import 'package:newapp/screens/preference_page.dart';
import 'package:newapp/screens/routes_page.dart';
import 'package:newapp/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs =await SharedPreferences.getInstance();
  String? token =prefs.getString('token');
  runApp(MyApp(token:token));
}



class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key,this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :false,
      title: 'MyETAP',
      home :token !=null && !JwtDecoder.isExpired(token!)
      ?LogoPage(token:token!)
      :const PreferencePage()

    
    
    );
  }
}