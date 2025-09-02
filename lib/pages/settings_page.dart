// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double tariff = 24.5;
  double overloadLimit = 5.0;
  bool notifications = true;
  bool voiceControl = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          "Settings & Configuration",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildTariffCard(),
        _buildSafetyCard(),
        _buildNotificationCard(),
        _buildAccountCard(),
      ],
    );
  }

  Widget _buildTariffCard() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Colors.blue),
        title: Text("Tariff Rate: PKR ${tariff.toStringAsFixed(2)}/kWh"),
        trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
      ),
    );
  }

  Widget _buildSafetyCard() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(Icons.shield, color: Colors.red),
        title: Text("Overload Limit: ${overloadLimit.toStringAsFixed(1)} kW"),
        trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
      ),
    );
  }

  Widget _buildNotificationCard() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: notifications,
            onChanged: (val) => setState(() => notifications = val),
          ),
          SwitchListTile(
            title: Text("Enable Voice Control"),
            value: voiceControl,
            onChanged: (val) => setState(() => voiceControl = val),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCard() {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile Settings"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text("Wi-Fi Configuration"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text("Cloud Backup"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Security Settings"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
