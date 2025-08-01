import 'package:flutter/material.dart';

class HealthcareScreen extends StatelessWidget {
  const HealthcareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sjukvård & Vårdbiträde'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.local_hospital, size: 80, color: Colors.redAccent),
              SizedBox(height: 20),
              Text(
                'Här lär du dig viktiga ord och fraser\nför att jobba inom vård och omsorg.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                'Exempel på innehåll:\n- Patient\n- Medicin\n- Blodtryck\n- Matning\n- Städa rum',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
