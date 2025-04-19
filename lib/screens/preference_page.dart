import 'package:flutter/material.dart';
import 'package:newapp/services.dart/preference_service.dart';



class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  final List<String> departments = [
    'lExploration ',
    'Développement',
    'Production ',
    'Commercialisation',
    'Direction des Projets dÉnergies Renouvelables',
    'Ressources Humaines',
    'Financière',
    'Juridique',
    'Direction de la Communication',
    'Sécurité',
  ];

  String? selectedDepartment;
  bool isLoading = false;

  void updatePreference() async {
    if (selectedDepartment == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final result = await PreferenceService().setOrUpdatePreference(selectedDepartment!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'] ?? 'Préférence mise à jour')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Choisir votre département')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedDepartment,
              items: departments.map((dept) {
                return DropdownMenuItem(
                  value: dept,
                  child: Text(dept),
                );
              }).toList(),
              onChanged: (val) => setState(() => selectedDepartment = val),
              decoration: InputDecoration(
                labelText: 'Département',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : updatePreference,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}