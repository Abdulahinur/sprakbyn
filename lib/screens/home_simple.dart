import 'package:flutter/material.dart';

class HomeSimple extends StatelessWidget {
  const HomeSimple({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ['Bygg & Konstruktion', 'Verktyg • Säkerhet • Frågor'],
      ['Transport', 'Rutter • Leverans • Lastning'],
      ['Städ', 'Utrustning • Material • Rutiner'],
      ['Äldreomsorg', 'Omsorg • Läkemedel'],
      ['Restaurang & Kök', 'Beställning • Hygien'],
      ['Butik & Kassa', 'Kunder • Returer'],
      ['Sjukvård & Vårdbiträde', 'Vård • Utrustning'],
      ['Industri & Lager', 'Pallar • Plock'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Språkbyn – Kategorier (demo)')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.1,
        ),
        itemCount: items.length,
        itemBuilder: (_, i) {
          final title = items[i][0];
          final subtitle = items[i][1];
          return InkWell(
            onTap: () => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Öppnar $title… (kommer snart)'))),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F7FA),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Icon(Icons.image, size: 36, color: Color(0xFF667085))),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF667085), fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
