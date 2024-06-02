// ignore_for_file: library_private_types_in_public_api

import 'package:daycare_app/Menu/components/Screens/display_child_activity_screen.dart';
import 'package:daycare_app/Menu/components/Screens/display_child_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daycare_app/models/form_data.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  FormData? _childData;
  FormData? _activityData;

  _loadChildData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _childData = FormData(
        name: prefs.getString('childName') ?? '',
        date: DateTime.tryParse(prefs.getString('childDate') ?? '') ?? DateTime.now(),
        arrival: prefs.getString('childArrival') ?? '',
        bodyTemperature: prefs.getDouble('childBodyTemperature') ?? 0.0,
        conditions: prefs.getString('childConditions') ?? '',
        meals: [],
        toilets: [],
        rests: [],
        bottles: [],
        shower: '',
        vitamin: '',
        notesForParents: '',
        itemsNeeded: [],
      );
    });
  }

  _loadActivityData() async {
    // Implement loading activity data if needed
  }

  @override
  void initState() {
    super.initState();
    _loadChildData();
    _loadActivityData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayChildDataScreen(
                      childName: _childData!.name,
                      childDate: _childData!.date,
                      childArrival: _childData!.arrival,
                      childBodyTemperature: _childData!.bodyTemperature,
                      childConditions: _childData!.conditions,
                    ),
                  ),
                );
              },
              child: const Text('Lihat Data Anak'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChildActivityScreen(
                      childData: _childData,
                      activityData: _activityData,
                    ),
                  ),
                );
              },
              child: const Text('Kegiatan Anak (Ortu)'),
            ),
          ],
        ),
      ),
    );
  }
}
