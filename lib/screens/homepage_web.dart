import 'package:flutter/material.dart';

class HomepageWeb extends StatelessWidget {
  const HomepageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5), // Light grey background
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome title
            Text(
              'Välkommen till Språkbyn!',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Lär dig svenska för jobbet. Enkelt. Snabbt. Roligt.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Swedish image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/sweden_landscape.jpg',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to course start
                  },
                  child: const Text('Starta kurs'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {
                    // TODO: Navigate to category list
                  },
                  child: const Text('Utforska kategorier'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Category preview
            Text(
              'Populära kategorier',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/dala_horse.png',
                  height: 40,
                ),
                title: const Text('Bygg & Konstruktion'),
                subtitle: const Text('Ord och fraser för byggarbetsplatsen'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // TODO: Navigate to construction category
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

