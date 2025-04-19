import 'dart:convert';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  // Fonction de connexion
  Future<Map<String, dynamic>> loginController(UserModel user) async {
    var reqBody = {"email": user.email, "password": user.password};

    try {
      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var myToken = jsonResponse['token'];

        // Sauvegarder le token dans SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', myToken);

        return {
          "status": true,
          "success": "Connexion réussie",
          "token": myToken,
        };
      } else {
        var jsonResponse = jsonDecode(response.body);
        return {
          "status": false,
          "error": jsonResponse['message'] ?? "Erreur de connexion",
        };
      }
    } catch (e) {
      print("Erreur de connexion: $e");
      return {
        "status": false,
        "error": "Erreur de connexion, vérifie ta connexion réseau",
      };
    }
  }

  // Fonction de déconnexion
  Future<Map<String, dynamic>> logoutController(UserModel user) async {
    var response = await http.post(
      Uri.parse(logout),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == true) {
      // Supprimer le token lors de la déconnexion
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      
      return {"status": true, "success": "Déconnexion réussie"};
    } else {
      return {
        "status": false,
        "error": jsonResponse['message'] ?? "Échec de la déconnexion",
      };
    }
  }

  // Vérification de l'état de la connexion (token présent)
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
}
