import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  // ✅ Utilise 10.0.2.2 pour Android Emulator au lieu de localhost
  static const String baseUrl = 'http://10.0.2.2:5000';

  // ✅ Appel vers la bonne route backend
  Future<Map<String, dynamic>> setOrUpdatePreference(String department) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token manquant. Veuillez vous reconnecter.');
    }

    final url = Uri.parse('$baseUrl/preferences/setOrUpdatePreference');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'department': department}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur lors de la mise à jour de la préférence');
    }
  }
}
