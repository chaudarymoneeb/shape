// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'module_detail_page.dart';

class DashboardPage extends StatelessWidget {
  final double totalPowerConsumption = 3.2;
  final double currentBill = 15250;
  final int activeDevices = 7;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummarySection(),
          SizedBox(height: 20),
          _buildSection("Power & Safety", [
            _buildModuleCard(
              context,
              "Appliance Power Monitoring",
              "3.2 kW",
              Icons.flash_on,
              "Power Monitoring",
            ),
            _buildModuleCard(
              context,
              "Voltage Surge Detection",
              "Safe - 230V",
              Icons.bolt,
              "Surge Detection",
            ),
            _buildModuleCard(
              context,
              "Leakage Detection",
              "No Leakage",
              Icons.security,
              "Leakage Detection",
            ),
            _buildModuleCard(
              context,
              "Overload Protection",
              "78%",
              Icons.shield,
              "Overload Protection",
            ),
          ]),
          _buildSection("Smart Environment", [
            _buildModuleCard(
              context,
              "Room Occupancy",
              "Living Room Occupied",
              Icons.person,
              "Room Occupancy",
            ),
            _buildModuleCard(
              context,
              "Voice Control",
              "Alexa Connected",
              Icons.mic,
              "Voice Control",
            ),
          ]),
          _buildSection("Control & Insights", [
            _buildModuleCard(
              context,
              "Mobile Control",
              "7 Devices Online",
              Icons.phone_android,
              "Mobile Control",
            ),
            _buildModuleCard(
              context,
              "Energy Bills",
              "PKR 15,250",
              Icons.receipt,
              "Energy Bills",
            ),
            _buildModuleCard(
              context,
              "AI Insights",
              "3 Suggestions",
              Icons.psychology,
              "AI Insights",
            ),
          ]),
          _buildSection("Safety & Cloud", [
            _buildModuleCard(
              context,
              "Fire/Smoke Detection",
              "All Clear",
              Icons.local_fire_department,
              "Fire Detection",
            ),
            _buildModuleCard(
              context,
              "Cloud Monitoring",
              "Online",
              Icons.cloud,
              "Cloud Monitoring",
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(Icons.flash_on, "Power", "3.2 kW"),
          _buildSummaryItem(Icons.receipt, "Bill", "PKR 15,250"),
          _buildSummaryItem(Icons.devices, "Devices", "7"),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        SizedBox(height: 6),
        Text(title, style: TextStyle(color: Colors.white)),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: children,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildModuleCard(
    BuildContext context,
    String title,
    String status,
    IconData icon,
    String moduleName,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleDetailPage(moduleName: moduleName),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.blue),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
