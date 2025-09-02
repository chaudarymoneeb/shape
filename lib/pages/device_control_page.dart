// ignore_for_file: deprecated_member_use, unnecessary_to_list_in_spreads, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DeviceControlPage extends StatefulWidget {
  @override
  _DeviceControlPageState createState() => _DeviceControlPageState();
}

class _DeviceControlPageState extends State<DeviceControlPage> {
  Map<String, bool> devices = {
    "Living Room Lights": true,
    "Bedroom Fan": false,
    "Kitchen Lights": false,
    "Air Conditioner": true,
    "Water Heater": false,
    "Refrigerator": true,
    "Washing Machine": false,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          "Device Control Center",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildRoomSection("Living Room", [
          "Living Room Lights",
          "Air Conditioner",
        ]),
        _buildRoomSection("Bedroom", ["Bedroom Fan", "Water Heater"]),
        _buildRoomSection("Kitchen", ["Kitchen Lights", "Refrigerator"]),
        _buildRoomSection("Utilities", ["Washing Machine"]),
      ],
    );
  }

  Widget _buildRoomSection(String room, List<String> roomDevices) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...roomDevices.map((device) => _buildDeviceTile(device)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTile(String device) {
    return SwitchListTile(
      title: Text(device),
      value: devices[device]!,
      activeColor: Colors.green,
      onChanged: (val) {
        setState(() {
          devices[device] = val;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$device turned ${val ? "ON" : "OFF"}"),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}
