// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Energy Reports & Analytics",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          // Weekly Energy Chart
          Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(16),
              height: 280,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = [
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat",
                            "Sun",
                          ];
                          return Text(days[value.toInt() % 7]);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 15),
                        FlSpot(1, 18),
                        FlSpot(2, 12),
                        FlSpot(3, 16),
                        FlSpot(4, 20),
                        FlSpot(5, 25),
                        FlSpot(6, 22),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Monthly Bill Comparison
          Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBillItem("Last Month", "PKR 14,200", Colors.grey),
                  _buildBillItem("This Month", "PKR 15,250", Colors.blue),
                  _buildBillItem("Projected", "PKR 16,100", Colors.orange),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Top Energy Consumers
          Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Energy Consumers",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  _buildDeviceUsageItem("Air Conditioner", 2.5, Colors.red),
                  _buildDeviceUsageItem("Water Heater", 1.8, Colors.orange),
                  _buildDeviceUsageItem("Refrigerator", 0.8, Colors.blue),
                  _buildDeviceUsageItem("Washing Machine", 0.6, Colors.green),
                  _buildDeviceUsageItem("Lights & Fans", 0.4, Colors.amber),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillItem(String period, String amount, Color color) {
    return Column(
      children: [
        Text(period, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceUsageItem(String device, double power, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 12),
          Expanded(child: Text(device)),
          Text("$power kW", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ignore: body_might_complete_normally_nullable
Widget? LineChart(lineChartData) {}
