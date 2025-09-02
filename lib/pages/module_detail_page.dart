// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ModuleDetailPage extends StatelessWidget {
  final String moduleName;
  // ignore: prefer_const_constructors_in_immutables
  ModuleDetailPage({required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(moduleName), backgroundColor: Colors.blue),
      body: Padding(padding: EdgeInsets.all(16), child: _buildContent()),
    );
  }

  Widget _buildContent() {
    switch (moduleName) {
      case "Power Monitoring":
        return _buildSimpleCard(
          "Appliance Power Monitoring",
          "Current: 3.2 kW",
        );
      case "Surge Detection":
        return _buildSimpleCard(
          "Voltage Surge Detection",
          "Status: Safe (230V)",
        );
      case "Leakage Detection":
        return _buildSimpleCard("Leakage Detection", "No Leakage Detected");
      case "Overload Protection":
        return _buildSimpleCard("Overload Protection", "Current Load: 78%");
      case "Room Occupancy":
        return _buildSimpleCard(
          "Smart Room Occupancy",
          "Living Room: Occupied",
        );
      case "Voice Control":
        return _buildSimpleCard("Voice Control", "Alexa Connected");
      case "Mobile Control":
        return _buildSimpleCard("Mobile App Control", "7 Devices Online");
      case "Energy Bills":
        return _buildSimpleCard("Energy Bills", "Current: PKR 15,250");
      case "AI Insights":
        return _buildSimpleCard(
          "AI Suggestions",
          "3 new suggestions available",
        );
      case "Fire Detection":
        return _buildSimpleCard("Fire/Smoke Detection", "All Clear");
      case "Cloud Monitoring":
        return _buildSimpleCard("Cloud Monitoring", "Last Sync: 2 mins ago");
      default:
        return Center(child: Text("Details not available"));
    }
  }

  Widget _buildSimpleCard(String title, String content) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(content, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
